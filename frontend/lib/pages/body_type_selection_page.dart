import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/style_profile.dart';
import '../theme/app_colors.dart';
import 'avatar_generation_page.dart';

class BodyTypeSelectionPage extends StatefulWidget {
  final String gender;
  final String skeletonType;
  final XFile sourceFaceImage;
  final PersonalColorProfile? personalColorProfile;

  const BodyTypeSelectionPage({
    super.key,
    required this.gender,
    required this.skeletonType,
    required this.sourceFaceImage,
    this.personalColorProfile,
  });

  @override
  State<BodyTypeSelectionPage> createState() => _BodyTypeSelectionPageState();
}

class _BodyTypeSelectionPageState extends State<BodyTypeSelectionPage> {
  String _selected = 'standard';

  static const _sizes = [
    ('slim', '슬림', '전체적으로 마른 체형이에요'),
    ('standard', '보통', '균형 잡힌 일반 체형이에요'),
    ('plus', '통통', '전체적으로 볼륨감이 있는 체형이에요'),
  ];

  String get _assetPath {
    return _assetPathFor(_selected);
  }

  String _assetPathFor(String size) {
    final gender = widget.gender == 'male' ? 'male' : 'female';
    final skeleton = switch (widget.skeletonType) {
      '웨이브' => 'wave',
      '스트레이트' => 'straight',
      _ => 'natural',
    };
    return 'assets/avatars/body_types/${gender}_${skeleton}_$size.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 8, 18, 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios_new,
                      size: 19, color: AppColors.ink),
                ),
                const Spacer(),
              ]),
              const SizedBox(height: 12),
              const Text('마지막으로',
                  style: TextStyle(
                      color: AppColors.main,
                      fontSize: 13,
                      fontWeight: FontWeight.w800)),
              const SizedBox(height: 8),
              const Text('나의 체형을 선택해주세요',
                  style: TextStyle(
                      color: AppColors.ink,
                      fontSize: 24,
                      height: 1.25,
                      fontWeight: FontWeight.w900)),
              const SizedBox(height: 10),
              Text('골격 유형과 함께 선택하면 나와 더 잘 어울리는 아바타가 생성돼요.',
                  style: TextStyle(
                      color: AppColors.muted, fontSize: 14, height: 1.5)),
              const SizedBox(height: 22),
              Expanded(
                child: LayoutBuilder(builder: (context, constraints) {
                  final cardWidth = (constraints.maxWidth - 20) / 3;
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: _sizes.map((size) {
                      final selected = _selected == size.$1;
                      return Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => _selected = size.$1),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 160),
                            width: cardWidth,
                            // Keep every image viewport equally wide, including
                            // the last card. Its width also controls avatar height.
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            padding: const EdgeInsets.fromLTRB(7, 12, 7, 12),
                            decoration: BoxDecoration(
                              color: selected
                                  ? AppColors.selectedBackground
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: selected
                                      ? AppColors.main
                                      : AppColors.line,
                                  width: 2),
                            ),
                            child: Column(children: [
                              Expanded(
                                child: Stack(
                                    fit: StackFit.expand,
                                    alignment: Alignment.topRight,
                                    children: [
                                      Positioned.fill(
                                        child: LayoutBuilder(builder:
                                            (context, imageConstraints) {
                                          // Reserve the same full-body height for every size.
                                          // All avatar assets fit within a 1:2 frame.
                                          final height =
                                              imageConstraints.maxHeight.clamp(
                                                  0.0,
                                                  imageConstraints.maxWidth *
                                                      2);
                                          return Center(
                                            child: SizedBox(
                                              width: imageConstraints.maxWidth,
                                              height: height,
                                              child: OverflowBox(
                                                alignment: Alignment.topCenter,
                                                minWidth: 0,
                                                maxWidth: double.infinity,
                                                minHeight: 0,
                                                maxHeight: height,
                                                child: Image.asset(
                                                  _assetPathFor(size.$1),
                                                  height: height,
                                                  fit: BoxFit.fitHeight,
                                                  errorBuilder: (_, __, ___) =>
                                                      const Center(
                                                          child: Icon(
                                                              Icons
                                                                  .accessibility_new_rounded,
                                                              size: 70,
                                                              color: AppColors
                                                                  .main)),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                      if (selected)
                                        const Positioned(
                                            top: 0,
                                            right: 0,
                                            child: CircleAvatar(
                                                radius: 13,
                                                backgroundColor: AppColors.main,
                                                child: Icon(Icons.check,
                                                    color: Colors.white,
                                                    size: 17))),
                                    ]),
                              ),
                              const SizedBox(height: 8),
                              Text(size.$2,
                                  style: const TextStyle(
                                      color: AppColors.ink,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900)),
                              const SizedBox(height: 7),
                              SizedBox(
                                  height: 47,
                                  child: Text(size.$3,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: AppColors.muted,
                                          fontSize: 11,
                                          height: 1.4,
                                          fontWeight: FontWeight.w600))),
                            ]),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                }),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 58,
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => AvatarGenerationPage(
                                gender: widget.gender,
                                sourceFaceImage: widget.sourceFaceImage,
                                personalColorProfile:
                                    widget.personalColorProfile,
                                skeletonProfile: SkeletonProfile(
                                    type: widget.skeletonType,
                                    fitConcern: _selected),
                                baseAvatarAssetPath: _assetPath,
                              ))),
                  icon: const SizedBox.shrink(),
                  label: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('아바타 생성하기',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w900)),
                        SizedBox(width: 12),
                        Icon(Icons.chevron_right_rounded, size: 26)
                      ]),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.point,
                      foregroundColor: AppColors.ink,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
