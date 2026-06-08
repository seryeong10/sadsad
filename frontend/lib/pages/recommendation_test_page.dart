import 'package:flutter/material.dart';

import '../models/style_profile.dart';
import '../theme/app_colors.dart';
import 'outfit_recommendation_page.dart';

class RecommendationTestPage extends StatefulWidget {
  const RecommendationTestPage({super.key});

  @override
  State<RecommendationTestPage> createState() => _RecommendationTestPageState();
}

class _RecommendationTestPageState extends State<RecommendationTestPage> {
  int _selectedIndex = 0;

  _RecommendationPreset get _selectedPreset => _presets[_selectedIndex];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '추천 테스트 모드',
                style: TextStyle(
                  color: AppColors.ink,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '아바타 생성 없이 대표 조합으로 상품 추천만 확인해요.',
                style: TextStyle(
                  color: AppColors.muted,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  itemCount: _presets.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final preset = _presets[index];
                    final selected = index == _selectedIndex;
                    return _PresetCard(
                      preset: preset,
                      selected: selected,
                      onTap: () => setState(() => _selectedIndex = index),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () => _openRecommendation(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.main,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    '${_selectedPreset.shortLabel} 추천 보기',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openRecommendation(BuildContext context) {
    final preset = _selectedPreset;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => OutfitRecommendationPage(
          gender: preset.gender,
          avatarImageData: _transparentPixel,
          situation: preset.situation,
          style: preset.mood,
          personalColorProfile: preset.personalColorProfile,
          skeletonProfile: SkeletonProfile(
            type: preset.skeletonType,
            fitConcern: '테스트',
          ),
        ),
      ),
    );
  }
}

class _PresetCard extends StatelessWidget {
  final _RecommendationPreset preset;
  final bool selected;
  final VoidCallback onTap;

  const _PresetCard({
    required this.preset,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected ? AppColors.main.withValues(alpha: 0.1) : Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: selected ? AppColors.main : AppColors.line,
            width: selected ? 1.4 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: AppColors.line),
                  ),
                  child: Text(
                    preset.gender == 'male' ? '남자' : '여자',
                    style: const TextStyle(
                      color: AppColors.ink,
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    preset.shortLabel,
                    style: const TextStyle(
                      color: AppColors.ink,
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                if (selected)
                  const Icon(
                    Icons.check_circle,
                    color: AppColors.main,
                    size: 22,
                  ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              '${preset.personalColorProfile.label} / ${preset.skeletonType} / ${preset.situation} / ${preset.mood}',
              style: const TextStyle(
                color: AppColors.muted,
                fontSize: 13,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RecommendationPreset {
  final String gender;
  final String personalColorType;
  final String skeletonType;
  final String situation;
  final String mood;

  const _RecommendationPreset({
    required this.gender,
    required this.personalColorType,
    required this.skeletonType,
    required this.situation,
    required this.mood,
  });

  String get shortLabel {
    final genderLabel = gender == 'male' ? '남자' : '여자';
    return '$genderLabel ${personalColorProfile.label} $skeletonType';
  }

  PersonalColorProfile get personalColorProfile {
    final data = _personalColorData[gender]![personalColorType]!;
    return PersonalColorProfile(
      type: personalColorType,
      label: data.label,
      summary: data.summary,
      colors: data.colors,
      bestHexColors: data.hexColors,
      additionalRecommendedColors: data.additionalColors,
      avoidColors: data.avoidColors,
    );
  }
}

class _PersonalColorData {
  final String label;
  final String summary;
  final List<String> colors;
  final List<String> hexColors;
  final List<String> additionalColors;
  final List<String> avoidColors;

  const _PersonalColorData({
    required this.label,
    required this.summary,
    required this.colors,
    required this.hexColors,
    required this.additionalColors,
    required this.avoidColors,
  });
}

const _presets = [
  _RecommendationPreset(
    gender: 'female',
    personalColorType: 'spring_warm',
    skeletonType: '스트레이트',
    situation: '데일리',
    mood: '미니멀',
  ),
  _RecommendationPreset(
    gender: 'female',
    personalColorType: 'summer_cool',
    skeletonType: '웨이브',
    situation: '데이트',
    mood: '러블리',
  ),
  _RecommendationPreset(
    gender: 'female',
    personalColorType: 'autumn_warm',
    skeletonType: '내추럴',
    situation: '여행',
    mood: '내추럴',
  ),
  _RecommendationPreset(
    gender: 'female',
    personalColorType: 'winter_cool',
    skeletonType: '스트레이트',
    situation: '출근/면접',
    mood: '클래식',
  ),
  _RecommendationPreset(
    gender: 'male',
    personalColorType: 'spring_warm',
    skeletonType: '스트레이트',
    situation: '데일리',
    mood: '미니멀',
  ),
  _RecommendationPreset(
    gender: 'male',
    personalColorType: 'summer_cool',
    skeletonType: '웨이브',
    situation: '데이트',
    mood: '댄디',
  ),
  _RecommendationPreset(
    gender: 'male',
    personalColorType: 'autumn_warm',
    skeletonType: '내추럴',
    situation: '여행',
    mood: '고프코어',
  ),
  _RecommendationPreset(
    gender: 'male',
    personalColorType: 'winter_cool',
    skeletonType: '스트레이트',
    situation: '출근/면접',
    mood: '모던',
  ),
];

const _personalColorData = {
  'female': {
    'spring_warm': _PersonalColorData(
      label: '봄 웜',
      summary: '밝고 따뜻한 색상이 얼굴 톤을 생기 있게 보여줘요.',
      colors: ['코랄', '피치', '오렌지', '크림', '애플그린', '살구'],
      hexColors: ['#FFF4E0', '#F8D86A', '#F6B48F', '#F47C72', '#A8DCC1', '#D9B98F'],
      additionalColors: ['살구색', '크림베이지', '바닐라크림', '파스텔옐로우', '웜코랄', '웜핑크', '연두색', '청록민트', '허니베이지'],
      avoidColors: ['블랙', '차콜', '쿨그레이', '딥네이비', '버건디', '퍼플', '네온핑크', '코발트블루', '실버', '쿨화이트'],
    ),
    'summer_cool': _PersonalColorData(
      label: '여름 쿨',
      summary: '맑고 부드러운 쿨 계열 색상이 잘 어울려요.',
      colors: ['라벤더', '쿨핑크', '뮤트퍼플', '블루그레이', '소프트 네이비', '라이트 민트'],
      hexColors: ['#F6F3F0', '#C8B7E8', '#AFCBEF', '#D98AA5', '#BFD8D2', '#4B5F7A'],
      additionalColors: ['연보라', '연핑크', '더스티로즈', '하늘색', '연민트', '푸른라벤더', '모브핑크', '흐린블루', '회핑크'],
      avoidColors: ['머스타드', '오렌지', '테라코타', '카멜', '다크올리브', '초콜릿브라운', '네온옐로우', '웜베이지', '브릭레드', '코랄오렌지'],
    ),
    'autumn_warm': _PersonalColorData(
      label: '가을 웜',
      summary: '차분하고 깊이 있는 웜 계열 색상이 잘 어울려요.',
      colors: ['카멜', '브라운', '초콜릿', '머스타드', '올리브', '웜 베이지'],
      hexColors: ['#E8D2B0', '#C6922D', '#B85C38', '#8F3F2B', '#6F7A3C', '#4B2E1F'],
      additionalColors: ['번트오렌지', '시나몬', '모카브라운', '카라멜', '앰버', '딥카키', '숲그린', '마호가니', '웜와인', '골든베이지'],
      avoidColors: ['퓨어화이트', '아이스핑크', '라벤더', '파우더블루', '쿨민트', '실버그레이', '푸시아핑크', '코발트블루', '블랙', '블루퍼플'],
    ),
    'winter_cool': _PersonalColorData(
      label: '겨울 쿨',
      summary: '선명하고 대비감 있는 쿨 계열 색상이 잘 어울려요.',
      colors: ['네이비', '블랙', '화이트', '로열 블루', '버건디', '실버'],
      hexColors: ['#FFFFFF', '#050505', '#1F4ED8', '#D91E76', '#F2C9D8', '#007A6C'],
      additionalColors: ['아이스블루', '아이스라벤더', '마젠타', '체리레드', '플럼', '바이올렛', '사파이어블루', '블루레드', '쿨실버', '딥퍼플'],
      avoidColors: ['카멜', '머스타드', '오렌지', '테라코타', '올리브', '웜베이지', '브라운', '피치', '코랄핑크', '크림아이보리'],
    ),
  },
  'male': {
    'spring_warm': _PersonalColorData(
      label: '봄 웜',
      summary: '밝고 부드러운 웜톤 색상이 잘 어울려요.',
      colors: ['크림', '라이트 베이지', '웜 그레이', '소프트 카키', '피치 베이지', '코랄 포인트'],
      hexColors: ['#F7E8CF', '#D8B889', '#C99A5B', '#A8B88E', '#C9795A', '#2F4A5F'],
      additionalColors: ['크림베이지', '샌드색', '허니카멜', '웜그레이', '소프트카키', '라이트올리브', '코랄브라운', '벽돌베이지', '틸그린', '웜브라운'],
      avoidColors: ['블랙', '쿨차콜', '실버그레이', '아이스블루', '로얄블루', '푸시아핑크', '퍼플', '딥버건디', '블루네이비', '쿨화이트'],
    ),
    'summer_cool': _PersonalColorData(
      label: '여름 쿨',
      summary: '부드럽고 차분한 쿨톤 색상이 잘 어울려요.',
      colors: ['라이트 그레이', '블루그레이', '스카이블루', '소프트 네이비', '쿨 화이트', '더스티 블루'],
      hexColors: ['#F4F5F7', '#D8DCE2', '#7E9AB8', '#34465E', '#A8A6BC', '#C9BFB8'],
      additionalColors: ['페일그레이', '블루그레이', '스모크네이비', '더스티블루', '애쉬블루', '그레이시민트', '라벤더그레이', '소프트퍼플', '쿨카키그레이', '로즈브라운'],
      avoidColors: ['오렌지브라운', '머스타드', '카멜', '골드베이지', '러스트', '올리브카키', '웜아이보리', '브릭레드', '코랄핑크', '옐로우그린'],
    ),
    'autumn_warm': _PersonalColorData(
      label: '가을 웜',
      summary: '깊고 차분한 웜톤 색상이 잘 어울려요.',
      colors: ['카멜', '브라운', '카키', '올리브', '딥 베이지', '초콜릿'],
      hexColors: ['#D6C0A0', '#B07A3A', '#777246', '#4D5934', '#8A4B2A', '#3A2418'],
      additionalColors: ['토바코브라운', '샌드스톤', '골든카키', '브론즈', '다크카멜', '에스프레소', '머드그레이', '웜차콜', '딥그린', '버건디브라운'],
      avoidColors: ['쿨화이트', '실버', '라이트그레이', '아이스블루', '라벤더그레이', '푸시아핑크', '로얄블루', '블루네이비', '쿨퍼플', '민트블루'],
    ),
    'winter_cool': _PersonalColorData(
      label: '겨울 쿨',
      summary: '선명하고 딥한 쿨톤 색상이 잘 어울려요.',
      colors: ['네이비', '블랙', '화이트', '차콜', '딥 블루', '실버'],
      hexColors: ['#FFFFFF', '#050505', '#2B2D33', '#1746A2', '#071D49', '#5A102A'],
      additionalColors: ['스노우화이트', '그래파이트', '블루블랙', '스틸블루', '미드나잇블루', '딥퍼플', '크림슨', '아이스그레이', '쿨카키블랙', '다크틸'],
      avoidColors: ['카멜', '라이트카멜', '샌드베이지', '머스타드', '오렌지브라운', '러스트브라운', '올리브그린', '웜아이보리', '피치베이지', '코랄브라운'],
    ),
  },
};

const _transparentPixel =
    'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADElEQVR42mP8z8BQDwAFgwJ/lwTZTQAAAABJRU5ErkJggg==';
