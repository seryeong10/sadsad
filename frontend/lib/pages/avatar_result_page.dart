import 'dart:io';

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/app_button.dart';
import '../widgets/avatar_memory_image.dart';
import 'photo_upload_page.dart';
import 'personal_color_page.dart';

class AvatarResultPage extends StatelessWidget {
  final String gender;
  final String imageData;
  final File sourceFaceImage;

  const AvatarResultPage({
    super.key,
    required this.gender,
    required this.imageData,
    required this.sourceFaceImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('아바타 생성 완료'),
        centerTitle: true,
        foregroundColor: AppColors.ink,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 28),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.canvas,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: AvatarMemoryImage(imageData: imageData),
                ),
              ),
              const SizedBox(height: 22),
              AppButton(
                text: '다음',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PersonalColorIntroPage(
                        gender: gender,
                        avatarImageData: imageData,
                        sourceFaceImage: sourceFaceImage,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              AppButton(
                text: '다시 생성하기',
                isPrimary: false,
                onPressed: () => _openUpload(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openUpload(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => PhotoUploadPage(
          gender: gender,
          opensAvatarPageAfterGenerate: false,
        ),
      ),
    );
  }
}
