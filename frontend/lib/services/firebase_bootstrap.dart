import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class FirebaseBootstrap {
  static const String _apiKey = String.fromEnvironment('FIREBASE_API_KEY');
  static const String _appId = String.fromEnvironment('FIREBASE_APP_ID');
  static const String _messagingSenderId =
      String.fromEnvironment('FIREBASE_MESSAGING_SENDER_ID');
  static const String _projectId =
      String.fromEnvironment('FIREBASE_PROJECT_ID');
  static const String _authDomain =
      String.fromEnvironment('FIREBASE_AUTH_DOMAIN');
  static const String _storageBucket =
      String.fromEnvironment('FIREBASE_STORAGE_BUCKET');
  static const String _iosBundleId =
      String.fromEnvironment('FIREBASE_IOS_BUNDLE_ID');
  static const String _androidClientId =
      String.fromEnvironment('FIREBASE_ANDROID_CLIENT_ID');

  static bool get hasConfig {
    return _apiKey.isNotEmpty &&
        _appId.isNotEmpty &&
        _messagingSenderId.isNotEmpty &&
        _projectId.isNotEmpty;
  }

  static Future<void> initialize() async {
    if (!hasConfig) {
      try {
        await Firebase.initializeApp();
      } catch (error) {
        debugPrint('Firebase native config not found: $error');
      }
      return;
    }

    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: _apiKey,
        appId: _appId,
        messagingSenderId: _messagingSenderId,
        projectId: _projectId,
        authDomain: _authDomain.isEmpty ? null : _authDomain,
        storageBucket: _storageBucket.isEmpty ? null : _storageBucket,
        iosBundleId: _iosBundleId.isEmpty ? null : _iosBundleId,
        androidClientId: _androidClientId.isEmpty ? null : _androidClientId,
      ),
    );

    debugPrint('Firebase initialized for project $_projectId');
  }
}
