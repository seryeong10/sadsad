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
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '성별 선택',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 12),
              const Text(
                '아바타 설정을 위해 성별을 선택해주세요',
                style: TextStyle(color: AppColors.muted, fontSize: 14),
              ),
              const SizedBox(height: 40),
              _GenderButton(
                value: 'male',
                label: '남자',
                selectedValue: selectedGender,
                onTap: _selectGender,
              ),
              const SizedBox(height: 14),
              _GenderButton(
                value: 'female',
                label: '여자',
                selectedValue: selectedGender,
                onTap: _selectGender,
              ),
              const SizedBox(height: 24),
              AppButton(
                text: '다음',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PhotoUploadPage(
                        gender: selectedGender,
                        opensAvatarPageAfterGenerate: false,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              const Text(
                '건너뛰기',
                style: TextStyle(
                  color: AppColors.muted,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectGender(String gender) {
    setState(() {
      selectedGender = gender;
    });
  }
}

class _GenderButton extends StatelessWidget {
  final String value;
  final String label;
  final String selectedValue;
  final ValueChanged<String> onTap;

  const _GenderButton({
    required this.value,
    required this.label,
    required this.selectedValue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedValue == value;

    return GestureDetector(
      onTap: () => onTap(value),
      child: Container(
        height: 74,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.selectedBackground : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? AppColors.point : AppColors.line,
            width: isSelected ? 1.4 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.person_outline,
              color: isSelected ? AppColors.main : AppColors.muted,
            ),
            const SizedBox(width: 18),
            Text(
              label,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
