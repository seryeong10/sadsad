import 'dart:convert';

import 'package:http/http.dart' as http;
import 'api_config.dart';

class ClosetItemAnalysis {
  final String category;
  final String item;
  final String color;
  final String pattern;
  final List<String> styleTags;
  final String? processedImage;

  const ClosetItemAnalysis({
    required this.category,
    required this.item,
    this.color = '',
    this.pattern = '',
    this.styleTags = const [],
    this.processedImage,
  });

  factory ClosetItemAnalysis.fromJson(Map<String, dynamic> json) =>
      ClosetItemAnalysis(
        category: json['category']?.toString() ?? '상의',
        item: json['item']?.toString() ?? '의류',
        color: json['color']?.toString() ?? '',
        pattern: json['pattern']?.toString() ?? '',
        styleTags: (json['style_tags'] as List<dynamic>? ?? [])
            .map((tag) => tag.toString())
            .toList(),
        processedImage: json['processed_image']?.toString(),
      );
}

class ClosetItemAnalysisService {
  // Keep the rest of the app in demo mode while allowing the closet upload
  // path to call the real image processing and Vision endpoint.
  static const _useLiveClosetMode = bool.fromEnvironment('LIVE_CLOSET_MODE');
  static const _useMockDemo =
      bool.fromEnvironment('MOCK_DEMO_MODE') && !_useLiveClosetMode;

  static Future<ClosetItemAnalysis> analyze({
    required String imageData,
    required String category,
  }) async {
    if (_useMockDemo) {
      final selectedCategory = ['상의', '하의', '아우터'].contains(category) ? category : '상의';
      await Future<void>.delayed(const Duration(milliseconds: 1300));
      return ClosetItemAnalysis(
        category: selectedCategory,
        item: switch (selectedCategory) {
          '하의' => '데일리 팬츠',
          '아우터' => '베이직 재킷',
          _ => '니트 / 티셔츠',
        },
        color: '중성색',
        styleTags: const ['캐주얼', '데일리'],
      );
    }

    final response = await http
        .post(
          ApiConfig.uri('api/analyze-closet-item'),
          headers: await ApiConfig.headers(json: true),
          body: jsonEncode({'image_data': imageData, 'category': category}),
        )
        .timeout(const Duration(seconds: 90));
    if (response.statusCode != 200) {
      throw Exception('옷 분석 실패: ${response.body}');
    }
    return ClosetItemAnalysis.fromJson(
      jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>,
    );
  }
}
