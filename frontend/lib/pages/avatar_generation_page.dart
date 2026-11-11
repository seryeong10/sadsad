import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/style_profile.dart';
import '../services/avatar_api_service.dart';
import '../theme/app_colors.dart';
import '../widgets/app_button.dart';
import 'avatar_home_page.dart';
import 'avatar_loading_view.dart';

class AvatarGenerationPage extends StatefulWidget {
  final String gender;
  final XFile sourceFaceImage;
  final PersonalColorProfile? personalColorProfile;
  final SkeletonProfile? skeletonProfile;
  final String? baseAvatarAssetPath;

  const AvatarGenerationPage({
    super.key,
    required this.gender,
    required this.sourceFaceImage,
    this.personalColorProfile,
    this.skeletonProfile,
    this.baseAvatarAssetPath,
  });

  @override
  State<AvatarGenerationPage> createState() => _AvatarGenerationPageState();
}

class _AvatarGenerationPageState extends State<AvatarGenerationPage> {
  String? _error;
  bool _isGenerating = false;

  @override
  void initState() {
    super.initState();
    _generate();
  }

  Future<void> _generate() async {
    if (_isGenerating) return;
    setState(() {
      _isGenerating = true;
      _error = null;
    });
    try {
      final avatarImageData = await AvatarApiService.generateAvatar(
        gender: widget.gender,
        userFaceFile: widget.sourceFaceImage,
        baseAvatarAssetPath: widget.baseAvatarAssetPath,
      );
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => AvatarHomePage(
            gender: widget.gender,
            avatarImageData: avatarImageData,
            personalColorProfile: widget.personalColorProfile,
            skeletonProfile: widget.skeletonProfile,
          ),
        ),
      );
    } catch (error) {
      if (!mounted) return;
      setState(() => _error = error.toString());
    } finally {
      if (mounted) setState(() => _isGenerating = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_error == null || _isGenerating) return const AvatarLoadingView();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: AppColors.main, size: 48),
              const SizedBox(height: 16),
              const Text('아바타 생성에 실패했어요', style: TextStyle(color: AppColors.ink, fontSize: 20, fontWeight: FontWeight.w800)),
              const SizedBox(height: 8),
              Text(_error!, textAlign: TextAlign.center, style: const TextStyle(color: AppColors.muted, fontSize: 12)),
              const SizedBox(height: 20),
              AppButton(text: '다시 시도', onPressed: _generate),
            ],
          ),
        ),
      ),
    );
  }
}
