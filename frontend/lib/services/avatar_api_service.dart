import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class AvatarApiService {
  static Future<File> assetToFile(String assetPath, String fileName) async {
    final byteData = await rootBundle.load(assetPath);
    final tempDir = await getTemporaryDirectory();

    final file = File('${tempDir.path}/$fileName');

    await file.writeAsBytes(
      byteData.buffer.asUint8List(),
      flush: true,
    );

    return file;
  }

  static Future<String> generateAvatar({
    required String gender,
    required File userFaceFile,
  }) async {
    final baseAssetPath = gender == 'female'
        ? 'assets/avatars/female_base.png'
        : 'assets/avatars/male_base.png';

    final baseAvatarFile = await assetToFile(
      baseAssetPath,
      gender == 'female' ? 'female_base.png' : 'male_base.png',
    );

    final request = http.MultipartRequest(
      'POST',
      Uri.parse('http://10.0.2.2:8000/generate-avatar')
    );

    request.files.add(
      await http.MultipartFile.fromPath(
        'base_avatar',
        baseAvatarFile.path,
      ),
    );

    request.files.add(
      await http.MultipartFile.fromPath(
        'user_face',
        userFaceFile.path,
      ),
    );

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode != 200) {
      throw Exception('아바타 생성 실패: ${response.body}');
    }

    final data = jsonDecode(response.body);

    return data['image'];
  }
}
