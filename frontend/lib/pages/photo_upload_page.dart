import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../services/avatar_api_service.dart';
import '../theme/app_colors.dart';
import '../widgets/app_button.dart';
import 'avatar_home_page.dart';
import 'avatar_loading_view.dart';
import 'avatar_result_page.dart';
import 'personal_color_page.dart';

class PhotoUploadPage extends StatefulWidget {
  final String gender;
  final bool opensAvatarPageAfterGenerate;

  const PhotoUploadPage({
    super.key,
    required this.gender,
    required this.opensAvatarPageAfterGenerate,
  });

  @override
  State<PhotoUploadPage> createState() => _PhotoUploadPageState();
}

class _PhotoUploadPageState extends State<PhotoUploadPage> {
  File? _image;
  bool _isLoading = false;
  final ImagePicker picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    final XFile? image = await picker.pickImage(source: source);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  void showImageSourceSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                '사진 선택',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 24),
              ListTile(
                leading: const Icon(Icons.photo_library_outlined),
                title: const Text('갤러리에서 선택'),
                onTap: () {
                  Navigator.pop(context);
                  pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt_outlined),
                title: const Text('카메라로 촬영'),
                onTap: () {
                  Navigator.pop(context);
                  pickImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> generateAvatarAndMove() async {
    if (_image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('사진을 먼저 업로드해주세요.')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final resultImage = await AvatarApiService.generateAvatar(
        gender: widget.gender,
        userFaceFile: _image!,
      );

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => widget.opensAvatarPageAfterGenerate
              ? AvatarHomePage(
                  gender: widget.gender,
                  avatarImageData: resultImage,
                )
              : AvatarResultPage(
                  gender: widget.gender,
                  imageData: resultImage,
                  sourceFaceImage: _image!,
                ),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('아바타 생성 실패: $e')),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> analyzePersonalColorWithoutAvatar() async {
    if (_image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('사진을 먼저 업로드해주세요.')),
      );
      return;
    }

    final avatarAssetPath = widget.gender == 'female'
        ? 'assets/avatars/female_base.png'
        : 'assets/avatars/male_base.png';
    final avatarBytes = await rootBundle.load(avatarAssetPath);
    final avatarImageData =
        'data:image/png;base64,${base64Encode(avatarBytes.buffer.asUint8List())}';

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => PersonalColorLoadingPage(
          gender: widget.gender,
          avatarImageData: avatarImageData,
          sourceFaceImage: _image!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const AvatarLoadingView()
          : SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 32),
                    const Text(
                      '사진 업로드',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      '아바타 생성을 위해\n정면 사진을 업로드해주세요',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.muted,
                        fontSize: 15,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 36),
                    GestureDetector(
                      onTap: showImageSourceSheet,
                      child: Container(
                        height: 230,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: AppColors.line),
                        ),
                        child: _image == null
                            ? const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.camera_alt_outlined,
                                    size: 54,
                                    color: AppColors.main,
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    '사진 선택',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    '정면 사진을 선택해주세요',
                                    style: TextStyle(color: AppColors.muted),
                                  ),
                                ],
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child: Image.file(
                                  _image!,
                                  fit: BoxFit.contain,
                                  width: double.infinity,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 44),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '사진 가이드',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '- 정면을 바라보는 사진을 사용해주세요\n'
                        '- 얼굴 전체가 잘 보이도록 촬영해주세요\n'
                        '- 밝은 곳에서 촬영하면 더 좋아요\n'
                        '- 모자나 선글라스는 벗어주세요',
                        style: TextStyle(color: AppColors.muted, height: 1.8),
                      ),
                    ),
                    const Spacer(),
                    AppButton(text: '다음', onPressed: generateAvatarAndMove),
                    const SizedBox(height: 12),
                    AppButton(
                      text: '아바타 없이 컬러 결과 보기',
                      isPrimary: false,
                      onPressed: analyzePersonalColorWithoutAvatar,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
