import 'dart:convert';

import 'package:http/http.dart' as http;

import 'outfit_recommendation_service.dart';
import 'api_config.dart';

class ClosetOutfitRecommendation {
  final String id;
  final String title;
  final String reason;
  final List<String> itemIds;

  const ClosetOutfitRecommendation({
    required this.id,
    required this.title,
    required this.reason,
    required this.itemIds,
  });

  factory ClosetOutfitRecommendation.fromJson(Map<String, dynamic> json) =>
      ClosetOutfitRecommendation(
        id: json['id']?.toString() ?? '',
        title: json['title']?.toString() ?? '오늘의 코디',
        reason: json['reason']?.toString() ?? '',
        itemIds: (json['item_ids'] as List<dynamic>? ?? [])
            .map((id) => id.toString())
            .toList(),
      );
}

class ClosetOutfitRecommendationService {
  // Closet outfit recommendations are a real backend feature even when the
  // surrounding app flow is using demo auth/avatar screens. Opt into the
  // local mock recommender explicitly when a screen-only preview needs it.
  static const _useMockDemo =
      bool.fromEnvironment('MOCK_CLOSET_RECOMMENDATIONS');

  static Future<List<ClosetOutfitRecommendation>> recommend({
    required String situation,
    required String mood,
    required String gender,
    required String personalColor,
    required String skeletonType,
    required List<OutfitItem> closet,
  }) async {
    if (_useMockDemo) {
      return _demoRecommendations(
        closet,
        situation: situation,
        mood: mood,
        gender: gender,
        personalColor: personalColor,
        skeletonType: skeletonType,
      );
    }

    final response = await http.post(
      ApiConfig.uri('api/recommend/closet'),
      headers: await ApiConfig.headers(json: true),
      body: jsonEncode({
        'situation': situation,
        'mood': mood,
        'gender': gender,
        'personal_color': personalColor,
        'skeleton_type': skeletonType,
        'items': closet
            .map((item) => {
                  'id': item.imageId,
                  'category': item.category,
                  'name': item.title,
                  'color': item.color,
                  'pattern': item.print,
                  'style_tags': item.moodTags
                      .split('|')
                      .where((tag) => tag.isNotEmpty)
                      .toList(),
                })
            .toList(),
      }),
    );
    if (response.statusCode != 200) {
      var detail = response.body;
      try {
        final errorBody =
            jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
        detail = errorBody['detail']?.toString() ?? detail;
      } catch (_) {
        // Keep the raw response when the backend did not return JSON.
      }
      throw Exception(detail);
    }

    final body =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    if (body['source'] != 'openai') {
      throw Exception('실제 AI 추천 응답이 아닌 결과는 표시하지 않습니다.');
    }
    final validIds = closet.map((item) => item.imageId).toSet();
    return (body['outfits'] as List<dynamic>? ?? [])
        .map((entry) =>
            ClosetOutfitRecommendation.fromJson(entry as Map<String, dynamic>))
        .map((look) => ClosetOutfitRecommendation(
              id: look.id,
              title: look.title,
              reason: look.reason,
              itemIds: look.itemIds
                  .where((itemId) => validIds.contains(itemId))
                  .toSet()
                  .toList(),
            ))
        .where((look) => look.itemIds.isNotEmpty)
        .take(3)
        .toList();
  }

  static List<ClosetOutfitRecommendation> _demoRecommendations(
    List<OutfitItem> closet, {
    required String situation,
    required String mood,
    required String gender,
    required String personalColor,
    required String skeletonType,
  }) {
    final groups = [
      for (final category in const ['아우터', '상의', '하의'])
        closet.where((item) => item.category == category).toList(),
    ].where((items) => items.isNotEmpty).toList();
    if (groups.isEmpty) return const [];

    // Free, on-device ranking for demo mode. Score each possible outfit against
    // the selected occasion and mood, using only saved closet items.
    final context = _contextKeywords(situation, mood, gender);
    final rankedGroups = groups
        .map((group) => group
            .map((item) => _RankedItem(item, _itemScore(item, context)))
            .toList()
          ..sort((a, b) => b.score.compareTo(a.score)))
        .toList();
    final candidates = <({List<OutfitItem> items, int score})>[];

    void build(int groupIndex, List<OutfitItem> picked, int score) {
      if (groupIndex == rankedGroups.length) {
        candidates.add((items: List.of(picked), score: score));
        return;
      }
      for (final candidate in rankedGroups[groupIndex].take(12)) {
        build(groupIndex + 1, [...picked, candidate.item],
            score + candidate.score);
      }
    }

    build(0, [], 0);
    candidates.sort((a, b) => b.score.compareTo(a.score));
    final recommendations = <ClosetOutfitRecommendation>[];
    final signatures = <String>{};
    for (final candidate in candidates) {
      final signature = candidate.items.map((item) => item.imageId).join('-');
      if (!signatures.add(signature)) continue;
      final n = recommendations.length;
      recommendations.add(ClosetOutfitRecommendation(
        id: 'closet-$signature',
        title: _outfitTitle(situation, mood, n),
        reason: _recommendationReason(
          situation,
          mood,
          candidate.items,
          context,
        ),
        itemIds: candidate.items.map((item) => item.imageId).toList(),
      ));
      if (recommendations.length == 3) break;
    }
    return recommendations;
  }

