import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../models/style_profile.dart';
import 'api_config.dart';

class PersonalColorService {
  static const bool _useMockDemo = bool.fromEnvironment('MOCK_DEMO_MODE');

  static Future<PersonalColorProfile> analyze({
    required XFile image,
    required String gender,
  }) async {
    if (_useMockDemo) {
      return const PersonalColorProfile(
        type: 'summer_cool',
        label: '여름 쿨',
        summary: '맑고 부드러운 쿨 톤이 잘 어울리는 데모 결과입니다.',
        colors: ['라벤더', '로즈 핑크', '소프트 네이비'],
        bestHexColors: ['#B8A9C9', '#D992A6', '#415B7A'],
        additionalRecommendedColors: ['쿨 그레이', '아이스 블루'],
        avoidColors: ['강한 오렌지', '옐로 브라운'],
      );
    }

    final uri = ApiConfig.uri('analyze-personal-color').replace(
      queryParameters: {'gender': gender},
    );

    final request = http.MultipartRequest('POST', uri);
    if (kIsWeb) {
      request.files.add(http.MultipartFile.fromBytes(
        'user_face',
        await image.readAsBytes(),
        filename: image.name,
      ));
    } else {
      request.files.add(await http.MultipartFile.fromPath(
        'user_face',
        image.path,
        filename: image.name,
      ));
    }

    request.headers.addAll(await ApiConfig.headers());
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
