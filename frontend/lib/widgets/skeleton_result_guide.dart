import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Type-specific guidance shared by the male and female result sheets.
class SkeletonResultGuide extends StatelessWidget {
  final String type, gender;
  const SkeletonResultGuide(
      {super.key, required this.type, required this.gender});

  @override
  Widget build(BuildContext context) {
    final male = gender == 'male';
    final wave = type == '웨이브';
    final straight = type == '스트레이트';
    final features = wave
        ? [
            male ? '얇고 부드러운\n상체 라인' : '가늘고\n부드러운 라인',
            '잘록하고\n곡선이 뚜렷함',
            '볼륨감 있는\n골반 라인'
          ]
        : straight
            ? ['탄탄하고\n입체적인 라인', '굴곡이 적고\n직선적인 라인', '균형 잡힌\n탄탄한 라인']
            : ['어깨와 관절의\n프레임이 드러남', '굴곡보다\n골격감이 드러남', '긴 팔다리와\n자연스러운 라인'];
    final recommended = wave
        ? [
            male ? '세미슬림 니트' : '허리 라인 강조 아이템',
            '부드러운 소재의 상의',
            male ? '가디건, 짧은 재킷' : '짧은 상의, 플레어 스커트'
          ]
        : straight
            ? ['깔끔한 셔츠, V넥 상의', '테일러드 재킷', '일자 팬츠, 슬랙스']
            : ['여유 있는 셔츠, 재킷', '와이드 팬츠', '린넨, 데님 아이템'];
    final fits = wave
        ? [
            male ? '상의는 세미슬림핏' : '상의는 슬림·레귤러핏',
            male ? '하의는 깔끔한 테이퍼드핏' : '하의는 A라인·부츠컷',
            '가벼운 레이어드로 균형'
          ]
        : straight
            ? ['상의는 기본 정핏', '하의는 일자·스트레이트핏', '너무 붙지 않는 깔끔한 핏']
            : ['상의는 여유 있는 핏', '하의는 와이드·루즈핏', '긴 기장과 레이어드'];
    final avoid = wave
        ? ['무겁고 각진 소재', '과하게 박시한 핏', '딱딱한 직선 실루엣']
        : straight
            ? ['과도한 프릴과 장식', '몸에 너무 붙는 얇은 소재', '부피가 큰 겹겹의 레이어드']
            : ['너무 타이트한 핏', '지나치게 짧은 기장', '작고 촘촘한 장식'];

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _GuidePanel(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const _GuideHeading(
            icon: Icons.assignment_turned_in_outlined, label: '체형 특징'),
        const SizedBox(height: 12),
        IntrinsicHeight(
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(
                    3,
                    (i) => Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                border: i == 2
                                    ? null
                                    : const Border(
                                        right:
                                            BorderSide(color: AppColors.line))),
                            child: Column(children: [
                              _GuideLabel(['상체', '허리', '하체'][i]),
                              const SizedBox(height: 7),
                              Text(features[i],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 11,
                                      height: 1.5,
                                      color: AppColors.ink)),
                            ]),
                          ),
                        )))),
      ])),
      const SizedBox(height: 14),
      _GuidePanel(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const _GuideHeading(icon: Icons.checkroom_outlined, label: '스타일링 팁'),
        const SizedBox(height: 10),
        IntrinsicHeight(
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
              child: _StyleGuideCard(
                  icon: Icons.checkroom_outlined,
                  title: '추천 아이템',
                  bullets: recommended)),
          const SizedBox(width: 5),
          Expanded(
              child: _StyleGuideCard(
                  icon: Icons.straighten_outlined,
                  title: '핏 가이드',
                  bullets: fits)),
          const SizedBox(width: 5),
          Expanded(
              child: _StyleGuideCard(
                  icon: Icons.block_outlined,
                  title: '피하면 좋아요',
                  bullets: avoid,
                  avoid: true)),
        ])),
      ])),
    ]);
  }
}

class _GuidePanel extends StatelessWidget {
  final Widget child;
  const _GuidePanel({required this.child});
  @override
  Widget build(BuildContext context) => Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.line),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xfff2f6fe), Colors.white])),
      child: child);
}

class _GuideHeading extends StatelessWidget {
  final IconData icon;
  final String label;
  const _GuideHeading({required this.icon, required this.label});
  @override
  Widget build(BuildContext context) => Row(children: [
        Icon(icon, size: 20, color: const Color(0xff648dff)),
        const SizedBox(width: 7),
        Text(label,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w900,
                color: AppColors.ink))
      ]);
}

class _GuideLabel extends StatelessWidget {
  final String text;
  final bool avoid;
  const _GuideLabel(this.text, {this.avoid = false});
  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
          color: avoid ? const Color(0xffffe1e5) : const Color(0xffe3ecff),
          borderRadius: BorderRadius.circular(20)),
      child: Text(text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w800,
              color:
                  avoid ? const Color(0xffd8677a) : const Color(0xff4d72d8))));
}

class _StyleGuideCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<String> bullets;
  final bool avoid;
  const _StyleGuideCard(
      {required this.icon,
      required this.title,
      required this.bullets,
      this.avoid = false});
  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.fromLTRB(6, 10, 6, 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(13)),
      child: Column(children: [
        Icon(icon,
            size: 26,
            color: avoid ? const Color(0xffee7f8b) : const Color(0xff648dff)),
        const SizedBox(height: 7),
        _GuideLabel(title, avoid: avoid),
        const SizedBox(height: 8),
        ...bullets.map((text) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Icon(avoid ? Icons.close : Icons.check,
                  size: 12,
                  color: avoid
                      ? const Color(0xffee7f8b)
                      : const Color(0xff648dff)),
              const SizedBox(width: 3),
              Expanded(
                  child: Text(text,
                      style: const TextStyle(
                          fontSize: 10, height: 1.5, color: AppColors.ink))),
            ]))),
      ]));
}
