import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AvataBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AvataBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const items = [
      _NavItem(Icons.person_outline, Icons.person, 'Avata'),
      _NavItem(Icons.checkroom_outlined, Icons.checkroom, 'Mood'),
      _NavItem(Icons.chat_bubble_outline, Icons.chat_bubble, 'Community'),
      _NavItem(Icons.person_outline, Icons.person, 'My Page'),
    ];

    return Container(
      height: 92,
      decoration: const BoxDecoration(
        color: Color(0xfffbf9ff),
        border: Border(top: BorderSide(color: Color(0xfff0eef5))),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: List.generate(items.length, (index) {
            final item = items[index];
            final selected = currentIndex == index;

            return Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(18),
                onTap: () => onTap(index),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        selected ? item.activeIcon : item.icon,
                        size: 23,
                        color: selected ? AppColors.ink : AppColors.muted,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.label,
                        maxLines: 1,
                        style: TextStyle(
                          color: selected ? AppColors.ink : AppColors.muted,
                          fontSize: 10,
                          fontWeight:
                              selected ? FontWeight.w800 : FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 7),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 160),
                        width: selected ? 4 : 0,
                        height: selected ? 4 : 0,
                        decoration: const BoxDecoration(
                          color: AppColors.ink,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;

  const _NavItem(this.icon, this.activeIcon, this.label);
}
