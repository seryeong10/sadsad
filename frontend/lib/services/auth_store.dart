import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthStore {
  static bool get isFirebaseReady => Firebase.apps.isNotEmpty;

  static Future<bool> isSignedIn() async {
    if (isFirebaseReady) {
      return FirebaseAuth.instance.currentUser != null;
    }

    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_activeUserKey) != null;
  }

  static Future<String> savedLoginId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_savedLoginIdKey) ?? '';
  }

  static Future<void> saveLoginId(String id) async {
    final normalizedId = _normalizeId(id);
    final prefs = await SharedPreferences.getInstance();
    if (normalizedId.isEmpty) {
      await prefs.remove(_savedLoginIdKey);
      return;
    }

    await prefs.setString(_savedLoginIdKey, normalizedId);
  }

  static Future<void> clearSavedLoginId() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_savedLoginIdKey);
  }

  static Future<bool> isIdAvailable(String id) async {
    final normalizedId = _normalizeId(id);
    if (normalizedId.isEmpty) return false;

    if (isFirebaseReady) {
      try {
        final snapshot = await FirebaseFirestore.instance
            .collection('users')
            .where('loginId', isEqualTo: normalizedId)
            .limit(1)
            .get();
        return snapshot.docs.isEmpty;
      } on FirebaseException {
        return false;
      }
    }

    final accounts = await _localAccounts();
    return !accounts.containsKey(normalizedId);
  }

  static Future<AuthResult> signUp({
    required String name,
    required String id,
    required String password,
  }) async {
    final normalizedId = _normalizeId(id);
    if (normalizedId.isEmpty || name.trim().isEmpty || password.isEmpty) {
      return const AuthResult.failure('입력값을 다시 확인해주세요.');
    }

    if (isFirebaseReady) {
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _idToEmail(normalizedId),
          password: password,
        );
        final user = credential.user;
        if (user == null) {
          return const AuthResult.failure('회원가입에 실패했어요.');
        }

        await user.updateDisplayName(name.trim());
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'name': name.trim(),
          'loginId': normalizedId,
          'createdAt': FieldValue.serverTimestamp(),
          'provider': 'password',
        });
        await FirebaseAuth.instance.signOut();
        return const AuthResult.success();
      } on FirebaseAuthException catch (error) {
        return AuthResult.failure(_firebaseMessage(error));
      }
    }

    final accounts = await _localAccounts();
    if (accounts.containsKey(normalizedId)) {
      return const AuthResult.failure('이미 사용 중인 아이디예요.');
    }

    accounts[normalizedId] = {
      'name': name.trim(),
      'password': password,
    };
    await _saveLocalAccounts(accounts);
    return const AuthResult.success();
  }

  static Future<AuthResult> login({
    required String id,
    required String password,
    bool saveId = false,
  }) async {
    final normalizedId = _normalizeId(id);
    if (normalizedId.isEmpty || password.isEmpty) {
      return const AuthResult.failure('아이디와 비밀번호를 입력해주세요.');
    }

    if (isFirebaseReady) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _idToEmail(normalizedId),
          password: password,
        );
        if (saveId) {
          await saveLoginId(normalizedId);
        } else {
          await clearSavedLoginId();
        }
        return const AuthResult.success();
      } on FirebaseAuthException catch (error) {
        return AuthResult.failure(_firebaseMessage(error));
      }
    }

    final accounts = await _localAccounts();
    final account = accounts[normalizedId];
    if (account == null || account['password'] != password) {
      return const AuthResult.failure('아이디 또는 비밀번호가 맞지 않아요.');
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_activeUserKey, normalizedId);
    if (saveId) {
      await saveLoginId(normalizedId);
    } else {
      await clearSavedLoginId();
    }
    return const AuthResult.success();
  }

  static Future<void> logout() async {
    if (isFirebaseReady) {
      await FirebaseAuth.instance.signOut();
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_activeUserKey);
  }

  static String _normalizeId(String id) {
    return id.trim().toLowerCase();
  }

  static String _idToEmail(String id) {
    return '$id@avata.local';
  }

  static Future<Map<String, dynamic>> _localAccounts() async {
    final prefs = await SharedPreferences.getInstance();
    final rawJson = prefs.getString(_accountsKey);
    if (rawJson == null || rawJson.isEmpty) return {};

    final decoded = jsonDecode(rawJson);
    if (decoded is Map<String, dynamic>) return decoded;
    return {};
  }

  static Future<void> _saveLocalAccounts(Map<String, dynamic> accounts) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_accountsKey, jsonEncode(accounts));
  }

  static String _firebaseMessage(FirebaseAuthException error) {
    switch (error.code) {
      case 'email-already-in-use':
        return '이미 사용 중인 아이디예요.';
      case 'invalid-email':
        return '아이디 형식을 다시 확인해주세요.';
      case 'weak-password':
        return '비밀번호를 조금 더 안전하게 입력해주세요.';
      case 'user-not-found':
      case 'wrong-password':
      case 'invalid-credential':
        return '아이디 또는 비밀번호가 맞지 않아요.';
      default:
        return error.message ?? '인증 중 문제가 생겼어요.';
    }
  }

  static const String _accountsKey = 'avata_auth_accounts';
  static const String _activeUserKey = 'avata_active_user';
  static const String _savedLoginIdKey = 'avata_saved_login_id';
}

class AuthResult {
  final bool isSuccess;
  final String? message;

  const AuthResult._({
    required this.isSuccess,
    this.message,
  });

  const AuthResult.success() : this._(isSuccess: true);

  const AuthResult.failure(String message)
      : this._(isSuccess: false, message: message);
}
