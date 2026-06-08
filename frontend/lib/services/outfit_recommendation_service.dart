import 'dart:convert';

import 'package:http/http.dart' as http;

class OutfitRecommendationService {
  static const String _baseUrl = 'http://10.0.2.2:8000';

  static Future<OutfitRecommendationResponse> recommendOutfits({
    required String situation,
    required String style,
    required String gender,
    String personalColorType = '',
    String skeletonType = '',
    int limit = 30,
  }) async {
    final uri = Uri.parse('$_baseUrl/recommend-outfits').replace(
      queryParameters: {
        'situation': situation,
        'style': style,
        'gender': gender,
        if (personalColorType.isNotEmpty) 'personal_color': personalColorType,
        if (skeletonType.isNotEmpty) 'skeleton_type': skeletonType,
        'limit': '$limit',
      },
    );

    final response = await http.get(uri);
    if (response.statusCode != 200) {
      throw Exception('코디 추천 실패: ${response.body}');
    }

    return OutfitRecommendationResponse.fromJson(
      jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>,
      baseUrl: _baseUrl,
    );
  }
}

class OutfitRecommendationResponse {
  final String situation;
  final String style;
  final String source;
  final List<OutfitItem> items;

  const OutfitRecommendationResponse({
    required this.situation,
    required this.style,
    required this.source,
    required this.items,
  });

  factory OutfitRecommendationResponse.fromJson(
    Map<String, dynamic> json, {
    required String baseUrl,
  }) {
    final items = (json['items'] as List<dynamic>? ?? [])
        .map(
          (item) => OutfitItem.fromJson(
            item as Map<String, dynamic>,
            baseUrl: baseUrl,
          ),
        )
        .toList();

    return OutfitRecommendationResponse(
      situation: json['situation'] as String? ?? '',
      style: json['style'] as String? ?? '',
      source: json['source'] as String? ?? '',
      items: items,
    );
  }
}

class OutfitItem {
  final String imageId;
  final String title;
  final String imageUrl;
  final String link;
  final String price;
  final String mallName;
  final String style;
  final String subStyle;
  final String itemType;
  final String category;
  final String color;
  final String subColor;
  final String fit;
  final String material;
  final String print;
  final String detail;
  final String situationTags;
  final String moodTags;
  final String sourceQuery;
  final int recommendationScore;
  final List<String> recommendationReasons;

  const OutfitItem({
    required this.imageId,
    required this.title,
    required this.imageUrl,
    required this.link,
    required this.price,
    required this.mallName,
    required this.style,
    required this.subStyle,
    required this.itemType,
    required this.category,
    required this.color,
    required this.subColor,
    required this.fit,
    required this.material,
    required this.print,
    required this.detail,
    required this.situationTags,
    required this.moodTags,
    required this.sourceQuery,
    required this.recommendationScore,
    required this.recommendationReasons,
  });

  factory OutfitItem.localWardrobe({
    required String imagePath,
    required String category,
  }) {
    final timestamp = DateTime.now().microsecondsSinceEpoch;
    final itemType = category == '전체' ? '의류' : category;

    return OutfitItem(
      imageId: 'wardrobe_$timestamp',
      title: '내 옷 $itemType',
      imageUrl: imagePath,
      link: '',
      price: '',
      mallName: '내 옷장',
      style: '',
      subStyle: '',
      itemType: itemType,
      category: itemType,
      color: '분석 대기',
      subColor: '',
      fit: '',
      material: '',
      print: '',
      detail: '사진 촬영 등록',
      situationTags: '',
      moodTags: '',
      sourceQuery: 'wardrobe_capture',
      recommendationScore: 0,
      recommendationReasons: const ['직접 등록'],
    );
  }

  factory OutfitItem.fromJson(
    Map<String, dynamic> json, {
    required String baseUrl,
  }) {
    final imagePath = json['image_url'] as String? ?? '';
    final imageUrl =
        imagePath.startsWith('http') ? imagePath : '$baseUrl$imagePath';

    return OutfitItem(
      imageId: json['image_id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      imageUrl: imageUrl,
      link: json['link'] as String? ?? '',
      price: json['price']?.toString() ?? '',
      mallName: json['mall_name'] as String? ?? '',
      style: json['style'] as String? ?? '',
      subStyle: json['sub_style'] as String? ?? '',
      itemType: json['item_type'] as String? ?? '',
      category: json['category'] as String? ?? '',
      color: json['color'] as String? ?? '',
      subColor: json['sub_color'] as String? ?? '',
      fit: json['fit'] as String? ?? '',
      material: json['material'] as String? ?? '',
      print: json['print'] as String? ?? '',
      detail: json['detail'] as String? ?? '',
      situationTags: json['situation_tags'] as String? ?? '',
      moodTags: json['mood_tags'] as String? ?? '',
      sourceQuery: json['source_query'] as String? ?? '',
      recommendationScore: json['recommendation_score'] as int? ?? 0,
      recommendationReasons:
          (json['recommendation_reasons'] as List<dynamic>? ?? [])
              .map((reason) => reason.toString())
              .toList(),
    );
  }
}
