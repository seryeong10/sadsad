import 'package:flutter/material.dart';

import '../models/style_profile.dart';
import '../theme/app_colors.dart';
import '../widgets/app_button.dart';
import 'avatar_home_page.dart';

const _previewAvatarData =
    'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+/p9sAAAAASUVORK5CYII=';

class SkeletonDiagnosisPreviewPage extends StatelessWidget {
  final String gender;

  const SkeletonDiagnosisPreviewPage({
    super.key,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return SkeletonDiagnosisIntroPage(
      gender: gender,
      avatarImageData: _previewAvatarData,
    );
  }
}

class SkeletonDiagnosisIntroPage extends StatelessWidget {
  final String gender;
  final String avatarImageData;
  final PersonalColorProfile? personalColorProfile;

  const SkeletonDiagnosisIntroPage({
    super.key,
    required this.gender,
    required this.avatarImageData,
    this.personalColorProfile,
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
              const SizedBox(height: 42),
              const Center(
                child: Column(
                  children: [
                    Text(
                      '나에게 맞는\n핏 찾기',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.ink,
                        fontSize: 28,
                        height: 1.22,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 18),
                    Text(
                      '간단한 자가진단으로 골격 스타일을 확인하고\n추천 코디의 실루엣에 반영해요.',
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
              const SizedBox(height: 42),
              const _SkeletonTypePreview(),
              const Spacer(),
              AppButton(
                text: '자가진단 시작하기',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SkeletonQuestionPage(
                        gender: gender,
                        avatarImageData: avatarImageData,
                        personalColorProfile: personalColorProfile,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              AppButton(
                text: '건너뛰기',
                isPrimary: false,
                onPressed: () => _openHome(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => AvatarHomePage(
          gender: gender,
          avatarImageData: avatarImageData,
          personalColorProfile: personalColorProfile,
        ),
      ),
    );
  }
}

class SkeletonQuestionPage extends StatefulWidget {
  final String gender;
  final String avatarImageData;
  final PersonalColorProfile? personalColorProfile;

  const SkeletonQuestionPage({
    super.key,
    required this.gender,
    required this.avatarImageData,
    this.personalColorProfile,
  });

  @override
  State<SkeletonQuestionPage> createState() => _SkeletonQuestionPageState();
}

class _SkeletonQuestionPageState extends State<SkeletonQuestionPage> {
  int _questionIndex = 0;
  late final List<_SkeletonQuestion> _questionList;
  late final List<String?> _answers;

  @override
  void initState() {
    super.initState();
    _questionList = _questionsForGender(widget.gender);
    _answers = List<String?>.filled(_questionList.length, null);
  }

  _SkeletonQuestion get _question => _questionList[_questionIndex];
  bool get _hasAnswer => _answers[_questionIndex] != null;
  bool get _isLast => _questionIndex == _questionList.length - 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(22, 12, 22, 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _BackButton(
                onPressed: () {
                  if (_questionIndex == 0) {
                    Navigator.pop(context);
                  } else {
                    setState(() => _questionIndex -= 1);
                  }
                },
              ),
              const SizedBox(height: 14),
              _ProgressHeader(
                current: _questionIndex + 1,
                total: _questionList.length,
              ),
              const SizedBox(height: 42),
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Q${_questionIndex + 1}. ${_question.title}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.ink,
                    fontSize: 22,
                    height: 1.35,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(height: 26),
              Expanded(
                child: ListView.separated(
                  itemCount: _question.options.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 18),
                  itemBuilder: (context, index) {
                    final option = _question.options[index];
                    return _QuestionOptionCard(
                      option: option,
                      selected: _answers[_questionIndex] == option.type,
                      onTap: () => setState(() {
                        _answers[_questionIndex] = option.type;
                      }),
                    );
                  },
                ),
              ),
              const SizedBox(height: 14),
              _OliveActionButton(
                text: _isLast ? '결과 보기' : '다음',
                enabled: _hasAnswer,
                onPressed: _moveNext,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _moveNext() {
    if (!_hasAnswer) return;
    if (!_isLast) {
      setState(() => _questionIndex += 1);
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => SkeletonResultPage(
          gender: widget.gender,
          avatarImageData: widget.avatarImageData,
          personalColorProfile: widget.personalColorProfile,
          skeletonType: _scoreResult(),
        ),
      ),
    );
  }

  String _scoreResult() {
    final scores = {'스트레이트': 0, '웨이브': 0, '내추럴': 0};
    for (final answer in _answers.whereType<String>()) {
      scores[answer] = (scores[answer] ?? 0) + 1;
    }

    return scores.entries.reduce((best, entry) {
      return entry.value > best.value ? entry : best;
    }).key;
  }
}

class SkeletonResultPage extends StatelessWidget {
  final String gender;
  final String avatarImageData;
  final PersonalColorProfile? personalColorProfile;
  final String skeletonType;

  const SkeletonResultPage({
    super.key,
    required this.gender,
    required this.avatarImageData,
    required this.personalColorProfile,
    required this.skeletonType,
  });

  @override
  Widget build(BuildContext context) {
    final result = _resultForGender(skeletonType, gender);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(22, 12, 22, 22),
          child: Column(
            children: [
              Row(
                children: [
                  _BackButton(onPressed: () => Navigator.pop(context)),
                  const Expanded(
                    child: Text(
                      '진단 결과',
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
              const SizedBox(height: 18),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _ResultHero(result: result, gender: gender),
                      const SizedBox(height: 12),
                      _ResultDetailCard(result: result),
                      const SizedBox(height: 12),
                      const Text(
                        '자가진단 결과이며 취향과 착용감에 따라 달라질 수 있어요.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.muted,
                          fontSize: 11,
                          height: 1.4,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 14),
              _OliveActionButton(
                text: '이 결과로 추천받기',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AvatarHomePage(
                        gender: gender,
                        avatarImageData: avatarImageData,
                        personalColorProfile: personalColorProfile,
                        skeletonProfile: SkeletonProfile(
                          type: skeletonType,
                          fitConcern: '없음',
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              AppButton(
                text: '다시 진단하기',
                isPrimary: false,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SkeletonQuestionPage(
                        gender: gender,
                        avatarImageData: avatarImageData,
                        personalColorProfile: personalColorProfile,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkeletonTypePreview extends StatelessWidget {
  const _SkeletonTypePreview();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 328,
      padding: const EdgeInsets.fromLTRB(14, 18, 14, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0f000000),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: const Column(
        children: [
          Text(
            '3가지 핏 타입을 확인해보세요',
            style: TextStyle(
              color: AppColors.main,
              fontSize: 15,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 14),
          Expanded(
            child: Row(
              children: [
                _TypeFigure(
                  number: '01',
                  label: '스트레이트',
                  helper: '정돈된 실루엣',
                  type: 'straight',
                ),
                SizedBox(width: 10),
                _TypeFigure(
                  number: '02',
                  label: '웨이브',
                  helper: '부드러운 곡선',
                  type: 'wave',
                ),
                SizedBox(width: 10),
                _TypeFigure(
                  number: '03',
                  label: '내추럴',
                  helper: '여유로운 레이어',
                  type: 'natural',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TypeFigure extends StatelessWidget {
  final String number;
  final String label;
  final String helper;
  final String type;

  const _TypeFigure({
    required this.number,
    required this.label,
    required this.helper,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.fromLTRB(8, 10, 8, 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0d000000),
              blurRadius: 14,
              offset: Offset(0, 7),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: 34,
              height: 34,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.main),
              ),
              child: Text(
                number,
                style: const TextStyle(
                  color: AppColors.main,
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: CustomPaint(
                painter: _BodySilhouettePainter(type: type),
                child: const SizedBox.expand(),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              maxLines: 1,
              style: const TextStyle(
                color: AppColors.ink,
                fontSize: 13,
                fontWeight: FontWeight.w900,
              ),
            ),
            Container(
              width: 16,
              height: 1,
              margin: const EdgeInsets.symmetric(vertical: 6),
              color: AppColors.point,
            ),
            Text(
              helper,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.main,
                fontSize: 10,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BodySilhouettePainter extends CustomPainter {
  final String type;

  const _BodySilhouettePainter({
    required this.type,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..color = AppColors.main;

    final center = size.width / 2;
    final top = size.height * 0.08;
    final shoulderY = size.height * 0.24;
    final waistY = size.height * 0.48;
    final hemY = size.height * 0.78;
    final shoulder = size.width * (type == 'natural' ? 0.33 : 0.28);
    final waist = size.width *
        (type == 'wave'
            ? 0.15
            : type == 'natural'
                ? 0.27
                : 0.24);
    final hem = size.width *
        (type == 'wave'
            ? 0.28
            : type == 'natural'
                ? 0.31
                : 0.24);

    canvas.drawCircle(Offset(center, top + 6), 5, paint);
    canvas.drawLine(
        Offset(center, top + 11), Offset(center, shoulderY - 8), paint);

    final path = Path()
      ..moveTo(center - shoulder, shoulderY)
      ..quadraticBezierTo(center - waist, waistY * 0.82, center - waist, waistY)
      ..lineTo(center - hem, hemY)
      ..lineTo(center + hem, hemY)
      ..lineTo(center + waist, waistY)
      ..quadraticBezierTo(
          center + waist, waistY * 0.82, center + shoulder, shoulderY);
    canvas.drawPath(path, paint);

    final dashPaint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = AppColors.main.withValues(alpha: 0.45);
    canvas.drawLine(Offset(center - size.width * 0.43, shoulderY + 12),
        Offset(center - size.width * 0.43, hemY + 4), dashPaint);
    canvas.drawLine(Offset(center + size.width * 0.43, shoulderY + 12),
        Offset(center + size.width * 0.43, hemY + 4), dashPaint);
    canvas.drawLine(Offset(center - waist * 0.9, waistY),
        Offset(center + waist * 0.9, waistY), dashPaint);

    canvas.drawLine(
        Offset(center, hemY), Offset(center, size.height * 0.92), paint);
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(center, size.height * 0.94),
        width: size.width * 0.52,
        height: 9,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _BodySilhouettePainter oldDelegate) {
    return oldDelegate.type != type;
  }
}

class _QuestionOptionCard extends StatelessWidget {
  final _SkeletonOption option;
  final bool selected;
  final VoidCallback onTap;

  const _QuestionOptionCard({
    required this.option,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        constraints: const BoxConstraints(minHeight: 148),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: selected ? AppColors.selectedBackground : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? AppColors.main : AppColors.line,
            width: selected ? 1.4 : 1,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x08000000),
              blurRadius: 14,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 100,
                  height: 120,
                  decoration: BoxDecoration(
                    color: AppColors.canvas,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: option.assetPath == null
                      ? Icon(option.icon, color: AppColors.main, size: 42)
                      : Image.asset(
                          option.assetPath!,
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                ),
                Positioned(
                  left: 8,
                  top: 8,
                  child: Container(
                    width: 28,
                    height: 28,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: AppColors.main,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      option.letter,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Text(
                option.label,
                style: const TextStyle(
                  color: AppColors.ink,
                  fontSize: 18,
                  height: 1.45,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ResultHero extends StatelessWidget {
  final _SkeletonResult result;
  final String gender;

  const _ResultHero({
    required this.result,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    final isMale = gender == 'male';
    final resultImagePath = _resultImagePath(result.type, isMale);

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 222),
      padding: const EdgeInsets.fromLTRB(20, 20, 16, 18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.selectedBackground, AppColors.canvas],
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '당신에게 가까운 골격 스타일은',
                  style: TextStyle(
                    color: AppColors.ink,
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 14),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _resultTitle(result.type),
                    style: const TextStyle(
                      color: AppColors.main,
                      fontSize: 31,
                      height: 1,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 124,
            height: 208,
            child: Image.asset(
              resultImagePath,
              fit: BoxFit.contain,
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }

  String _resultImagePath(String type, bool isMale) {
    final genderPrefix = isMale ? 'male' : 'female';
    switch (type) {
      case 'STRAIGHT':
        return 'assets/skeleton/results/${genderPrefix}_straight.png';
      case 'WAVE':
        return 'assets/skeleton/results/${genderPrefix}_wave.png';
      default:
        return 'assets/skeleton/results/${genderPrefix}_natural.png';
    }
  }

  String _resultTitle(String type) {
    switch (type) {
      case 'STRAIGHT':
        return '스트레이트 타입';
      case 'WAVE':
        return '웨이브 타입';
      default:
        return '내추럴 타입';
    }
  }
}

class _ResultDetailCard extends StatelessWidget {
  final _SkeletonResult result;

  const _ResultDetailCard({required this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '타입 키워드',
            style: TextStyle(
              color: AppColors.ink,
              fontSize: 12,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 7,
            runSpacing: 7,
            children: result.keywords.map((keyword) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.chip,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.line),
                ),
                child: Text(
                  '# $keyword',
                  style: const TextStyle(
                    color: AppColors.ink,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 18),
          const Divider(height: 1, color: AppColors.line),
          const SizedBox(height: 18),
          Text(
            result.fitGuide,
            style: const TextStyle(
              color: AppColors.ink,
              fontSize: 13,
              height: 1.65,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 18),
          const Divider(height: 1, color: AppColors.line),
          const SizedBox(height: 18),
          const Text(
            '추천 아이템',
            style: TextStyle(
              color: AppColors.main,
              fontSize: 13,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: List.generate(result.itemIcons.length, (index) {
              final icon = result.itemIcons[index];
              final label = result.itemLabels[index];
              return Expanded(
                child: Container(
                  height: 78,
                  margin: EdgeInsets.only(
                    right: index == result.itemIcons.length - 1 ? 0 : 7,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.line),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(icon, color: AppColors.ink, size: 27),
                      const SizedBox(height: 7),
                      Text(
                        label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.ink,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
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
      onPressed: onPressed,
      visualDensity: VisualDensity.compact,
      padding: EdgeInsets.zero,
      alignment: Alignment.centerLeft,
      icon:
          const Icon(Icons.arrow_back_ios_new, color: AppColors.ink, size: 20),
    );
  }
}

class _ProgressHeader extends StatelessWidget {
  final int current;
  final int total;

  const _ProgressHeader({
    required this.current,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: LinearProgressIndicator(
              minHeight: 4,
              value: current / total,
              backgroundColor: AppColors.chip,
              valueColor: const AlwaysStoppedAnimation(AppColors.main),
            ),
          ),
        ),
        const SizedBox(width: 14),
        Text(
          '$current / $total',
          style: const TextStyle(
            color: AppColors.ink,
            fontSize: 12,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}

class _OliveActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool enabled;

  const _OliveActionButton({
    required this.text,
    required this.onPressed,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.main,
          disabledBackgroundColor: AppColors.chip,
          foregroundColor: Colors.white,
          disabledForegroundColor: AppColors.muted,
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

class _SkeletonQuestion {
  final String title;
  final List<_SkeletonOption> options;

  const _SkeletonQuestion({
    required this.title,
    required this.options,
  });
}

class _SkeletonOption {
  final String letter;
  final String type;
  final String label;
  final IconData icon;
  final String? assetPath;

  const _SkeletonOption({
    required this.letter,
    required this.type,
    required this.label,
    required this.icon,
    this.assetPath,
  });
}

class _SkeletonResult {
  final String type;
  final String summary;
  final String fitGuide;
  final List<String> keywords;
  final IconData icon;
  final List<IconData> itemIcons;
  final List<String> itemLabels;

  const _SkeletonResult({
    required this.type,
    required this.summary,
    required this.fitGuide,
    required this.keywords,
    required this.icon,
    required this.itemIcons,
    required this.itemLabels,
  });
}

const _questions = [
  _SkeletonQuestion(
    title: '상체 느낌은 어떤 편인가요?',
    options: [
      _SkeletonOption(
        letter: 'A',
        type: '스트레이트',
        label: '탄탄하고\n입체감이 있는 편',
        icon: Icons.accessibility_new,
        assetPath: 'assets/skeleton/female_q1_a.png',
      ),
      _SkeletonOption(
        letter: 'B',
        type: '웨이브',
        label: '부드럽고\n여리한 편',
        icon: Icons.favorite_border,
        assetPath: 'assets/skeleton/female_q1_b.png',
      ),
      _SkeletonOption(
        letter: 'C',
        type: '내추럴',
        label: '뼈대나 관절감이\n도드라지는 편',
        icon: Icons.dry_cleaning_outlined,
        assetPath: 'assets/skeleton/female_q1_c.png',
      ),
    ],
  ),
  _SkeletonQuestion(
    title: '어깨와 쇄골은\n어떤 편인가요?',
    options: [
      _SkeletonOption(
        letter: 'A',
        type: '스트레이트',
        label: '둥글고\n두께감 있는 어깨',
        icon: Icons.checkroom_outlined,
        assetPath: 'assets/skeleton/female_q2_a.png',
      ),
      _SkeletonOption(
        letter: 'B',
        type: '내추럴',
        label: '각지거나\n쇄골이 도드라짐',
        icon: Icons.cut_outlined,
        assetPath: 'assets/skeleton/female_q2_b.png',
      ),
      _SkeletonOption(
        letter: 'C',
        type: '웨이브',
        label: '좁고\n가녀린 어깨',
        icon: Icons.layers_outlined,
        assetPath: 'assets/skeleton/female_q2_c.png',
      ),
    ],
  ),
  _SkeletonQuestion(
    title: '허리와 골반은\n어떤 편인가요?',
    options: [
      _SkeletonOption(
        letter: 'A',
        type: '스트레이트',
        label: '허리 굴곡이 적고\n직선적인 편',
        icon: Icons.minimize,
        assetPath: 'assets/skeleton/female_q3_a.png',
      ),
      _SkeletonOption(
        letter: 'B',
        type: '내추럴',
        label: '허리보다\n프레임이 먼저 보임',
        icon: Icons.auto_awesome_outlined,
        assetPath: 'assets/skeleton/female_q3_b.png',
      ),
      _SkeletonOption(
        letter: 'C',
        type: '웨이브',
        label: '허리가 잘록하고\n골반 라인이 드러남',
        icon: Icons.style_outlined,
        assetPath: 'assets/skeleton/female_q3_c.png',
      ),
    ],
  ),
  _SkeletonQuestion(
    title: '팔다리와 손목은\n어떤 편인가요?',
    options: [
      _SkeletonOption(
        letter: 'A',
        type: '스트레이트',
        label: '팔다리가\n탄탄한 편',
        icon: Icons.straighten_outlined,
        assetPath: 'assets/skeleton/female_q4_a.png',
      ),
      _SkeletonOption(
        letter: 'B',
        type: '내추럴',
        label: '손목·관절이\n도드라지는 편',
        icon: Icons.change_history_outlined,
        assetPath: 'assets/skeleton/female_q4_b.png',
      ),
      _SkeletonOption(
        letter: 'C',
        type: '웨이브',
        label: '팔·다리 선이\n부드러운 편',
        icon: Icons.waves_outlined,
        assetPath: 'assets/skeleton/female_q4_c.png',
      ),
    ],
  ),
  _SkeletonQuestion(
    title: '잘 어울리는 옷은\n어떤 느낌인가요?',
    options: [
      _SkeletonOption(
        letter: 'A',
        type: '스트레이트',
        label: '깔끔한 셔츠·V넥\n심플핏이 잘 어울림',
        icon: Icons.circle_outlined,
        assetPath: 'assets/skeleton/female_q5_a.png',
      ),
      _SkeletonOption(
        letter: 'B',
        type: '내추럴',
        label: '오버핏·와이드핏\n루즈핏이 잘 어울림',
        icon: Icons.spa_outlined,
        assetPath: 'assets/skeleton/female_q5_b.png',
      ),
      _SkeletonOption(
        letter: 'C',
        type: '웨이브',
        label: '하이웨스트·크롭\n허리강조가 잘 어울림',
        icon: Icons.blur_circular_outlined,
        assetPath: 'assets/skeleton/female_q5_c.png',
      ),
    ],
  ),
];

const _maleQuestions = [
  _SkeletonQuestion(
    title: '상체 느낌은 어떤 편인가요?',
    options: [
      _SkeletonOption(
        letter: 'A',
        type: '스트레이트',
        label: '가슴·어깨가\n탄탄하고 두께감 있는 편',
        icon: Icons.accessibility_new,
        assetPath: 'assets/skeleton/male_q1_a.png',
      ),
      _SkeletonOption(
        letter: 'B',
        type: '내추럴',
        label: '어깨가 넓고\n골격이 먼저 보이는 편',
        icon: Icons.favorite_border,
        assetPath: 'assets/skeleton/male_q1_b.png',
      ),
      _SkeletonOption(
        letter: 'C',
        type: '웨이브',
        label: '상체가 슬림하고\n선이 부드러운 편',
        icon: Icons.dry_cleaning_outlined,
        assetPath: 'assets/skeleton/male_q1_c.png',
      ),
    ],
  ),
  _SkeletonQuestion(
    title: '어깨와 목선은\n어떤 편인가요?',
    options: [
      _SkeletonOption(
        letter: 'A',
        type: '스트레이트',
        label: '어깨가 둥글고\n목이 짧아 보이는 편',
        icon: Icons.checkroom_outlined,
        assetPath: 'assets/skeleton/male_q2_a.png',
      ),
      _SkeletonOption(
        letter: 'B',
        type: '내추럴',
        label: '어깨가 각지고\n프레임이 도드라지는 편',
        icon: Icons.cut_outlined,
        assetPath: 'assets/skeleton/male_q2_b.png',
      ),
      _SkeletonOption(
        letter: 'C',
        type: '웨이브',
        label: '목선이 길고\n어깨가 비교적 가는 편',
        icon: Icons.layers_outlined,
        assetPath: 'assets/skeleton/male_q2_c.png',
      ),
    ],
  ),
  _SkeletonQuestion(
    title: '허리와 몸통은\n어떤 편인가요?',
    options: [
      _SkeletonOption(
        letter: 'A',
        type: '스트레이트',
        label: '몸통이 탄탄하고\n허리 굴곡이 적은 편',
        icon: Icons.business_center_outlined,
        assetPath: 'assets/skeleton/male_q3_a.png',
      ),
      _SkeletonOption(
        letter: 'B',
        type: '내추럴',
        label: '허리보다\n전체 프레임이 먼저 보이는 편',
        icon: Icons.style_outlined,
        assetPath: 'assets/skeleton/male_q3_b.png',
      ),
      _SkeletonOption(
        letter: 'C',
        type: '웨이브',
        label: '허리가 비교적 들어가고\n상하체 대비가 있는 편',
        icon: Icons.dry_cleaning_outlined,
        assetPath: 'assets/skeleton/male_q3_c.png',
      ),
    ],
  ),
  _SkeletonQuestion(
    title: '팔다리와 관절은\n어떤 편인가요?',
    options: [
      _SkeletonOption(
        letter: 'A',
        type: '스트레이트',
        label: '팔·다리에 근육이 잘 붙고\n탄탄한 편',
        icon: Icons.straighten_outlined,
        assetPath: 'assets/skeleton/male_q4_a.png',
      ),
      _SkeletonOption(
        letter: 'B',
        type: '내추럴',
        label: '손목·무릎 등\n관절감이 도드라지는 편',
        icon: Icons.change_history_outlined,
        assetPath: 'assets/skeleton/male_q4_b.png',
      ),
      _SkeletonOption(
        letter: 'C',
        type: '웨이브',
        label: '팔다리가 가늘고\n선이 부드러운 편',
        icon: Icons.waves_outlined,
        assetPath: 'assets/skeleton/male_q4_c.png',
      ),
    ],
  ),
  _SkeletonQuestion(
    title: '잘 어울리는 옷은\n어떤 느낌인가요?',
    options: [
      _SkeletonOption(
        letter: 'A',
        type: '스트레이트',
        label: '기본핏 티셔츠·V넥·\n정돈된 자켓이 잘 어울림',
        icon: Icons.circle_outlined,
        assetPath: 'assets/skeleton/male_q5_a.png',
      ),
      _SkeletonOption(
        letter: 'B',
        type: '내추럴',
        label: '오버핏·와이드핏·\n워크웨어가 잘 어울림',
        icon: Icons.spa_outlined,
        assetPath: 'assets/skeleton/male_q5_b.png',
      ),
      _SkeletonOption(
        letter: 'C',
        type: '웨이브',
        label: '짧은 기장 상의·레이어드·\n슬림핏이 잘 어울림',
        icon: Icons.blur_circular_outlined,
        assetPath: 'assets/skeleton/male_q5_c.png',
      ),
    ],
  ),
];

List<_SkeletonQuestion> _questionsForGender(String gender) {
  return gender == 'male' ? _maleQuestions : _questions;
}

const _results = {
  '스트레이트': _SkeletonResult(
    type: 'STRAIGHT',
    summary: '',
    fitGuide:
        '상체에 탄탄한 볼륨감이 있고 몸의 선이 비교적 직선적으로 보이는 타입.\n허리 굴곡이 강하게 드러나기보다는 전체적으로 깔끔하고 정돈된 실루엣이 잘 어울림.\n심플한 핏, 일자 라인, 단정한 상의가 장점을 살려줌.',
    keywords: ['정돈감', '심플핏', '깔끔한 선'],
    icon: Icons.accessibility_new,
    itemIcons: [
      Icons.checkroom_outlined,
      Icons.straighten_outlined,
      Icons.work_outline,
      Icons.shopping_bag_outlined,
    ],
    itemLabels: ['자켓', '슬랙스', '셔츠', '로퍼'],
  ),
  '웨이브': _SkeletonResult(
    type: 'WAVE',
    summary: '',
    fitGuide:
        '상체가 비교적 얇고 부드러운 곡선이 잘 드러나는 타입.\n허리선이 잘록해 보이고 하체에 볼륨이 붙기 쉬운 편.\n하이웨스트, 짧은 기장 상의, 부드러운 소재처럼 비율을 살리는 스타일이 잘 어울림.',
    keywords: ['부드러움', '여성스러움', '허리선'],
    icon: Icons.favorite_border,
    itemIcons: [
      Icons.checkroom_outlined,
      Icons.change_history_outlined,
      Icons.auto_awesome_outlined,
      Icons.shopping_bag_outlined,
    ],
    itemLabels: ['블라우스', '가디건', '스커트', '부츠컷'],
  ),
  '내추럴': _SkeletonResult(
    type: 'NATURAL',
    summary: '',
    fitGuide:
        '어깨, 손목, 무릎 등 골격감이 자연스럽게 드러나는 타입.\n전체적인 프레임이 크고 시원한 느낌이 있으며 여유 있는 실루엣이 잘 어울림.\n오버핏, 와이드핏, 린넨·데님처럼 자연스러운 소재가 장점을 살려줌.',
    keywords: ['레이어드', '여유감', '텍스처'],
    icon: Icons.dry_cleaning_outlined,
    itemIcons: [
      Icons.layers_outlined,
      Icons.waves_outlined,
      Icons.style_outlined,
      Icons.shopping_bag_outlined,
    ],
    itemLabels: ['오버핏 셔츠', '와이드팬츠', '가디건', '스니커즈'],
  ),
};

_SkeletonResult _resultForGender(String type, String gender) {
  if (gender != 'male') {
    return _results[type]!;
  }

  switch (type) {
    case '스트레이트':
      return const _SkeletonResult(
        type: 'STRAIGHT',
        summary: '',
        fitGuide:
            '상체가 탄탄하고 어깨와 가슴에 두께감이 있는 타입.\n몸통이 직선적으로 보이며 깔끔하고 단정한 핏이 잘 어울림.\n기본핏 셔츠, 슬랙스, 테일러드 자켓처럼 정돈된 스타일이 장점을 살려줌.',
        keywords: ['정돈감', '기본핏', '깔끔한 선'],
        icon: Icons.accessibility_new,
        itemIcons: [
          Icons.checkroom_outlined,
          Icons.straighten_outlined,
          Icons.work_outline,
          Icons.shopping_bag_outlined,
        ],
        itemLabels: ['블레이저', '슬랙스', '셔츠', '로퍼'],
      );
    case '웨이브':
      return const _SkeletonResult(
        type: 'WAVE',
        summary: '',
        fitGuide:
            '전체적으로 슬림하고 부드러운 선이 느껴지는 타입.\n상체가 얇아 보이거나 목선이 길어 보일 수 있으며 과한 오버핏보다는 균형 잡힌 핏이 잘 어울림.\n세미슬림핏, 레이어드, 가디건, 니트처럼 부드러운 스타일이 잘 맞음.',
        keywords: ['가벼움', '세미핏', '상체 라인'],
        icon: Icons.favorite_border,
        itemIcons: [
          Icons.checkroom_outlined,
          Icons.change_history_outlined,
          Icons.auto_awesome_outlined,
          Icons.shopping_bag_outlined,
        ],
        itemLabels: ['니트', '가디건', '팬츠', '로퍼'],
      );
    default:
      return const _SkeletonResult(
        type: 'NATURAL',
        summary: '',
        fitGuide:
            '어깨와 관절 등 골격감이 잘 보이고 프레임이 큰 타입.\n긴 팔다리와 여유 있는 실루엣이 자연스럽게 어울림.\n오버핏 셔츠, 와이드 팬츠, 워크자켓, 데님처럼 편안하고 구조감 있는 스타일이 장점을 살려줌.',
        keywords: ['오버핏', '레이어드', '텍스처'],
        icon: Icons.dry_cleaning_outlined,
        itemIcons: [
          Icons.layers_outlined,
          Icons.waves_outlined,
          Icons.style_outlined,
          Icons.shopping_bag_outlined,
        ],
        itemLabels: ['오버핏 셔츠', '와이드팬츠', '워크자켓', '스니커즈'],
      );
  }
}