  static List<String> _contextKeywords(
      String situation, String mood, String gender) {
    const occasion = <String, List<String>>{
      '데일리': ['데일리', '기본', '캐주얼', '편안', '티셔츠', '데님', '후드'],
      '출근/등교': ['출근', '등교', '오피스', '셔츠', '슬랙스', '재킷', '가디건', '단정'],
      '데이트': ['데이트', '로맨틱', '블라우스', '니트', '원피스', '깔끔', '포인트'],
      '여행': ['여행', '활동', '편안', '가벼운', '후드', '데님', '아우터'],
      '운동/액티비티': ['운동', '액티비티', '스포츠', '트레이닝', '기능성', '편안'],
      '운동': ['운동', '액티비티', '스포츠', '트레이닝', '기능성', '편안'],
      '운동/활동': ['운동', '활동', '액티비티', '스포츠', '트레이닝', '기능성', '편안'],
      '하객룩': ['하객', '격식', '단정', '재킷', '셔츠', '슬랙스', '블라우스'],
      '파티/모임': ['파티', '모임', '시크', '트렌디', '글램', '포인트'],
    };
    const moods = <String, List<String>>{
      '캐주얼': ['캐주얼', '데님', '티셔츠', '후드', '편안'],
      '러블리': ['러블리', '로맨틱', '부드러운', '파스텔', '블라우스', '니트'],
      '시크': ['시크', '모던', '블랙', '가죽', '재킷', '슬랙스'],
      '세련된': ['세련', '모던', '미니멀', '단정', '재킷', '슬랙스'],
      '편안한': ['편안', '여유', '후드', '니트', '조거', '데님'],
      '포멀': ['포멀', '격식', '단정', '셔츠', '재킷', '슬랙스'],
      '미니멀': ['미니멀', '베이직', '심플', '무지', '모던'],
      '꾸안꾸': ['꾸안꾸', '내추럴', '베이직', '캐주얼', '데님'],
      '힙한': ['힙', '스트리트', '오버핏', '와이드', '그래픽'],
    };
    return [
      ...(occasion[situation] ?? [situation]),
      ...(moods[mood] ?? [mood]),
      if (gender == 'female' || gender == '여성') '여성',
      if (gender == 'male' || gender == '남성') '남성',
    ];
  }

  static int _itemScore(OutfitItem item, List<String> keywords) {
    final text = '${item.title} ${item.style} ${item.moodTags} ${item.color} '
            '${item.print} ${item.itemType}'
        .toLowerCase();
    var score = 0;
    for (final keyword in keywords) {
      if (keyword.isNotEmpty && text.contains(keyword.toLowerCase())) {
        score += 4;
      }
    }
    final title = item.title.toLowerCase();
    final category = item.category;
    // Category and garment-name suitability helps when the analysis tags are
    // sparse (for example, an item was registered with just “스웨터”).
    if (category == '아우터' &&
        keywords.any((k) => ['출근', '여행', '시크', '세련', '포멀'].contains(k))) {
      score += 1;
    }
    if (category == '상의' &&
        keywords.any((k) => ['데이트', '러블리', '포멀', '출근'].contains(k))) {
      score += 1;
    }
    if (category == '하의' &&
        keywords.any((k) => ['활동', '여행', '캐주얼', '힙'].contains(k))) {
      score += 1;
    }
    if (title.contains('니트') &&
        keywords.any((k) => ['러블리', '편안', '데이트'].contains(k))) {
      score += 2;
    }
    if ((title.contains('셔츠') || title.contains('슬랙스')) &&
        keywords.any((k) => ['출근', '포멀', '세련', '하객'].contains(k))) {
      score += 2;
    }
    return score;
  }

  static String _outfitTitle(String situation, String mood, int index) {
    final suffixes = ['추천 코디', '스타일 코디', '포인트 코디'];
    final safeIndex = index < 0 ? 0 : (index > 2 ? 2 : index);
    return '$situation $mood ${suffixes[safeIndex]}';
  }

  static String _recommendationReason(
    String situation,
    String mood,
    List<OutfitItem> items,
    List<String> keywords,
  ) {
    final matched = items.any((item) => _itemScore(item, keywords) > 0);
    return matched
        ? '$situation 상황의 $mood 무드에 어울리는 옷장 아이템을 골랐어요.'
        : '등록한 옷만 사용해 $situation 상황에 입기 좋은 조합으로 구성했어요.';
  }
}

class _RankedItem {
  final OutfitItem item;
  final int score;
  const _RankedItem(this.item, this.score);
}
