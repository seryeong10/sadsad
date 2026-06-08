import 'package:flutter/material.dart';

import '../models/style_profile.dart';
import '../theme/app_colors.dart';
import '../widgets/bottom_nav.dart';
import 'avatar_home_page.dart';
import 'outfit_recommendation_page.dart';

class MoodPage extends StatefulWidget {
  final String? gender;
  final String? avatarImageData;
  final PersonalColorProfile? personalColorProfile;
  final SkeletonProfile? skeletonProfile;
  final bool embeddedInTab;
  final VoidCallback? onBackPressed;

  const MoodPage({
    super.key,
    this.gender,
    this.avatarImageData,
    this.personalColorProfile,
    this.skeletonProfile,
    this.embeddedInTab = false,
    this.onBackPressed,
  });

  @override
  State<MoodPage> createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {
  String? situation;
  String? style;

  static const situations = [
    _MoodOption('데일리', Icons.checkroom_outlined),
    _MoodOption('여행', Icons.flight_takeoff_outlined),
    _MoodOption('데이트', Icons.favorite_border),
    _MoodOption('출근/면접', Icons.business_center_outlined),
    _MoodOption('하객룩', Icons.local_florist_outlined),
    _MoodOption('운동/활동', Icons.fitness_center_outlined),
    _MoodOption('파티/모임', Icons.celebration_outlined),
  ];

  static const Map<String, List<String>> femaleStylesBySituation = {
    '데일리': ['미니멀', '캐주얼', '꾸안꾸', '러블리', '시크', '내추럴'],
    '여행': ['리조트', '캐주얼', '내추럴', '보헤미안', '스포티', '포토제닉'],
    '데이트': ['러블리', '페미닌', '로맨틱', '청순', '시크', '꾸안꾸'],
    '출근/면접': ['포멀', '미니멀', '클래식', '모던', '단정한', '소프트 오피스'],
    '하객룩': ['우아한', '페미닌', '클래식', '모던', '단아한', '세미포멀'],
    '운동/활동': ['스포티', '애슬레저', '액티브', '캐주얼', '스트릿', '고프코어'],
    '파티/모임': ['글램', '시크', '트렌디', '로맨틱', '키치', '세미포멀'],
  };

  static const Map<String, List<String>> maleStylesBySituation = {
    '데일리': ['미니멀', '캐주얼', '꾸안꾸', '스트릿', '모던', '내추럴'],
    '여행': ['리조트', '캐주얼', '아웃도어', '고프코어', '스포티', '시티보이'],
    '데이트': ['댄디', '미니멀', '남친룩', '시크', '캐주얼', '클래식'],
    '출근/면접': ['포멀', '미니멀', '클래식', '모던', '댄디', '스마트 캐주얼'],
    '하객룩': ['클래식', '포멀', '댄디', '모던', '미니멀', '세미포멀'],
    '운동/활동': ['스포티', '애슬레저', '액티브', '캐주얼', '스트릿', '고프코어'],
    '파티/모임': ['시크', '댄디', '트렌디', '스트릿', '모던', '세미포멀'],
  };

  bool get canRecommend => situation != null && style != null;
  Map<String, List<String>> get stylesBySituation =>
      widget.gender == 'male' ? maleStylesBySituation : femaleStylesBySituation;
  List<String> get currentStyles =>
      stylesBySituation[situation] ?? stylesBySituation['데일리']!;

  @override
  Widget build(BuildContext context) {
    final content = SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 356),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 6, 0, 16),
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight - 22,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const _MoodHeader(),
                          const SizedBox(height: 24),
                          _MoodHeadline(situation: situation),
                          const SizedBox(height: 34),
                          _SituationTitleRow(onReset: _resetSelection),
                          const SizedBox(height: 12),
                          SizedBox(
                            height: 96,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: situations.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(width: 8),
                              itemBuilder: (context, index) {
                                final item = situations[index];
                                return _SituationTile(
                                  option: item,
                                  selected: situation == item.label,
                                  onTap: () {
                                    setState(() {
                                      situation = item.label;
                                      style = null;
                                    });
                                  },
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 44),
                          const _SectionTitle('무드 선택'),
                          const SizedBox(height: 12),
                          SizedBox(
                            height: 40,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: currentStyles.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(width: 8),
                              itemBuilder: (context, index) {
                                final label = currentStyles[index];
                                return _StyleChip(
                                  label: label,
                                  selected: style == label,
                                  onTap: () => setState(() => style = label),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 34),
                          _MoodSupportCard(situation: situation, style: style),
                          const Spacer(),
                          const SizedBox(height: 30),
                          _RecommendButton(
                            enabled: canRecommend,
                            onPressed: () {
                              if (!canRecommend) return;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => OutfitRecommendationPage(
                                    gender: widget.gender ?? 'female',
                                    avatarImageData:
                                        widget.avatarImageData ?? '',
                                    situation: situation!,
                                    style: style!,
                                    personalColorProfile:
                                        widget.personalColorProfile,
                                    skeletonProfile: widget.skeletonProfile,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );

    if (widget.embeddedInTab) {
      return content;
    }

    return Scaffold(
      body: content,
      bottomNavigationBar: AvataBottomNav(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0 &&
              widget.gender != null &&
              widget.avatarImageData != null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => AvatarHomePage(
                  gender: widget.gender!,
                  avatarImageData: widget.avatarImageData!,
                ),
              ),
            );
          }
        },
      ),
    );
  }

  void _resetSelection() {
    setState(() {
      situation = null;
      style = null;
    });
  }
}

class _MoodHeader extends StatelessWidget {
  const _MoodHeader();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      visualDensity: VisualDensity.compact,
      padding: EdgeInsets.zero,
      alignment: Alignment.centerLeft,
      icon: const Icon(Icons.arrow_back_ios_new, size: 20),
      color: AppColors.ink,
      onPressed: () {
        if (context.findAncestorWidgetOfExactType<MoodPage>()?.onBackPressed !=
            null) {
          context.findAncestorWidgetOfExactType<MoodPage>()!.onBackPressed!();
          return;
        }
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      },
    );
  }
}

