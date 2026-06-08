import 'package:flutter/material.dart';

import '../models/style_profile.dart';
import '../theme/app_colors.dart';
import '../widgets/avatar_memory_image.dart';
import '../widgets/bottom_nav.dart';
import 'community_page.dart';
import 'fitting_flow_page.dart';
import 'mood_entry_page.dart';
import 'my_page.dart';

class AvatarHomePage extends StatefulWidget {
  final String gender;
  final String avatarImageData;
  final PersonalColorProfile? personalColorProfile;
  final SkeletonProfile? skeletonProfile;

  const AvatarHomePage({
    super.key,
    required this.gender,
    required this.avatarImageData,
    this.personalColorProfile,
    this.skeletonProfile,
  });

  @override
  State<AvatarHomePage> createState() => _AvatarHomePageState();
}

class _AvatarHomePageState extends State<AvatarHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      _AvatarView(avatarImageData: widget.avatarImageData),
      MoodEntryPage(
        gender: widget.gender,
        avatarImageData: widget.avatarImageData,
        personalColorProfile: widget.personalColorProfile,
        skeletonProfile: widget.skeletonProfile,
      ),
      const CommunityPage(),
      const MyPage(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: AvataBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class _AvatarView extends StatefulWidget {
  final String avatarImageData;

  const _AvatarView({required this.avatarImageData});

  @override
  State<_AvatarView> createState() => _AvatarViewState();
}

class _AvatarViewState extends State<_AvatarView> {
  _AvatarQuickAction? _expandedAction;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        color: const Color(0xfff8f7f3),
        child: Stack(
          children: [
            const Positioned.fill(child: _FittingRoomBackground()),
            Positioned.fill(
              top: 34,
              bottom: 20,
              child: AvatarMemoryImage(imageData: widget.avatarImageData),
            ),
            Positioned(
              left: 0,
              top: 142,
              child: _BookmarkActionRail(
                avatarImageData: widget.avatarImageData,
                expandedAction: _expandedAction,
                onActionTap: _handleActionTap,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleActionTap(_AvatarQuickAction action) {
    if (_expandedAction == action) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => action.page(widget.avatarImageData)),
      );
      return;
    }

    setState(() => _expandedAction = action);
  }
}

class _BookmarkActionRail extends StatelessWidget {
  final String avatarImageData;
  final _AvatarQuickAction? expandedAction;
  final ValueChanged<_AvatarQuickAction> onActionTap;

  const _BookmarkActionRail({
    required this.avatarImageData,
    required this.expandedAction,
    required this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 154,
      height: 224,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            width: 52,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.88),
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(20),
                ),
                border: Border.all(color: Colors.white),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x12000000),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _AvatarQuickAction.values.map((action) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: _BookmarkActionTab(
                    action: action,
                    expanded: expandedAction == action,
                    onTap: () => onActionTap(action),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _BookmarkActionTab extends StatelessWidget {
  final _AvatarQuickAction action;
  final bool expanded;
  final VoidCallback onTap;

  const _BookmarkActionTab({
    required this.action,
    required this.expanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 240),
        curve: Curves.easeOutCubic,
        width: expanded ? 154 : 52,
        height: expanded ? 48 : 44,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: expanded ? Colors.white : Colors.transparent,
          borderRadius: const BorderRadius.horizontal(
            right: Radius.circular(18),
          ),
          boxShadow: expanded
              ? const [
                  BoxShadow(
                    color: Color(0x16000000),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ]
              : const [],
        ),
        child: Row(
          children: [
            SizedBox(
              width: 52,
              child: Icon(action.icon, color: AppColors.main, size: 19),
            ),
            if (expanded)
              Expanded(
                child: Text(
                  action.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.ink,
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            if (expanded) const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}

enum _AvatarQuickAction {
  fittingRoom(Icons.meeting_room_outlined, '피팅룸'),
  wardrobe(Icons.checkroom_outlined, '내옷장'),
  wishlist(Icons.favorite_border, '찜목록'),
  history(Icons.history, '피팅기록');

  final IconData icon;
  final String label;

  const _AvatarQuickAction(this.icon, this.label);

  Widget page(String avatarImageData) {
    switch (this) {
      case _AvatarQuickAction.fittingRoom:
        return FittingRoomPage(avatarImageData: avatarImageData);
      case _AvatarQuickAction.wardrobe:
        return const WardrobePage();
      case _AvatarQuickAction.wishlist:
        return const WishlistPage();
      case _AvatarQuickAction.history:
        return const FittingHistoryPage();
    }
  }
}

class _FittingRoomBackground extends StatelessWidget {
  const _FittingRoomBackground();

  @override
  Widget build(BuildContext context) {
    return const CustomPaint(
      painter: _FittingRoomPainter(),
      child: SizedBox.expand(),
    );
  }
}

class _FittingRoomPainter extends CustomPainter {
  const _FittingRoomPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..isAntiAlias = true;

    paint.shader = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xfffbfaf7),
        Color(0xfff1f0eb),
      ],
    ).createShader(Offset.zero & size);
    canvas.drawRect(Offset.zero & size, paint);
    paint.shader = null;

    paint.color = const Color(0xffdedbd2);
    paint.strokeWidth = 1;
    canvas.drawLine(
      Offset(0, size.height * 0.76),
      Offset(size.width, size.height * 0.76),
      paint,
    );

    paint.color = const Color(0x55d7d2c8);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width * 0.08,
          size.height * 0.08,
          size.width * 0.84,
          size.height * 0.66,
        ),
        const Radius.circular(22),
      ),
      paint,
    );

    paint
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4
      ..color = const Color(0xffd8d5cc);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width * 0.12,
          size.height * 0.1,
          size.width * 0.76,
          size.height * 0.62,
        ),
        const Radius.circular(18),
      ),
      paint,
    );

    paint
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..color = const Color(0xffc9c5ba);
    final railY = size.height * 0.18;
    canvas.drawLine(
      Offset(size.width * 0.18, railY),
      Offset(size.width * 0.82, railY),
      paint,
    );

    paint
      ..style = PaintingStyle.fill
      ..color = const Color(0xffeeeae1);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.16, size.height * 0.2, 34, 88),
        const Radius.circular(10),
      ),
      paint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.73, size.height * 0.21, 32, 82),
        const Radius.circular(10),
      ),
      paint,
    );

    paint.color = const Color(0xffddd7ca);
    canvas.drawCircle(Offset(size.width * 0.23, railY), 4, paint);
    canvas.drawCircle(Offset(size.width * 0.77, railY), 4, paint);

    paint
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2
      ..color = const Color(0xffd2cec4);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width * 0.67,
          size.height * 0.36,
          size.width * 0.18,
          size.height * 0.28,
        ),
        const Radius.circular(16),
      ),
      paint,
    );

    paint
      ..style = PaintingStyle.fill
      ..color = const Color(0x35ffffff);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width * 0.69,
          size.height * 0.38,
          size.width * 0.14,
          size.height * 0.24,
        ),
        const Radius.circular(14),
      ),
      paint,
    );

    paint
      ..style = PaintingStyle.fill
      ..color = const Color(0xffe6e1d8);
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.82),
        width: size.width * 0.62,
        height: size.height * 0.06,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
