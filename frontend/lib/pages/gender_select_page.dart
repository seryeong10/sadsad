import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/app_button.dart';
import 'photo_upload_page.dart';

class GenderSelectPage extends StatefulWidget {
  const GenderSelectPage({super.key});

  @override
  State<GenderSelectPage> createState() => _GenderSelectPageState();
}

class _GenderSelectPageState extends State<GenderSelectPage> {
  String selectedGender = 'female';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                IconButton(
                    onPressed: () => Navigator.maybePop(context),
                    icon:
                        const Icon(Icons.arrow_back_ios_new_rounded, size: 20)),
                const Spacer(),
              ]),
              const SizedBox(height: 24),
              const Text('GET STARTED',
                  style: TextStyle(
                      color: AppColors.main,
                      fontSize: 11,
                      letterSpacing: 1.1,
                      fontWeight: FontWeight.w800)),
              const SizedBox(height: 14),
              const Text('성별을\n선택해주세요',
                  style: TextStyle(
                      color: AppColors.ink,
                      fontSize: 27,
                      height: 1.2,
                      fontWeight: FontWeight.w800)),
              const SizedBox(height: 12),
              const Text('더 정확한 맞춤 코디를 위해\n성별을 선택해주세요.',
                  style: TextStyle(
                      color: AppColors.muted, fontSize: 14, height: 1.5)),
              const Spacer(),
              Row(children: [
                Expanded(
                    child: _GenderCard(
                        value: 'male',
                        label: '남성',
                        subtitle: '남성 스타일 추천',
                        selectedValue: selectedGender,
                        onTap: _selectGender)),
                const SizedBox(width: 16),
                Expanded(
                    child: _GenderCard(
                        value: 'female',
                        label: '여성',
                        subtitle: '여성 스타일 추천',
                        selectedValue: selectedGender,
                        onTap: _selectGender)),
              ]),
              const Spacer(flex: 2),
              AppButton(
                text: '다음',
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => PhotoUploadPage(
                            gender: selectedGender,
                            opensAvatarPageAfterGenerate: false))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectGender(String gender) => setState(() => selectedGender = gender);
}

class _GenderCard extends StatelessWidget {
  final String value;
  final String label;
  final String subtitle;
  final String selectedValue;
  final ValueChanged<String> onTap;

  const _GenderCard(
      {required this.value,
      required this.label,
      required this.subtitle,
      required this.selectedValue,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    final selected = selectedValue == value;
    final female = value == 'female';
    final tint = female ? const Color(0xfff9eaf0) : const Color(0xffeaf3ff);
    final iconColor = female ? const Color(0xffd58ca5) : AppColors.main;
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () => onTap(value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        height: 156,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        decoration: BoxDecoration(
            color: selected ? const Color(0xfffbfdff) : Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
                color: selected ? AppColors.point : AppColors.line,
                width: selected ? 1.5 : 1)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircleAvatar(
              radius: 30,
              backgroundColor: tint,
              child: Icon(
                  female ? Icons.face_3_outlined : Icons.face_6_outlined,
                  color: iconColor,
                  size: 37)),
          const SizedBox(height: 10),
          Text(label,
              style: const TextStyle(
                  color: AppColors.ink,
                  fontSize: 14,
                  fontWeight: FontWeight.w700)),
          const SizedBox(height: 4),
          Text(subtitle,
              style: const TextStyle(color: AppColors.muted, fontSize: 10)),
        ]),
      ),
    );
  }
}
