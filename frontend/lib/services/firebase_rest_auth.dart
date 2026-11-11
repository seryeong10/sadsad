import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

/// Firebase password authentication for web builds without registering a new
/// Firebase web client. Passwords go directly to Google's HTTPS Auth API.
class FirebaseRestAuth {
  static const enabled = kIsWeb && bool.fromEnvironment('FIREBASE_REST_AUTH');
  static const _apiKey = String.fromEnvironment('FIREBASE_API_KEY');
  static const _sessionKey = 'avata_firebase_rest_session_v1';
  static Map<String, dynamic>? _session;

  static Future<Map<String, dynamic>> _call(
      String method, Map<String, dynamic> body) async {
    if (_apiKey.isEmpty) throw Exception('Firebase 인증 설정이 없습니다.');
    final response = await http
        .post(
          Uri.https('identitytoolkit.googleapis.com', '/v1/accounts:$method',
              {'key': _apiKey}),
          headers: const {'Content-Type': 'application/json'},
          body: jsonEncode(body),
        )
        .timeout(const Duration(seconds: 20));
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    if (response.statusCode != 200) {
      final code = (data['error'] as Map?)?['message']?.toString() ?? '';
      throw Exception(switch (code.split(' : ').first) {
        'EMAIL_EXISTS' => '이미 사용 중인 아이디예요.',
        'INVALID_LOGIN_CREDENTIALS' || 'EMAIL_NOT_FOUND' || 'INVALID_PASSWORD' =>
          '아이디 또는 비밀번호가 맞지 않아요.',
        'USER_DISABLED' => '사용이 중지된 계정입니다.',
        'OPERATION_NOT_ALLOWED' || 'PASSWORD_LOGIN_DISABLED' =>
          'Firebase 이메일·비밀번호 로그인이 활성화되어 있지 않습니다.',
        'TOO_MANY_ATTEMPTS_TRY_LATER' => '잠시 후 다시 시도해주세요.',
        'WEAK_PASSWORD' => '비밀번호를 더 안전하게 입력해주세요.',
        _ => '인증 요청에 실패했습니다. ($code)',
      });
    }
    return data;
  }

  static Future<void> signUp(String id, String password, String name) async {
    final data = await _call('signUp', {
      'email': '$id@avata.local',
      'password': password,
      'returnSecureToken': true,
    });
    await _call('update', {
      'idToken': data['idToken'],
      'displayName': name,
      'returnSecureToken': false,
    });
    // The app's signup flow returns to the login page.
  }

  static Future<void> login(String id, String password) async {
    final data = await _call('signInWithPassword', {
      'email': '$id@avata.local',
      'password': password,
      'returnSecureToken': true,
    });
    _session = {
      'uid': data['localId'],
      'name': data['displayName'] ?? '',
      'idToken': data['idToken'],
      'refreshToken': data['refreshToken'],
      'expiresAt': DateTime.now()
          .add(Duration(seconds: int.parse(data['expiresIn'].toString()) - 60))
          .millisecondsSinceEpoch,
    };
    await _save();
  }

  static Future<bool> isSignedIn() async {
    if (_session == null) {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_sessionKey);
      if (raw == null) return false;
      try {
        _session = jsonDecode(raw) as Map<String, dynamic>;
      } catch (_) {
        await logout();
        return false;
      }
    }
    try {
      if ((_session!['expiresAt'] as int? ?? 0) <=
          DateTime.now().millisecondsSinceEpoch) {
        final response = await http
            .post(
              Uri.https('securetoken.googleapis.com', '/v1/token',
                  {'key': _apiKey}),
              body: {
                'grant_type': 'refresh_token',
                'refresh_token': _session!['refreshToken'].toString(),
              },
            )
            .timeout(const Duration(seconds: 20));
        if (response.statusCode != 200) {
          await logout();
          return false;
        }
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        _session!['idToken'] = data['id_token'];
        _session!['refreshToken'] = data['refresh_token'];
        _session!['expiresAt'] = DateTime.now()
            .add(Duration(seconds: int.parse(data['expires_in'].toString()) - 60))
            .millisecondsSinceEpoch;
        await _save();
      }
      final data = await _call('lookup', {'idToken': _session!['idToken']});
      final user = (data['users'] as List).first as Map;
      _session!['uid'] = user['localId'];
      _session!['name'] = user['displayName'] ?? '';
      return true;
    } catch (_) {
      return false;
    }
  }

  static Future<(String, String)> profileIdentity() async {
    if (!await isSignedIn()) return ('', '나의 프로필');
    return (_session!['uid'].toString(), _session!['name'].toString());
  }

  static Future<String?> idToken() async {
    if (!await isSignedIn()) return null;
    return _session?['idToken'] as String?;
  }

  static Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_sessionKey, jsonEncode(_session));
  }

  static Future<void> logout() async {
    _session = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_sessionKey);
  }
}
