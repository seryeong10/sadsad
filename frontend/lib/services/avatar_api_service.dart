import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'api_config.dart';

class AvatarApiService {
  static const bool _useMockDemo = bool.fromEnvironment('MOCK_DEMO_MODE');

  static Future<String> generateAvatar({
    required String gender,
    required XFile userFaceFile,
    String? baseAvatarAssetPath,
  }) async {
    final baseAssetPath = baseAvatarAssetPath ?? (gender == 'female'
        ? 'assets/avatars/female_base.png'
        : 'assets/avatars/male_base.png');

    if (_useMockDemo) {
      final bytes = await rootBundle.load(baseAssetPath);
      return 'data:image/png;base64,${base64Encode(bytes.buffer.asUint8List())}';
    }

    final request = http.MultipartRequest(
      'POST',
      ApiConfig.uri('generate-avatar')
    );

    final baseBytes = await rootBundle.load(baseAssetPath);
    request.files.add(http.MultipartFile.fromBytes(
      'base_avatar',
      baseBytes.buffer.asUint8List(),
      filename: baseAssetPath.split('/').last,
    ));

    if (kIsWeb) {
      request.files.add(http.MultipartFile.fromBytes(
        'user_face',
        await userFaceFile.readAsBytes(),
        filename: userFaceFile.name,
      ));
    } else {
      request.files.add(await http.MultipartFile.fromPath(
        'user_face',
        userFaceFile.path,
        filename: userFaceFile.name,
      ));
    }

    request.headers.addAll(await ApiConfig.headers());
    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode != 200) {
      throw Exception('아바타 생성 실패: ${response.body}');
    }

    final data = jsonDecode(response.body);

    return data['image'];
  }
}
