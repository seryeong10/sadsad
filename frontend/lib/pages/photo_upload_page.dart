import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';

import '../theme/app_colors.dart';
import '../widgets/app_button.dart';
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
  static const bool _useMockDemo = bool.fromEnvironment('MOCK_DEMO_MODE');
  XFile? _image;
  Uint8List? _imageBytes;
  final ImagePicker picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    try {
      final image = await picker.pickImage(
        source: source, maxWidth: 1600, maxHeight: 1600, imageQuality: 85,
      );
      if (image == null) return;
      final bytes = await image.readAsBytes();
      if (!mounted) return;
      setState(() {
        _image = image;
        _imageBytes = bytes;
      });
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('사진을 불러오지 못했어요: $error')),
      );
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

  Future<void> continueToPersonalColorAnalysis() async {
    if (_image == null && !_useMockDemo) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('사진을 먼저 업로드해주세요.')),
      );
      return;
    }

    try {
      var sourceFaceImage = _image;
      if (sourceFaceImage == null && _useMockDemo) {
        final assetPath = widget.gender == 'female'
            ? 'assets/avatars/female_base.png'
            : 'assets/avatars/male_base.png';
        final byteData = await rootBundle.load(assetPath);
        sourceFaceImage = XFile.fromData(
          byteData.buffer.asUint8List(),
          name: '${widget.gender}_mock_face.png',
          mimeType: 'image/png',
        );
      }
      if (sourceFaceImage == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('사진을 먼저 업로드해주세요.')),
        );
        return;
      }
      final selectedFaceImage = sourceFaceImage;
      if (!mounted) return;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PersonalColorLoadingPage(
            gender: widget.gender,
            avatarImageData: '',
            sourceFaceImage: selectedFaceImage,
            generateAvatarAfterDiagnosis: true,
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('퍼스널 컬러 분석을 시작하지 못했어요: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 12),
            child: Row(children: [
              IconButton(
                  onPressed: () => Navigator.maybePop(context),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20)),
              const Spacer(),
            ]),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(26, 8, 26, 18),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('YOUR PHOTO',
                        style: TextStyle(
                            color: AppColors.main,
                            fontSize: 11,
                            letterSpacing: 1.1,
                            fontWeight: FontWeight.w800)),
                    const SizedBox(height: 14),
                    const Text('아바타 생성을 위해\n정면 사진을 업로드해주세요.',
                        style: TextStyle(
                            color: AppColors.ink,
                            fontSize: 23,
                            height: 1.28,
                            fontWeight: FontWeight.w800)),
                    const SizedBox(height: 24),
                    if (_useMockDemo)
                      const Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: Text(
                            '데모에서는 사진 없이도 다음 단계로 진행할 수 있어요.\n분석과 아바타는 준비된 시연용 결과로 표시됩니다.',
                            style:
                                TextStyle(color: AppColors.main, fontSize: 13)),
                      ),
                    GestureDetector(
                      onTap: showImageSourceSheet,
                      child: Container(
                        height: 190,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color(0xfff6faff),
                            borderRadius: BorderRadius.circular(18),
                            border:
                                Border.all(color: AppColors.point, width: 1.2)),
                        child: _image == null
                            ? const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    CircleAvatar(
                                        radius: 34,
                                        backgroundColor: Color(0xffe8f1ff),
                                        child: Icon(Icons.camera_alt_outlined,
                                            color: AppColors.ink, size: 31)),
                                    SizedBox(height: 12),
                                    Text('사진을 업로드하세요',
                                        style: TextStyle(
                                            color: AppColors.ink,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700)),
                                    SizedBox(height: 5),
                                    Text('터치해서 사진을 선택할 수 있어요.',
                                        style: TextStyle(
                                            color: AppColors.muted,
                                            fontSize: 12)),
                                  ])
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child: Image.memory(_imageBytes!,
                                    fit: BoxFit.contain,
                                    width: double.infinity)),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Row(children: [
                      const Text('사진 가이드',
                          style: TextStyle(
                              color: AppColors.ink,
                              fontSize: 14,
                              fontWeight: FontWeight.w800)),
                      const SizedBox(width: 12),
                      const Expanded(child: Divider(color: AppColors.line))
                    ]),
                    const SizedBox(height: 12),
                    const _PhotoGuide(
                        icon: Icons.person_outline_rounded,
                        text: '정면을 바라보는 사진을 사용해주세요.'),
                    const _PhotoGuide(
                        icon: Icons.sentiment_satisfied_alt_outlined,
                        text: '얼굴 전체가 잘 보이도록 촬영해주세요.'),
                    const _PhotoGuide(
                        icon: Icons.wb_sunny_outlined,
                        text: '밝은 곳에서 촬영하면 더 좋아요.'),
                    const _PhotoGuide(
                        icon: Icons.remove_red_eye_outlined,
                        text: '모자나 선글라스는 벗어주세요.'),
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(26, 8, 26, 18),
            child: Column(children: [
              AppButton(
                text: '다음',
                onPressed: continueToPersonalColorAnalysis,
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}

class _PhotoGuide extends StatelessWidget {
  final IconData icon;
  final String text;
  const _PhotoGuide({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(children: [
          CircleAvatar(
              radius: 15,
              backgroundColor: const Color(0xffeef5ff),
              child: Icon(icon, color: AppColors.main, size: 17)),
          const SizedBox(width: 10),
          Expanded(
              child: Text(text,
                  style: const TextStyle(
                      color: AppColors.muted, fontSize: 12, height: 1.35))),
        ]),
      );
}
