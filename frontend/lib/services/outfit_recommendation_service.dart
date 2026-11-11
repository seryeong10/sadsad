import 'dart:convert';

import 'package:http/http.dart' as http;
import 'demo_catalog.dart';
import 'api_config.dart';

class OutfitRecommendationService {
  static const bool _useMockDemo = bool.fromEnvironment('MOCK_DEMO_MODE');

  static Future<OutfitRecommendationResponse> recommendOutfits({
    required String situation,
    required String style,
    required String gender,
    String personalColorType = '',
    String skeletonType = '',
    int limit = 30,
    String refreshSeed = '',
    List<String> excludeIds = const [],
  }) async {
    if (_useMockDemo) {
      return OutfitRecommendationResponse(
        situation: situation,
        style: style,
        source: 'mock_demo',
        items: (await DemoCatalog.load()).take(limit.clamp(0, 6)).toList(),
      );
    }

    final uri = ApiConfig.uri('recommend-outfits').replace(
      queryParameters: {
        'situation': situation,
        'style': style,
        'gender': gender,
        if (personalColorType.isNotEmpty) 'personal_color': personalColorType,
        if (skeletonType.isNotEmpty) 'skeleton_type': skeletonType,
        'limit': '$limit',
        'per_category_limit': '7',
        if (refreshSeed.isNotEmpty) 'refresh_seed': refreshSeed,
        if (excludeIds.isNotEmpty) 'exclude_ids': excludeIds.join(','),
      },
    );

    final response = await http.get(uri, headers: await ApiConfig.headers());
    if (response.statusCode != 200) {
      throw Exception('코디 추천 실패: ${response.body}');
    }

    return OutfitRecommendationResponse.fromJson(
      jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>,
      baseUrl: ApiConfig.baseUrl,
    );
  }
}

class OutfitRecommendationResponse {
  final String situation;
  final String style;
  final String source;
  final List<OutfitItem> items;
  final Map<String, int> shortages;

  const OutfitRecommendationResponse({
    required this.situation,
    required this.style,
    required this.source,
    required this.items,
    this.shortages = const {},
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
      shortages: (json['shortages'] as Map<String, dynamic>? ?? const {})
          .map((key, value) => MapEntry(key, (value as num).toInt())),
    );
  }
}

class OutfitItem {
  Map<String, dynamic> toJson() => {
        'image_id': imageId,
        'title': title,
        'image_url': imageUrl,
        'photo_type': photoType,
        'single_garment': singleGarment,
        'link': link,
        'price': price,
        'mall_name': mallName,
        'style': style,
        'sub_style': subStyle,
        'item_type': itemType,
        'category': category,
        'color': color,
        'sub_color': subColor,
        'fit': fit,
        'material': material,
        'print': print,
        'detail': detail,
        'situation_tags': situationTags,
        'mood_tags': moodTags,
        'source_query': sourceQuery,
        'recommendation_score': recommendationScore,
        'recommendation_reasons': recommendationReasons,
      };
  final String imageId;
  final String title;
  final String imageUrl;
  final String photoType;
  final bool singleGarment;
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
    this.photoType = 'auto',
    this.singleGarment = false,
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
    String? itemName,
    String color = '',
    String pattern = '',
    List<String> styleTags = const [],
    String material = '분석 대기',
    String? imageId,
  }) {
    final timestamp = DateTime.now().microsecondsSinceEpoch;
    final itemType = category == '전체' ? '의류' : category;

    return OutfitItem(
      imageId: imageId ?? 'wardrobe_$timestamp',
      title: itemName ?? '내 옷 $itemType',
      imageUrl: imagePath,
      link: '',
      price: '',
      mallName: '내 옷장',
      style: styleTags.take(2).join(' '),
      subStyle: '',
      itemType: itemType,
      category: itemType,
      color: color,
      subColor: '',
      fit: '',
      material: material,
      print: pattern,
      detail: '옷장에 직접 등록',
      situationTags: '',
      moodTags: styleTags.join('|'),
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
    final imageUrl = imagePath.isEmpty ? '' : imagePath.startsWith('http') ||
            imagePath.startsWith('data:') ||
            imagePath.startsWith('blob:')
        ? imagePath
        : '$baseUrl$imagePath';

    return OutfitItem(
      imageId: json['image_id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      imageUrl: ApiConfig.productImage(imageUrl),
      photoType: json['photo_type'] as String? ?? 'auto',
      singleGarment: json['single_garment'] == true,
      link: json['product_url'] as String? ?? json['link'] as String? ?? '',
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
