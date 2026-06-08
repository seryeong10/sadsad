import 'dart:io';

import 'package:flutter/material.dart';

import '../services/community_store.dart';
import '../theme/app_colors.dart';
import 'community_page.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(22, 28, 22, 24),
        children: const [
          _MyPageHeader(),
          SizedBox(height: 28),
          _ProfileSection(),
          SizedBox(height: 22),
          Divider(height: 1, color: AppColors.line),
          SizedBox(height: 22),
          _CommunityActivityCard(),
          SizedBox(height: 16),
          _StyleDnaCard(),
          SizedBox(height: 16),
          _StyleCalendarCard(),
        ],
      ),
    );
  }
}

class _MyPageHeader extends StatelessWidget {
  const _MyPageHeader();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Text(
            'MY PAGE',
            style: TextStyle(
              color: AppColors.ink,
              fontSize: 23,
              fontWeight: FontWeight.w500,
              letterSpacing: 0,
            ),
          ),
        ),
        Icon(Icons.notifications_none_outlined, color: AppColors.ink, size: 25),
        SizedBox(width: 16),
        Icon(Icons.settings_outlined, color: AppColors.ink, size: 25),
      ],
    );
  }
}

class _ProfileSection extends StatelessWidget {
  const _ProfileSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            const _ProfilePortrait(),
            Positioned(
              right: 2,
              bottom: 5,
              child: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  color: AppColors.main,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 22),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'olive_me',
                style: TextStyle(
                  color: AppColors.ink,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '나만의 무드를 찾아 기록하는 공간 𖤣',
                style: TextStyle(
                  color: AppColors.muted,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.ink,
                  side: const BorderSide(color: AppColors.line),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  minimumSize: const Size(78, 32),
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                ),
                onPressed: () {},
                child: const Text(
                  '프로필 편집',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProfilePortrait extends StatelessWidget {
  const _ProfilePortrait();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 126,
      height: 126,
      decoration: const BoxDecoration(
        color: AppColors.canvas,
        shape: BoxShape.circle,
      ),
      clipBehavior: Clip.antiAlias,
      child: const Icon(
        Icons.person_outline,
        color: AppColors.muted,
        size: 54,
      ),
    );
  }
}

class _CommunityActivityCard extends StatelessWidget {
  const _CommunityActivityCard();

  @override
  Widget build(BuildContext context) {
    final totalCount = CommunityStore.myPosts.length +
        CommunityStore.likedPosts.length +
        CommunityStore.savedPosts.length;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const _CommunityActivityPage()),
        );
      },
      child: _PageCard(
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: const BoxDecoration(
                color: AppColors.chip,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.article_outlined,
                color: AppColors.main,
                size: 21,
              ),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '내 활동 내역',
                    style: TextStyle(
                      color: AppColors.ink,
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '내 글 ${CommunityStore.myPosts.length} · 좋아요 ${CommunityStore.likedPosts.length} · 저장 ${CommunityStore.savedPosts.length}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.muted,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
              decoration: BoxDecoration(
                color: AppColors.selectedBackground,
                borderRadius: BorderRadius.circular(99),
              ),
              child: Text(
                '$totalCount',
                style: const TextStyle(
                  color: AppColors.main,
                  fontSize: 11,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.chevron_right, color: AppColors.muted, size: 20),
          ],
        ),
      ),
    );
  }
}

class _CommunityActivityPage extends StatefulWidget {
  const _CommunityActivityPage();

  @override
  State<_CommunityActivityPage> createState() => _CommunityActivityPageState();
}

class _CommunityActivityPageState extends State<_CommunityActivityPage> {
  int _selectedIndex = 0;

  List<_ActivityTab> get _tabs => [
        _ActivityTab(
          title: '내가 쓴 글',
          icon: Icons.edit_note_outlined,
          posts: CommunityStore.myPosts,
        ),
        _ActivityTab(
          title: '좋아요',
          icon: Icons.favorite_border,
          posts: CommunityStore.likedPosts,
        ),
        _ActivityTab(
          title: '저장',
          icon: Icons.bookmark_border,
          posts: CommunityStore.savedPosts,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final selectedTab = _tabs[_selectedIndex];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          '내 활동 내역',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(22, 16, 22, 24),
          children: [
            Row(
              children: List.generate(_tabs.length, (index) {
                final tab = _tabs[index];
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: index == _tabs.length - 1 ? 0 : 8),
                    child: _ActivityTabButton(
                      tab: tab,
                      selected: _selectedIndex == index,
                      onTap: () => setState(() => _selectedIndex = index),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 18),
            _ActivityGrid(
              title: selectedTab.title,
              icon: selectedTab.icon,
              posts: selectedTab.posts,
            ),
          ],
        ),
      ),
    );
  }
}

class _ActivityTab {
  final String title;
  final IconData icon;
  final List<CommunityPost> posts;

  const _ActivityTab({
    required this.title,
    required this.icon,
    required this.posts,
  });
}

class _ActivityTabButton extends StatelessWidget {
  final _ActivityTab tab;
  final bool selected;
  final VoidCallback onTap;

