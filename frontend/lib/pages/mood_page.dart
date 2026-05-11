import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/bottom_nav.dart';
import 'avatar_home_page.dart';

class MoodPage extends StatefulWidget {
  final String? gender;
  final String? avatarImageData;
  final bool embeddedInTab;

  const MoodPage({
    super.key,
    this.gender,
    this.avatarImageData,
    this.embeddedInTab = false,
  });

  @override
  State<MoodPage> createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {
  String situation = '하객룩';
  String style = '세련';

  static const situations = [
    _MoodOption('하객룩', Icons.checkroom_outlined),
    _MoodOption('소개팅', Icons.favorite_border),
    _MoodOption('데이트', Icons.calendar_month_outlined),
    _MoodOption('캠퍼스', Icons.school_outlined),
    _MoodOption('출근', Icons.business_center_outlined),
    _MoodOption('운동', Icons.fitness_center_outlined),
    _MoodOption('더보기', Icons.more_horiz),
  ];

  static const Map<String, List<String>> stylesBySituation = {
    '하객룩': ['세련', '깔끔', '우아', '캐주얼', '러블리', '힙', '미니멀', '스트릿'],
    '소개팅': ['러블리', '청순', '로맨틱', '깔끔', '페미닌', '발랄', '단정', '우아'],
    '데이트': ['러블리', '꾸안꾸', '캐주얼', '로맨틱', '미니멀', '스트릿', '힙', '발랄'],
    '캠퍼스': ['캐주얼', '미니멀', '스포티', '스트릿', '편안한', '데일리', '힙', '심플'],
    '출근': ['깔끔', '세련', '미니멀', '포멀', '단정', '모던', '우아', '클래식'],
    '운동': ['스포티', '편안한', '애슬레저', '힙', '활동적', '심플', '캐주얼', '스트릿'],
    '더보기': ['빈티지', '유니크', '모던', '페미닌', '시크', '러블리', '고급', '내추럴'],
  };

  List<String> get currentStyles => stylesBySituation[situation]!;

  @override
  Widget build(BuildContext context) {
    final content = SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 356),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 36, 0, 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _MoodHeader(),
                  const SizedBox(height: 28),
                  const _MoodTopTabs(),
                  const SizedBox(height: 30),
                  const _SectionTitle('상황 선택'),
                  const SizedBox(height: 16),
                  GridView.count(
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.76,
                    physics: const NeverScrollableScrollPhysics(),
                    children: situations
                        .map(
                          (item) => _SituationTile(
                            option: item,
                            selected: situation == item.label,
                            onTap: () {
                              setState(() {
                                situation = item.label;
                                style = stylesBySituation[item.label]!.first;
                              });
                            },
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 26),
                  const Divider(height: 1, color: AppColors.line),
                  const SizedBox(height: 26),
                  const _SectionTitle('스타일 선택'),
                  const SizedBox(height: 16),
                  GridView.count(
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 10,
                    childAspectRatio: 2.18,
                    physics: const NeverScrollableScrollPhysics(),
                    children: currentStyles
                        .map(
                          (label) => _StyleChip(
                            label: label,
                            selected: style == label,
                            onTap: () => setState(() => style = label),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 22),
                  _RecommendButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('$situation, $style 코디를 준비할게요.'),
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mood',
                style: TextStyle(
                  color: AppColors.ink,
                  fontSize: 34,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 6),
              Text(
                '나에게 딱 맞는 코디를 추천받아보세요',
                style: TextStyle(
                  color: AppColors.muted,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 44,
          height: 44,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color(0x14000000),
                blurRadius: 12,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: const Icon(Icons.tune, color: AppColors.ink, size: 19),
        ),
      ],
    );
  }
}

class _MoodTopTabs extends StatelessWidget {
  const _MoodTopTabs();

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Divider(height: 1, color: AppColors.line),
        ),
        Row(
          children: [
            Expanded(child: _TopTabLabel(label: 'Mood', selected: true)),
            Expanded(child: _TopTabLabel(label: '내 옷 촬영', selected: false)),
          ],
        ),
      ],
    );
  }
}

class _TopTabLabel extends StatelessWidget {
  final String label;
  final bool selected;

  const _TopTabLabel({
    required this.label,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: selected ? AppColors.ink : AppColors.muted,
            fontSize: 15,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 14),
        Container(
          width: 92,
          height: 2,
          decoration: BoxDecoration(
            color: selected ? AppColors.ink : Colors.transparent,
            borderRadius: BorderRadius.circular(99),
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
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selected ? AppColors.ink : AppColors.line,
            width: selected ? 1.1 : 1,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0f000000),
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Stack(
          children: [
            if (selected)
              const Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  radius: 9,
                  backgroundColor: AppColors.ink,
                  child: Icon(Icons.check, color: Colors.white, size: 12),
                ),
              ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(option.icon, color: const Color(0xff707784), size: 28),
                  const SizedBox(height: 18),
                  Text(
                    option.label,
                    style: const TextStyle(
                      color: AppColors.ink,
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
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
      child: SizedBox.expand(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected ? AppColors.ink : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: selected ? AppColors.ink : AppColors.line,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 8,
                  right: selected ? 20 : 8,
                ),
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: selected ? Colors.white : AppColors.ink,
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              if (selected)
                const Positioned(
                  right: 8,
                  child: Icon(Icons.check_circle, color: Colors.white, size: 12),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RecommendButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _RecommendButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 58,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.ink,
          foregroundColor: Colors.white,
          elevation: 8,
          shadowColor: const Color(0x330f172a),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '코디 추천 받기',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            SizedBox(width: 64),
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
