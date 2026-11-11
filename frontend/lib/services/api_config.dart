import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_rest_auth.dart';

/// All live services share the build's backend. On web, /backend can be
/// rewritten by the HTTPS hosting server to the FastAPI origin.
class ApiConfig {
  static Future<Map<String, String>> headers({bool json = false}) async {
    final token = FirebaseRestAuth.enabled
        ? await FirebaseRestAuth.idToken()
        : Firebase.apps.isNotEmpty
            ? await FirebaseAuth.instance.currentUser?.getIdToken()
            : null;
    return {
      if (json) 'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }
  static const baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: kIsWeb ? '/backend' : 'http://54.180.152.237:8000',
  );

  static Uri uri(String path) {
    final base = baseUrl.replaceFirst(RegExp(r'/+$'), '');
    final result = Uri.parse('$base/$path');
    if (kIsWeb && Uri.base.scheme == 'https' && result.scheme == 'http') {
      throw StateError('HTTPS 앱에는 HTTPS API 주소 또는 /backend 경로를 설정해주세요.');
    }
    return result;
  }

  static String productImage(String value) {
    final parsed = Uri.tryParse(value);
    if (kIsWeb && parsed?.host == 'shopping-phinf.pstatic.net') {
      return Uri.base.resolveUri(uri('api/product-image')
          .replace(queryParameters: {'url': value})).toString();
    }
    return value;
  }
}
