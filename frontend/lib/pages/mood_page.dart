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
  final void Function(String situation, String style)? onNext;

  const MoodPage({
    super.key,
    this.gender,
    this.avatarImageData,
    this.personalColorProfile,
    this.skeletonProfile,
    this.embeddedInTab = false,
    this.onBackPressed,
    this.onNext,
  });

  @override
  State<MoodPage> createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {
  String? situation;
  String? style;
  final ScrollController _situationController = ScrollController();
  final ScrollController _styleController = ScrollController();

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
  void dispose() {
    _situationController.dispose();
    _styleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final content = SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 4, 10, 14),
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
                          const SizedBox(height: 16),
                          const _MoodHeadline(),
                          const SizedBox(height: 36),
                          const _SectionTitle('상황'),
                          const SizedBox(height: 4),
                          const _SectionDescription('어떤 상황에서 입을 코디인가요?'),
                          const SizedBox(height: 14),
                          _ChoiceRow(
                            controller: _situationController,
                            itemCount: situations.length,
                            itemBuilder: (index) {
                              final item = situations[index];
                              return _ChoiceChip(
                                label: item.label,
                                selected: situation == item.label,
                                onTap: () {
                                  setState(() {
                                    if (situation == item.label) {
                                      situation = null;
                                      style = null;
                                    } else {
                                      situation = item.label;
                                      style = null;
                                    }
                                  });
                                },
                              );
                            },
                          ),
                          const SizedBox(height: 30),
                          const Divider(height: 1, color: AppColors.line),
                          const SizedBox(height: 26),
                          const _SectionTitle('무드'),
                          const SizedBox(height: 4),
                          const _SectionDescription('원하는 스타일의 분위기는 어떤가요?'),
                          const SizedBox(height: 14),
                          _ChoiceRow(
                            controller: _styleController,
                            itemCount: currentStyles.length,
                            itemBuilder: (index) {
                              final label = currentStyles[index];
                              return _ChoiceChip(
                                label: label,
                                compact: true,
                                selected: style == label,
                                onTap: () => setState(
                                  () => style = style == label ? null : label,
                                ),
                              );
                            },
                          ),
                          const Spacer(),
                          const SizedBox(height: 28),
                          _RecommendButton(
                            enabled: canRecommend,
                            label: widget.onNext != null
                                ? '다음으로'
                                : '추천 코디 보러가기',
                            onPressed: () {
                              if (!canRecommend) return;
                              if (widget.onNext != null) {
                                widget.onNext!(situation!, style!);
                                return;
                              }
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
                          const SizedBox(height: 2),
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
  const _MoodHeadline();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'FIND YOUR STYLE',
          style: TextStyle(
            color: AppColors.point,
            fontSize: 12,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 12),
        const Text.rich(
          TextSpan(
            text: '오늘은 어떤 스타일로\n입을까요?',
          ),
          style: TextStyle(
            color: AppColors.ink,
            fontSize: 28,
            height: 1.24,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          '상황과 무드를 선택하면\n나에게 딱 맞는 코디를 추천해드려요.',
          style: const TextStyle(
            color: AppColors.muted,
            fontSize: 16,
            height: 1.5,
            fontWeight: FontWeight.w500,
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
        fontSize: 20,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}

class _SectionDescription extends StatelessWidget {
  final String text;

  const _SectionDescription(this.text);

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: const TextStyle(
          color: AppColors.muted,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      );
}

class _ChoiceRow extends StatelessWidget {
  final ScrollController controller;
  final int itemCount;
  final Widget Function(int index) itemBuilder;

  const _ChoiceRow({
    required this.controller,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 54,
              child: ListView.separated(
                controller: controller,
                scrollDirection: Axis.horizontal,
                itemCount: itemCount,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (_, index) => itemBuilder(index),
              ),
            ),
          ),
          SizedBox(
            width: 22,
            child: IconButton(
              padding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
              onPressed: scrollForward,
              icon: const Icon(
                Icons.chevron_right_rounded,
                size: 24,
              ),
            ),
          ),
        ],
      );

  void scrollForward() {
    if (!controller.hasClients) return;
    controller.animateTo(
      (controller.offset + 180)
          .clamp(0, controller.position.maxScrollExtent)
          .toDouble(),
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
  }
}

class _ChoiceChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  final bool compact;

  const _ChoiceChip({
    required this.label,
    required this.selected,
    required this.onTap,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(28),
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          height: compact ? 42 : 54,
          padding: EdgeInsets.symmetric(horizontal: compact ? 17 : 22),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected ? AppColors.point : Colors.white,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: selected ? AppColors.point : AppColors.line,
            ),
          ),
          child: Text(
            label,
            maxLines: 1,
            softWrap: false,
            style: TextStyle(
              color: AppColors.ink,
              fontSize: compact ? 13 : 15,
              fontWeight: selected ? FontWeight.w800 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class _RecommendButton extends StatelessWidget {
  final bool enabled;
  final String label;
  final VoidCallback onPressed;

  const _RecommendButton({
    required this.enabled,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 58,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: enabled ? AppColors.point : AppColors.chip,
          foregroundColor: enabled ? Colors.white : AppColors.muted,
          disabledBackgroundColor: AppColors.chip,
          disabledForegroundColor: AppColors.muted,
          elevation: enabled ? 8 : 0,
          shadowColor: enabled ? AppColors.buttonShadow : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: enabled ? onPressed : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            const SizedBox(width: 18),
            const Icon(Icons.arrow_forward, size: 22),
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
