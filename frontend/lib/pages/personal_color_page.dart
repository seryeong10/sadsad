import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import '../models/style_profile.dart';
import '../services/personal_color_service.dart';
import '../theme/app_colors.dart';
import '../widgets/app_button.dart';
import 'skeleton_diagnosis_page.dart';

class PersonalColorIntroPage extends StatelessWidget {
  final String gender;
  final String avatarImageData;
  final File sourceFaceImage;

  const PersonalColorIntroPage({
    super.key,
    required this.gender,
    required this.avatarImageData,
    required this.sourceFaceImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _BackButton(onPressed: () => Navigator.pop(context)),
              const SizedBox(height: 22),
              const Center(
                child: Column(
                  children: [
                    Text(
                      '나에게 어울리는\n컬러 찾기',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.ink,
                        fontSize: 28,
                        height: 1.22,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      '아바타 생성에 사용한 얼굴 사진으로\nAI가 톤 경향을 간단히 분석해요.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.muted,
                        fontSize: 14,
                        height: 1.55,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _FacePreview(sourceFaceImage: sourceFaceImage),
                      const SizedBox(height: 14),
                      const _AnalysisScopeCard(),
                      const SizedBox(height: 12),
                      const _PhotoNotice(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _OliveButton(
                text: 'AI 컬러 분석 시작',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PersonalColorLoadingPage(
                        gender: gender,
                        avatarImageData: avatarImageData,
                        sourceFaceImage: sourceFaceImage,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              AppButton(
                text: '건너뛰기',
                isPrimary: false,
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SkeletonDiagnosisIntroPage(
                      gender: gender,
                      avatarImageData: avatarImageData,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PersonalColorPreviewPage extends StatefulWidget {
  const PersonalColorPreviewPage({super.key});

  @override
  State<PersonalColorPreviewPage> createState() =>
      _PersonalColorPreviewPageState();
}

class _PersonalColorPreviewPageState extends State<PersonalColorPreviewPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final result = _previewResults[_index];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(22, 12, 22, 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(width: 40),
                  const Expanded(
                    child: Text(
                      'AI 컬러 분석 결과',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.ink,
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(
                          () => _index = (_index + 1) % _previewResults.length);
                    },
                    icon: const Icon(Icons.swap_horiz, color: AppColors.ink),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _ColorResultHero(
                        result: result,
                        sourceFaceImage: null,
                      ),
                      const SizedBox(height: 12),
                      _PaletteCard(result: result),
                      const SizedBox(height: 12),
                      _ColorUsageCard(result: result),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: List.generate(_previewResults.length, (index) {
                  final item = _previewResults[index];
                  final selected = index == _index;
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: index == _previewResults.length - 1 ? 0 : 6,
                      ),
                      child: GestureDetector(
                        onTap: () => setState(() => _index = index),
                        child: Container(
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: selected
                                ? _seasonAccent(item.type)
                                : AppColors.canvas,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: selected
                                  ? _seasonAccent(item.type)
                                  : AppColors.line,
                            ),
                          ),
                          child: Text(
                            item.label,
                            style: TextStyle(
                              color: selected ? Colors.white : AppColors.ink,
                              fontSize: 11,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PersonalColorLoadingPage extends StatefulWidget {
  final String gender;
  final String avatarImageData;
  final File sourceFaceImage;

  const PersonalColorLoadingPage({
    super.key,
    required this.gender,
    required this.avatarImageData,
    required this.sourceFaceImage,
  });

  @override
  State<PersonalColorLoadingPage> createState() =>
      _PersonalColorLoadingPageState();
}

class _PersonalColorLoadingPageState extends State<PersonalColorLoadingPage> {
  bool _hasError = false;
  String? _errorMessage;
  int _activeStepIndex = 0;
  Timer? _stepTimer;

  @override
  void initState() {
    super.initState();
    _startStepAnimation();
    _analyze();
  }

  @override
  void dispose() {
    _stepTimer?.cancel();
    super.dispose();
  }

  void _startStepAnimation() {
    _stepTimer?.cancel();
    _activeStepIndex = 0;
    _stepTimer = Timer.periodic(const Duration(milliseconds: 680), (timer) {
      if (!mounted) return;
      setState(() {
        _activeStepIndex = (_activeStepIndex + 1).clamp(0, 3);
      });
      if (_activeStepIndex >= 3) {
        timer.cancel();
      }
    });
  }

  Future<void> _analyze() async {
    final startedAt = DateTime.now();
    try {
      final result = await PersonalColorService.analyze(
        image: widget.sourceFaceImage,
        gender: widget.gender,
      );
      if (!mounted) return;
      setState(() => _activeStepIndex = 3);
      final elapsed = DateTime.now().difference(startedAt);
      final remaining = const Duration(milliseconds: 2300) - elapsed;
      if (remaining > Duration.zero) {
        await Future.delayed(remaining);
      }
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => PersonalColorResultPage(
            gender: widget.gender,
            avatarImageData: widget.avatarImageData,
            sourceFaceImage: widget.sourceFaceImage,
            result: result,
          ),
        ),
      );
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _hasError = true;
        _errorMessage = error.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _BackButton(onPressed: () => Navigator.pop(context)),
              const SizedBox(height: 34),
              const Center(
                child: Column(
                  children: [
                    Text(
                      'AI가 톤 경향을\n분석 중이에요',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.ink,
                        fontSize: 25,
                        height: 1.3,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 14),
                    Text(
                      '얼굴 이미지의 색상 특징을 바탕으로\n추천에 반영할 컬러를 찾고 있어요.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.muted,
                        fontSize: 13,
                        height: 1.55,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Center(
                child:
                    _LoadingFaceRing(sourceFaceImage: widget.sourceFaceImage),
              ),
              const SizedBox(height: 34),
              if (_hasError)
                _AnalysisError(
                  message: _errorMessage ?? '분석 중 문제가 생겼어요.',
                  onRetry: () {
                    setState(() {
                      _hasError = false;
                      _errorMessage = null;
                    });
                    _startStepAnimation();
                    _analyze();
                  },
                )
              else
                _AnalysisSteps(activeStepIndex: _activeStepIndex),
              const Spacer(),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
                decoration: BoxDecoration(
                  color: AppColors.canvas,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.lightbulb_outline,
                        color: AppColors.main, size: 18),
                    SizedBox(width: 9),
                    Expanded(
                      child: Text(
                        '조명과 카메라 색감에 따라 결과가 달라질 수 있어요.',
                        style: TextStyle(
                          color: AppColors.muted,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AnalysisError extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _AnalysisError({
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.line),
      ),
      child: Column(
        children: [
          const Icon(Icons.error_outline, color: AppColors.main, size: 28),
          const SizedBox(height: 8),
          const Text(
            '분석을 다시 시도해주세요',
            style: TextStyle(
              color: AppColors.ink,
              fontSize: 14,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            message,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.muted,
              fontSize: 11,
              height: 1.35,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 38,
            child: OutlinedButton(
              onPressed: onRetry,
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.ink,
                side: const BorderSide(color: AppColors.line),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('다시 분석하기'),
            ),
          ),
        ],
      ),
    );
  }
}

class PersonalColorResultPage extends StatelessWidget {
  final String gender;
  final String avatarImageData;
  final File sourceFaceImage;
  final PersonalColorProfile result;

  const PersonalColorResultPage({
    super.key,
    required this.gender,
    required this.avatarImageData,
    required this.sourceFaceImage,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(22, 12, 22, 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _BackButton(onPressed: () => Navigator.pop(context)),
                  const Expanded(
                    child: Text(
                      'AI 컬러 분석 결과',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.ink,
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),
              const SizedBox(height: 14),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _ColorResultHero(
                        result: result,
                        sourceFaceImage: sourceFaceImage,
                      ),
                      const SizedBox(height: 12),
                      _PaletteCard(result: result),
                      const SizedBox(height: 12),
                      _ColorUsageCard(result: result),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 14),
              _OliveButton(
                text: '다음: 나에게 맞는 핏 찾기',
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SkeletonDiagnosisIntroPage(
                      gender: gender,
                      avatarImageData: avatarImageData,
                      personalColorProfile: result,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              AppButton(
                text: '톤 직접 수정하기',
                isPrimary: false,
                onPressed: () => _showTonePicker(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showTonePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return const Padding(
          padding: EdgeInsets.fromLTRB(22, 22, 22, 28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '톤 직접 선택',
                style: TextStyle(
                  color: AppColors.ink,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '분석 결과가 다르게 느껴지면 추천에 반영할 톤을 직접 고를 수 있어요.',
                style: TextStyle(
                  color: AppColors.muted,
                  fontSize: 12,
                  height: 1.45,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    _ToneChoiceChip('봄 웜'),
                    _ToneChoiceChip('여름 쿨'),
                    _ToneChoiceChip('가을 웜'),
                    _ToneChoiceChip('겨울 쿨'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _FacePreview extends StatelessWidget {
  final File sourceFaceImage;

  const _FacePreview({required this.sourceFaceImage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: 192,
          height: 192,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.selectedBackground,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.point),
          ),
          child: ClipOval(
            child: Image.file(sourceFaceImage, fit: BoxFit.cover),
          ),
        ),
        Transform.translate(
          offset: const Offset(0, 10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(99),
              border: Border.all(color: AppColors.line),
            ),
            child: const Text(
              '업로드한 얼굴 사진 사용',
              style: TextStyle(
                color: AppColors.main,
                fontSize: 11,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _AnalysisScopeCard extends StatelessWidget {
  const _AnalysisScopeCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.line),
      ),
      child: const Column(
        children: [
          _ScopeRow(Icons.palette_outlined, '피부 톤 경향'),
          SizedBox(height: 11),
          _ScopeRow(Icons.tonality_outlined, '웜 / 쿨 톤'),
          SizedBox(height: 11),
          _ScopeRow(Icons.color_lens_outlined, '코디 추천 컬러 팔레트'),
        ],
      ),
    );
  }
}

class _ScopeRow extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ScopeRow(this.icon, this.label);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 31,
          height: 31,
          decoration: BoxDecoration(
            color: AppColors.canvas,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: AppColors.main, size: 18),
        ),
        const SizedBox(width: 10),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.ink,
            fontSize: 13,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

class _PhotoNotice extends StatelessWidget {
  const _PhotoNotice();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: AppColors.canvas,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Text(
        '이 결과는 스타일 추천을 위한 간이 분석이에요.\n밝은 조명, 메이크업, 카메라 색감에 따라 달라질 수 있어요.',
        style: TextStyle(
          color: AppColors.muted,
          fontSize: 12,
          height: 1.48,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _LoadingFaceRing extends StatelessWidget {
  final File sourceFaceImage;

  const _LoadingFaceRing({required this.sourceFaceImage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 214,
      height: 214,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const SizedBox(
            width: 214,
            height: 214,
            child: CircularProgressIndicator(
              strokeWidth: 6,
              color: AppColors.main,
              backgroundColor: AppColors.chip,
            ),
          ),
          Container(
            width: 174,
            height: 174,
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Image.file(sourceFaceImage, fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}

class _AnalysisSteps extends StatelessWidget {
  final int activeStepIndex;

  const _AnalysisSteps({required this.activeStepIndex});

  static const _steps = [
    '얼굴 영역 확인',
    '피부 톤 특징 분석',
    '웜 / 쿨 경향 추정',
    '추천 컬러 매칭',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        _steps.length,
        (index) => _StepRow(
          active: index <= activeStepIndex,
          current: index == activeStepIndex,
          text: _steps[index],
        ),
      ),
    );
  }
}

class _StepRow extends StatelessWidget {
  final bool active;
  final bool current;
  final String text;

  const _StepRow({
    required this.active,
    required this.current,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 260),
            width: current ? 10 : 8,
            height: current ? 10 : 8,
            decoration: BoxDecoration(
              color: active ? AppColors.main : AppColors.line,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 9),
          SizedBox(
            width: 128,
            child: Text(
              text,
              style: TextStyle(
                color: active ? AppColors.ink : AppColors.muted,
                fontSize: 12,
                fontWeight: active ? FontWeight.w900 : FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ColorResultHero extends StatelessWidget {
  final PersonalColorProfile result;
  final File? sourceFaceImage;

  const _ColorResultHero({
    required this.result,
    required this.sourceFaceImage,
  });

  @override
  Widget build(BuildContext context) {
    final accent = _seasonAccent(result.type);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: accent.withValues(alpha: 0.18)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 142,
            height: 180,
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: sourceFaceImage == null
                  ? _PreviewFace(type: result.type)
                  : Image.file(sourceFaceImage!, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'BEST SEASON TYPE',
                  style: TextStyle(
                    color: AppColors.muted,
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 7,
                  runSpacing: 3,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      result.label,
                      style: TextStyle(
                        color: accent,
                        fontSize: 29,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      '(${_seasonEnglishName(result.type)})',
                      style: TextStyle(
                        color: accent,
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Text(
                  result.summary,
                  style: const TextStyle(
                    color: AppColors.ink,
                    fontSize: 13,
                    height: 1.55,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 18),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: _seasonTags(result.type).map((tag) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 6),
                      decoration: BoxDecoration(
                        color: accent.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(99),
                      ),
                      child: Text(
                        tag,
                        style: TextStyle(
                          color: accent,
                          fontSize: 9,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PreviewFace extends StatelessWidget {
  final String type;

  const _PreviewFace({required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _seasonAccent(type).withValues(alpha: 0.12),
      child: Icon(
        Icons.face_retouching_natural_outlined,
        color: _seasonAccent(type),
        size: 54,
      ),
    );
  }
}

class _PaletteCard extends StatelessWidget {
  final PersonalColorProfile result;

  const _PaletteCard({required this.result});

  @override
  Widget build(BuildContext context) {
    final swatches = _paletteSwatches(result);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'BEST COLORS',
            style: TextStyle(
              color: AppColors.muted,
              fontSize: 11,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: swatches.map((swatch) {
              return Expanded(
                child: Column(
                  children: [
                    Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color: swatch.color,
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0x18000000)),
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      swatch.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.muted,
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 10),
          Text(
            _paletteCaption(result.type),
            style: const TextStyle(
              color: AppColors.muted,
              fontSize: 11,
              height: 1.35,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  List<_PaletteSwatch> _paletteSwatches(PersonalColorProfile result) {
    final names = result.colors.take(6).toList();
    final hexColors = result.bestHexColors.take(6).toList();
    final fallbackColors = _fallbackPaletteColors(result.type);

    return List.generate(names.length, (index) {
      final namedColor = _namedPaletteColor(names[index]);
      final color = namedColor ??
          (index < hexColors.length
              ? _hexToColor(hexColors[index]) ??
                  fallbackColors[index % fallbackColors.length]
              : fallbackColors[index % fallbackColors.length]);
      return _PaletteSwatch(names[index], color);
    });
  }

  Color? _hexToColor(String hex) {
    final cleanHex = hex.replaceFirst('#', '').trim();
    if (cleanHex.length != 6) return null;
    final value = int.tryParse(cleanHex, radix: 16);
    if (value == null) return null;
    return Color(0xff000000 | value);
  }

  Color? _namedPaletteColor(String name) {
    const namedColors = {
      '코랄': Color(0xffff8f78),
      '피치': Color(0xffffb097),
      '오렌지': Color(0xffffa25f),
      '크림': Color(0xffffe0b8),
      '애플그린': Color(0xffc7dc73),
      '살구': Color(0xffffcfa8),
      '라이트 베이지': Color(0xffe6cda8),
      '웜 그레이': Color(0xffb8aa98),
      '소프트 카키': Color(0xffaab17d),
      '피치 베이지': Color(0xffe6ad8c),
      '코랄 포인트': Color(0xffd87463),
      '라벤더': Color(0xffc8b7e8),
      '쿨핑크': Color(0xffd98aa5),
      '뮤트퍼플': Color(0xffa8a6bc),
      '블루그레이': Color(0xff7e9ab8),
      '소프트 네이비': Color(0xff34465e),
      '라이트 민트': Color(0xffbfd8d2),
      '라이트 그레이': Color(0xffd8dce2),
      '스카이블루': Color(0xffafcbef),
      '쿨 화이트': Color(0xfff4f5f7),
      '더스티 블루': Color(0xff6f8faa),
      '카멜': Color(0xffbd8a58),
      '브라운': Color(0xff7b563d),
      '초콜릿': Color(0xff4f372d),
      '머스타드': Color(0xffd1a339),
      '올리브': Color(0xff7b8750),
      '웜 베이지': Color(0xffd8b990),
      '카키': Color(0xff777246),
      '딥 베이지': Color(0xffb69a74),
      '네이비': Color(0xff1d2f5f),
      '블랙': Color(0xff171717),
      '화이트': Color(0xfff8f8f4),
      '로열 블루': Color(0xff254cbd),
      '버건디': Color(0xff74213b),
      '실버': Color(0xffc8ced8),
      '차콜': Color(0xff2b2d33),
      '딥 블루': Color(0xff071d49),
    };
    return namedColors[name];
  }

  List<Color> _fallbackPaletteColors(String type) {
    switch (type) {
      case 'spring_warm':
        return const [
          Color(0xfffff4e0),
          Color(0xfff8d86a),
          Color(0xfff6b48f),
          Color(0xfff47c72),
          Color(0xffa8dcc1),
          Color(0xffd9b98f),
        ];
      case 'summer_cool':
        return const [
          Color(0xfff6f3f0),
          Color(0xffc8b7e8),
          Color(0xffafcbef),
          Color(0xffd98aa5),
          Color(0xffbfd8d2),
          Color(0xff4b5f7a),
        ];
      case 'autumn_warm':
        return const [
          Color(0xffe8d2b0),
          Color(0xffc6922d),
          Color(0xffb85c38),
          Color(0xff8f3f2b),
          Color(0xff6f7a3c),
          Color(0xff4b2e1f),
        ];
      case 'winter_cool':
        return const [
          Color(0xffffffff),
          Color(0xff050505),
          Color(0xff1f4ed8),
          Color(0xffd91e76),
          Color(0xfff2c9d8),
          Color(0xff007a6c),
        ];
      default:
        return [_seasonAccent(type)];
    }
  }
}

class _PaletteSwatch {
  final String name;
  final Color color;

  const _PaletteSwatch(this.name, this.color);
}

class _ColorUsageCard extends StatelessWidget {
  final PersonalColorProfile result;

  const _ColorUsageCard({required this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '코디 추천에 이렇게 반영돼요',
            style: TextStyle(
              color: AppColors.ink,
              fontSize: 13,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 11),
          _UsageRow(
            '상의',
            _usageGuide(result.type).top,
            color: _seasonAccent(result.type).withValues(alpha: 0.1),
            textColor: _seasonAccent(result.type),
          ),
          const SizedBox(height: 8),
          _UsageRow(
            '포인트',
            _usageGuide(result.type).point,
            color: _seasonAccent(result.type).withValues(alpha: 0.1),
            textColor: _seasonAccent(result.type),
          ),
          const SizedBox(height: 8),
          _UsageRow(
            '주의',
            _usageGuide(result.type).avoid,
            color: _seasonAccent(result.type).withValues(alpha: 0.1),
            textColor: _seasonAccent(result.type),
          ),
        ],
      ),
    );
  }
}

class _UsageGuide {
  final String top;
  final String point;
  final String avoid;

  const _UsageGuide({
    required this.top,
    required this.point,
    required this.avoid,
  });
}

_UsageGuide _usageGuide(String type) {
  switch (type) {
    case 'spring_warm':
      return const _UsageGuide(
        top: '코랄, 피치, 크림처럼 화사한 웜 컬러를 우선 추천',
        point: '오렌지, 애플그린, 살구 톤으로 생기 있는 포인트 매칭',
        avoid: '차가운 회색이나 무거운 네이비 계열은 낮게 추천',
      );
    case 'summer_cool':
      return const _UsageGuide(
        top: '라벤더, 쿨핑크, 블루그레이처럼 부드러운 쿨 컬러 우선',
        point: '뮤트퍼플, 라이트 민트, 실버 톤으로 맑은 포인트 매칭',
        avoid: '강한 오렌지나 노란기 많은 베이지는 낮게 추천',
      );
    case 'autumn_warm':
      return const _UsageGuide(
        top: '카멜, 브라운, 웜 베이지처럼 깊은 웜 컬러 우선',
        point: '머스타드, 올리브, 초콜릿 톤으로 차분한 포인트 매칭',
        avoid: '형광 핑크나 차가운 라벤더 계열은 낮게 추천',
      );
    case 'winter_cool':
      return const _UsageGuide(
        top: '네이비, 블랙, 화이트처럼 대비감 있는 쿨 컬러 우선',
        point: '로열 블루, 버건디, 실버 톤으로 선명한 포인트 매칭',
        avoid: '탁한 카멜이나 노란기 강한 브라운은 낮게 추천',
      );
    default:
      return const _UsageGuide(
        top: '얼굴 가까이에 오는 컬러를 중심으로 추천',
        point: '분석 결과와 어울리는 컬러를 포인트로 매칭',
        avoid: '얼굴 톤이 탁해 보이는 컬러는 낮게 추천',
      );
  }
}

Color _seasonAccent(String type) {
  switch (type) {
    case 'spring_warm':
      return const Color(0xffe98945);
    case 'summer_cool':
      return const Color(0xff8d7fc5);
    case 'autumn_warm':
      return const Color(0xff8a5f35);
    case 'winter_cool':
      return const Color(0xff253a73);
    default:
      return AppColors.main;
  }
}

String _seasonEnglishName(String type) {
  switch (type) {
    case 'spring_warm':
      return 'Spring Warm';
    case 'summer_cool':
      return 'Summer Cool';
    case 'autumn_warm':
      return 'Autumn Warm';
    case 'winter_cool':
      return 'Winter Cool';
    default:
      return 'Season Type';
  }
}

List<String> _seasonTags(String type) {
  switch (type) {
    case 'spring_warm':
      return ['화사한', '생기있는', '따뜻한', '맑은', '경쾌한'];
    case 'summer_cool':
      return ['부드러운', '차분한', '시원한', '맑은', '은은한'];
    case 'autumn_warm':
      return ['깊이있는', '차분한', '따뜻한', '고급스러운', '내추럴'];
    case 'winter_cool':
      return ['선명한', '차가운', '대비감', '딥한', '또렷한'];
    default:
      return ['추천 톤', '베스트 컬러'];
  }
}

String _paletteCaption(String type) {
  switch (type) {
    case 'spring_warm':
      return '따뜻하고 생기 있는 파스텔 & 브라이트 톤';
    case 'summer_cool':
      return '부드럽고 맑은 라벤더 & 블루 베이스 톤';
    case 'autumn_warm':
      return '차분하고 깊이 있는 브라운 & 어스 톤';
    case 'winter_cool':
      return '선명하고 대비감 있는 네이비 & 딥 쿨 톤';
    default:
      return '분석 결과와 어울리는 베스트 컬러';
  }
}

class _UsageRow extends StatelessWidget {
  final String label;
  final String text;
  final Color color;
  final Color textColor;

  const _UsageRow(
    this.label,
    this.text, {
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 42,
          padding: const EdgeInsets.symmetric(vertical: 4),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: textColor,
              fontSize: 10,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        const SizedBox(width: 9),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.ink,
              fontSize: 12,
              height: 1.4,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

class _ToneChoiceChip extends StatelessWidget {
  final String label;

  const _ToneChoiceChip(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: BoxDecoration(
        color: AppColors.canvas,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.line),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: AppColors.ink,
          fontSize: 12,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _BackButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      visualDensity: VisualDensity.compact,
      padding: EdgeInsets.zero,
      alignment: Alignment.centerLeft,
      onPressed: onPressed,
      icon:
          const Icon(Icons.arrow_back_ios_new, color: AppColors.ink, size: 20),
    );
  }
}

class _OliveButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const _OliveButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.main,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}

const _previewResults = [
  PersonalColorProfile(
    type: 'spring_warm',
    label: '봄 웜',
    summary: '밝고 따뜻한 색상이 얼굴 톤을 생기 있게 보이도록 도와줄 가능성이 있어요.',
    colors: ['코랄', '피치', '오렌지', '크림', '애플그린', '살구'],
  ),
  PersonalColorProfile(
    type: 'summer_cool',
    label: '여름 쿨',
    summary: '맑고 부드러운 쿨 계열 색상이 얼굴 톤을 안정적으로 살려줄 가능성이 있어요.',
    colors: ['라벤더', '쿨핑크', '뮤트퍼플', '블루그레이', '소프트 네이비', '라이트 민트'],
  ),
  PersonalColorProfile(
    type: 'autumn_warm',
    label: '가을 웜',
    summary: '차분하고 깊이 있는 웜 계열 색상이 분위기를 자연스럽게 살려줄 가능성이 있어요.',
    colors: ['카멜', '브라운', '초콜릿', '머스타드', '올리브', '웜 베이지'],
  ),
  PersonalColorProfile(
    type: 'winter_cool',
    label: '겨울 쿨',
    summary: '선명하고 대비감 있는 쿨 계열 색상이 인상을 또렷하게 보여줄 가능성이 있어요.',
    colors: ['네이비', '블랙', '화이트', '로열 블루', '버건디', '실버'],
  ),
];