  const _ActivityTabButton({
    required this.tab,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 42,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? AppColors.main : Colors.white,
          borderRadius: BorderRadius.circular(99),
          border: Border.all(color: selected ? AppColors.main : AppColors.line),
        ),
        child: Text(
          '${tab.title} ${tab.posts.length}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: selected ? Colors.white : AppColors.ink,
            fontSize: 11,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}

class _ActivityGrid extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<CommunityPost> posts;

  const _ActivityGrid({
    required this.title,
    required this.icon,
    required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    return _PageCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
          children: [
            Icon(icon, color: AppColors.main, size: 18),
            const SizedBox(width: 7),
            Text(
              '$title ${posts.length}',
              style: const TextStyle(
                color: AppColors.ink,
                fontSize: 13,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        if (posts.isEmpty)
          const SizedBox(
            height: 140,
            child: Center(
              child: Text(
                '아직 표시할 게시물이 없어요.',
                style: TextStyle(
                  color: AppColors.muted,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          )
        else
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: posts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              final post = posts[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CommunityPostDetailPage(post: post),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      _ActivityPostImage(post: post),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(7, 16, 7, 7),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withValues(alpha: 0.48),
                              ],
                            ),
                          ),
                          child: Text(
                            post.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ActivityPostImage extends StatelessWidget {
  final CommunityPost post;

  const _ActivityPostImage({required this.post});

  @override
  Widget build(BuildContext context) {
    if (post.imagePaths.isNotEmpty) {
      return Image.file(
        File(post.imagePaths.first),
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _ActivityPlaceholder(type: post.imageType),
      );
    }

    return _ActivityPlaceholder(type: post.imageType);
  }
}

class _ActivityPlaceholder extends StatelessWidget {
  final OutfitImageType type;

  const _ActivityPlaceholder({required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.canvas,
      child: Center(
        child: Icon(
          _iconFor(type),
          color: AppColors.main,
          size: 28,
        ),
      ),
    );
  }

  IconData _iconFor(OutfitImageType type) {
    switch (type) {
      case OutfitImageType.oliveShirt:
      case OutfitImageType.blackWhite:
      case OutfitImageType.ivoryShirt:
        return Icons.checkroom_outlined;
      case OutfitImageType.flatlay:
      case OutfitImageType.bag:
        return Icons.image_not_supported_outlined;
    }
  }
}

class _StyleDnaCard extends StatelessWidget {
  const _StyleDnaCard();

  @override
  Widget build(BuildContext context) {
    return const _PageCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CardHeader(title: 'STYLE DNA', subtitle: '나의 스타일 성향 분석'),
          SizedBox(height: 16),
          Row(
            children: [
              _DnaCircle(),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '차분하고 자연스러운 무드를 선호하며,미니멀한 스타일을 즐기는 편이에요.',
                      style: TextStyle(
                        color: AppColors.muted,
                        fontSize: 11,
                        height: 1.65,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 18),
                    _DnaBar(label: 'Soft Minimal', value: 0.82, percent: '82%'),
                    SizedBox(height: 10),
                    _DnaBar(
                        label: 'Modern Casual', value: 0.64, percent: '64%'),
                    SizedBox(height: 10),
                    _DnaBar(label: 'Natural', value: 0.48, percent: '48%'),
                    SizedBox(height: 10),
                    _DnaBar(label: 'Classic', value: 0.36, percent: '36%'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StyleCalendarCard extends StatelessWidget {
  const _StyleCalendarCard();

  @override
  Widget build(BuildContext context) {
    return const _PageCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CardHeader(title: '스타일 캘린더', subtitle: '오늘의 스타일을 기록해보세요'),
          SizedBox(height: 22),
          _MonthNav(),
          SizedBox(height: 18),
          _WeekRow(),
          SizedBox(height: 18),
          _RecordButton(),
        ],
      ),
    );
  }
}

class _PageCard extends StatelessWidget {
  final Widget child;

  const _PageCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.line),
      ),
      child: child,
    );
  }
}

class _CardHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const _CardHeader({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.ink,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 7),
              Text(
                subtitle,
                style: const TextStyle(
                  color: AppColors.muted,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        const Text(
          '더보기 >',
          style: TextStyle(
            color: AppColors.muted,
            fontSize: 10,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _DnaCircle extends StatelessWidget {
  const _DnaCircle();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xffeee9dd), Color(0xffcfc8b8), Color(0xfff7f8f2)],
        ),
      ),
      child: const Text(
        'Soft Minimal\n82%',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.ink,
          fontSize: 18,
          height: 1.45,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _DnaBar extends StatelessWidget {
  final String label;
  final double value;
  final String percent;

  const _DnaBar({
    required this.label,
    required this.value,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 78,
          child: Text(
            label,
            style: const TextStyle(
              color: AppColors.ink,
              fontSize: 8,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: LinearProgressIndicator(
              minHeight: 5,
              value: value,
              backgroundColor: AppColors.chip,
              valueColor: const AlwaysStoppedAnimation(AppColors.main),
            ),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 28,
          child: Text(
            percent,
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: AppColors.ink,
              fontSize: 8,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}

class _MonthNav extends StatelessWidget {
  const _MonthNav();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.chevron_left, color: AppColors.ink, size: 20),
        Expanded(
          child: Text(
            '2025.05',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.ink,
              fontSize: 12,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Icon(Icons.chevron_right, color: AppColors.ink, size: 20),
      ],
    );
  }
}

class _WeekRow extends StatelessWidget {
  const _WeekRow();

  @override
  Widget build(BuildContext context) {
    const weekdays = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
    const days = ['12', '13', '14', '15', '16', '17', '18'];

    return Row(
      children: List.generate(weekdays.length, (index) {
        final selected = index == 2;

        return Expanded(
          child: Column(
            children: [
              Text(
                weekdays[index],
                style: const TextStyle(
                  color: AppColors.muted,
                  fontSize: 8,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: 26,
                height: 26,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: selected ? AppColors.main : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  days[index],
                  style: TextStyle(
                    color: selected ? Colors.white : AppColors.ink,
                    fontSize: 9,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  color: selected ? AppColors.main : Colors.transparent,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _RecordButton extends StatelessWidget {
  const _RecordButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.canvas,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add, color: AppColors.ink, size: 20),
          SizedBox(height: 4),
          Text(
            '오늘의 스타일 기록하기',
            style: TextStyle(
              color: AppColors.ink,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