class _MoodHeadline extends StatelessWidget {
  final String? situation;

  const _MoodHeadline({required this.situation});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text.rich(
          TextSpan(
            text: '오늘 어떤 ',
            children: [
              TextSpan(
                text: '스타일로\n',
                style: TextStyle(color: AppColors.main),
              ),
              TextSpan(text: '입어볼까요?'),
            ],
          ),
          style: TextStyle(
            color: AppColors.ink,
            fontSize: 26,
            height: 1.28,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          situation == null
              ? '상황과 무드를 선택하면\n나에게 딱 맞는 코디를 추천해드려요.'
              : '$situation 무드를 선택하면\n나에게 딱 맞는 코디를 추천해드려요.',
          style: const TextStyle(
            color: AppColors.muted,
            fontSize: 13,
            height: 1.55,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;

  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.ink,
        fontSize: 15,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}

class _SituationTitleRow extends StatelessWidget {
  final VoidCallback onReset;

  const _SituationTitleRow({required this.onReset});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: _SectionTitle('상황 선택')),
        TextButton(
          onPressed: onReset,
          style: TextButton.styleFrom(
            foregroundColor: AppColors.muted,
            visualDensity: VisualDensity.compact,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            minimumSize: const Size(0, 30),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: const Text(
            '초기화',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}

class _SituationTile extends StatelessWidget {
  final _MoodOption option;
  final bool selected;
  final VoidCallback onTap;

  const _SituationTile({
    required this.option,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        width: 54,
        height: 94,
        decoration: BoxDecoration(
          color: selected ? AppColors.selectedBackground : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selected ? AppColors.point : AppColors.line,
            width: selected ? 1.1 : 1,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0d000000),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              option.icon,
              color: selected ? AppColors.main : AppColors.ink,
              size: 21,
            ),
            const SizedBox(height: 14),
            Text(
              option.label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: selected ? AppColors.main : AppColors.ink,
                fontSize: 10,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StyleChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _StyleChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        height: 38,
        constraints: const BoxConstraints(minWidth: 54),
        padding: const EdgeInsets.symmetric(horizontal: 14),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? AppColors.point : Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: selected ? AppColors.point : AppColors.line,
          ),
        ),
        child: Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: selected ? AppColors.ink : AppColors.ink,
            fontSize: 11,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

class _MoodSupportCard extends StatelessWidget {
  final String? situation;
  final String? style;

  const _MoodSupportCard({
    required this.situation,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    final message = situation == null
        ? '상황과 무드를 선택하면\n어울리는 코디를 찾아드릴게요.'
        : style == null
            ? '$situation 상황에 어울리는\n무드를 골라주세요.'
            : '당신에게 어울리는\n$situation $style 코디를 추천해드려요.';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
      decoration: BoxDecoration(
        color: AppColors.canvas,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xfff0f1eb)),
      ),
      child: Row(
        children: [
          const Icon(Icons.eco_outlined, color: AppColors.main, size: 24),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.ink,
                fontSize: 12,
                height: 1.55,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RecommendButton extends StatelessWidget {
  final bool enabled;
  final VoidCallback onPressed;

  const _RecommendButton({
    required this.enabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 58,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: enabled ? AppColors.main : AppColors.chip,
          foregroundColor: enabled ? Colors.white : AppColors.muted,
          disabledBackgroundColor: AppColors.chip,
          disabledForegroundColor: AppColors.muted,
          elevation: enabled ? 8 : 0,
          shadowColor: enabled ? AppColors.buttonShadow : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: enabled ? onPressed : null,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '추천 코디 보러가기',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            SizedBox(width: 18),
            Icon(Icons.arrow_forward, size: 22),
          ],
        ),
      ),
    );
  }
}

class _MoodOption {
  final String label;
  final IconData icon;

  const _MoodOption(this.label, this.icon);
}
