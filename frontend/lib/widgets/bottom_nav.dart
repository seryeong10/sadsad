import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AvataBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AvataBottomNav({super.key, required this.currentIndex, required this.onTap});

  static const _items = [
    _NavItem(Icons.home_outlined, Icons.home_rounded, '홈'),
    _NavItem(Icons.person_outline_rounded, Icons.person_rounded, '코디'),
    _NavItem(null, null, 'A'),
    _NavItem(Icons.inventory_2_outlined, Icons.inventory_2_rounded, '클로젯'),
    _NavItem(Icons.person_outline_rounded, Icons.person_rounded, '마이페이지'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        height: 94,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Color(0xffedf0f7))),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(_items.length, (index) {
            final item = _items[index];
            final selected = currentIndex == index;
            final isAvatar = index == 2;
            return Expanded(
              child: InkWell(
                onTap: () => onTap(index),
                child: Padding(
                  padding: EdgeInsets.only(top: isAvatar ? 0 : 9),
                  child: isAvatar
                      ? _AvatarTab(selected: selected)
                      : _StandardTab(item: item, selected: selected),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _StandardTab extends StatelessWidget {
  final _NavItem item;
  final bool selected;
  const _StandardTab({required this.item, required this.selected});

  @override
  Widget build(BuildContext context) {
    const active = AppColors.main;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 58,
          height: 42,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected ? AppColors.selectedBackground : Colors.transparent,
            borderRadius: BorderRadius.circular(18),
          ),
        child: Icon(selected ? item.activeIcon : item.icon, color: selected ? active : AppColors.muted, size: 28),
        ),
        const SizedBox(height: 3),
        Text(item.label, style: TextStyle(color: selected ? active : AppColors.muted, fontSize: 11, fontWeight: FontWeight.w800)),
        const SizedBox(height: 7),
        AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          width: selected ? 7 : 0,
          height: selected ? 7 : 0,
          decoration: const BoxDecoration(color: active, shape: BoxShape.circle),
        ),
      ],
    );
  }
}

class _AvatarTab extends StatelessWidget {
  final bool selected;
  const _AvatarTab({required this.selected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 74,
          height: 74,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xffcfe0fb), AppColors.point]),
            border: Border.all(color: selected ? AppColors.main : Colors.transparent, width: 2),
            boxShadow: const [BoxShadow(color: Color(0x22b7d1f8), blurRadius: 16, offset: Offset(0, 7))],
          ),
          child: const Text('A', style: TextStyle(color: Colors.white, fontSize: 42, fontWeight: FontWeight.w500)),
        ),
        const SizedBox(height: 3),
        const Text('아바타', style: TextStyle(color: AppColors.main, fontSize: 10, fontWeight: FontWeight.w900)),
      ],
    );
  }
}

class _NavItem {
  final IconData? icon;
  final IconData? activeIcon;
  final String label;
  const _NavItem(this.icon, this.activeIcon, this.label);
}
