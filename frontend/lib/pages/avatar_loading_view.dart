import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AvatarLoadingView extends StatelessWidget {
  const AvatarLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 142,
            height: 142,
            decoration: BoxDecoration(
              color: AppColors.canvas,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.line),
            ),
            child: const Icon(
              Icons.auto_awesome,
              size: 62,
              color: AppColors.ink,
            ),
          ),
          const SizedBox(height: 36),
          const SizedBox(
            width: 34,
            height: 34,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: AppColors.ink,
            ),
          ),
          const SizedBox(height: 28),
          const Text(
            'AI가 아바타를 생성 중입니다',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 12),
          const Text(
            '얼굴 특징을 반영하고 있어요\n잠시만 기다려주세요',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.muted,
              fontSize: 14,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
