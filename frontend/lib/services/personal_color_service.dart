import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/style_profile.dart';

class PersonalColorService {
  static const String _baseUrl = 'http://10.0.2.2:8000';

  static Future<PersonalColorProfile> analyze({
    required File image,
    required String gender,
  }) async {
    final uri = Uri.parse('$_baseUrl/analyze-personal-color').replace(
      queryParameters: {'gender': gender},
    );

    final request = http.MultipartRequest('POST', uri)
      ..files.add(
        await http.MultipartFile.fromPath('user_face', image.path),
      );

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode != 200) {
      throw Exception('퍼스널 컬러 분석 실패: ${response.body}');
    }

    final data = jsonDecode(utf8.decode(response.bodyBytes))
        as Map<String, dynamic>;

    return PersonalColorProfile(
      type: data['type'] as String? ?? 'summer_cool',
      label: data['label'] as String? ?? '여름 쿨',
      summary: data['summary'] as String? ?? '',
      colors: (data['recommended_colors'] as List<dynamic>? ?? [])
          .map((color) => color.toString())
          .toList(),
      bestHexColors: (data['best_hex_colors'] as List<dynamic>? ?? [])
          .map((color) => color.toString())
          .toList(),
      additionalRecommendedColors:
          (data['additional_recommended_colors'] as List<dynamic>? ?? [])
              .map((color) => color.toString())
              .toList(),
      avoidColors: (data['avoid_colors'] as List<dynamic>? ?? [])
          .map((color) => color.toString())
          .toList(),
    );
  }
}
