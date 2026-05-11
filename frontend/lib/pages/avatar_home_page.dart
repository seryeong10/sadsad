import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/avatar_memory_image.dart';
import '../widgets/bottom_nav.dart';
import 'mood_page.dart';

class AvatarHomePage extends StatefulWidget {
  final String gender;
  final String avatarImageData;

  const AvatarHomePage({
    super.key,
    required this.gender,
    required this.avatarImageData,
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
      MoodPage(
        gender: widget.gender,
        avatarImageData: widget.avatarImageData,
        embeddedInTab: true,
      ),
      const _ComingSoonPage(title: '옷촬영'),
      const _ComingSoonPage(title: '마이페이지'),
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

class _AvatarView extends StatelessWidget {
  final String avatarImageData;

  const _AvatarView({required this.avatarImageData});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff5d5d5d),
              Color(0xffb9b9b9),
              Color(0xfff4f4f4),
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              top: 34,
              bottom: 20,
              child: AvatarMemoryImage(imageData: avatarImageData),
            ),
            const Positioned(
              left: 8,
              top: 8,
              child: _SmallLabel(text: 'MY 스타일'),
            ),
            const Positioned(
              right: 8,
              top: 8,
              child: _SmallLabel(text: '스타일 저장'),
            ),
            const Positioned(
              left: 8,
              top: 52,
              child: _SideToolRail(),
            ),
            const Positioned(
              right: 14,
              bottom: 22,
              child: _ShuffleButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class _SmallLabel extends StatelessWidget {
  final String text;

  const _SmallLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.35),
        border: Border.all(color: Colors.white70),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _SideToolRail extends StatelessWidget {
  const _SideToolRail();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _RailButton(icon: Icons.keyboard_arrow_up),
        _RailButton(icon: Icons.face_retouching_natural_outlined),
        _RailButton(icon: Icons.checkroom_outlined),
        _RailButton(icon: Icons.layers_outlined),
        _RailButton(icon: Icons.keyboard_arrow_down),
        SizedBox(height: 8),
        _RailButton(icon: Icons.refresh),
      ],
    );
  }
}

class _RailButton extends StatelessWidget {
  final IconData icon;

  const _RailButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 34,
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.72),
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: Colors.white),
      ),
      child: Icon(icon, size: 18, color: const Color(0xff555555)),
    );
  }
}

class _ShuffleButton extends StatelessWidget {
  const _ShuffleButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.auto_awesome, size: 14, color: AppColors.ink),
          SizedBox(width: 4),
          Text(
            'AI 코디 추천받기',
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}

class _ComingSoonPage extends StatelessWidget {
  final String title;

  const _ComingSoonPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: AppColors.muted,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
