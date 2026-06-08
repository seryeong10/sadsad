import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/style_profile.dart';
import '../services/outfit_recommendation_service.dart';
import '../services/style_closet_store.dart';
import '../theme/app_colors.dart';
import 'mood_page.dart';

enum _MoodEntryStep { method, mood, closet }

class MoodEntryPage extends StatefulWidget {
  final String gender;
  final String avatarImageData;
  final PersonalColorProfile? personalColorProfile;
  final SkeletonProfile? skeletonProfile;

  const MoodEntryPage({
    super.key,
    required this.gender,
    required this.avatarImageData,
    this.personalColorProfile,
    this.skeletonProfile,
  });

  @override
  State<MoodEntryPage> createState() => _MoodEntryPageState();
}

class _MoodEntryPageState extends State<MoodEntryPage> {
  _MoodEntryStep _step = _MoodEntryStep.method;

  @override
  Widget build(BuildContext context) {
    switch (_step) {
      case _MoodEntryStep.method:
        return _RecommendationMethodView(
          onMoodSelected: () => setState(() => _step = _MoodEntryStep.mood),
          onClosetSelected: () => setState(() => _step = _MoodEntryStep.closet),
        );
      case _MoodEntryStep.mood:
        return MoodPage(
          gender: widget.gender,
          avatarImageData: widget.avatarImageData,
          personalColorProfile: widget.personalColorProfile,
          skeletonProfile: widget.skeletonProfile,
          embeddedInTab: true,
          onBackPressed: () => setState(() => _step = _MoodEntryStep.method),
        );
      case _MoodEntryStep.closet:
        return _ClosetRecommendationView(
          onBackPressed: () => setState(() => _step = _MoodEntryStep.method),
        );
    }
  }
}

class _RecommendationMethodView extends StatelessWidget {
  final VoidCallback onMoodSelected;
  final VoidCallback onClosetSelected;

  const _RecommendationMethodView({
    required this.onMoodSelected,
    required this.onClosetSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 356),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 6, 0, 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _BackButton(),
                  const SizedBox(height: 24),
                  const Text.rich(
                    TextSpan(
                      text: '오늘 어떤 ',
                      children: [
                        TextSpan(
                          text: '방식으로\n코디',
                          style: TextStyle(color: AppColors.main),
                        ),
                        TextSpan(text: '해볼까요?'),
                      ],
                    ),
                    style: TextStyle(
                      color: AppColors.ink,
                      fontSize: 29,
                      height: 1.25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    '상황과 무드를 고르거나,\n내 옷 사진을 등록해서 코디를 추천받아보세요.',
                    style: TextStyle(
                      color: AppColors.muted,
                      fontSize: 14,
                      height: 1.6,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 30),
                  _MethodCard(
                    icon: Icons.checkroom_outlined,
                    title: '상황/무드로 추천받기',
                    description:
                        '데이트, 여행, 출근 등\n상황과 원하는 무드를 선택해\n나에게 맞는 코디를 추천받아요.',
                    buttonText: '선택하러 가기',
                    onTap: onMoodSelected,
                  ),
                  const SizedBox(height: 14),
                  _MethodCard(
                    icon: Icons.add_circle,
                    title: '내 옷으로 추천받기',
                    description: '내가 가진 옷 사진을 등록하면\n그 옷과 어울리는 코디를 추천받아요.',
                    buttonText: '옷 사진 등록하기',
                    onTap: onClosetSelected,
                    isCloset: true,
                  ),
                  const SizedBox(height: 14),
                  const _TipCard(text: '원하는 방식으로 코디 추천을 시작해보세요.'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MethodCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback onTap;
  final bool isCloset;

  const _MethodCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onTap,
    this.isCloset = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(26, 28, 26, 28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.line),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0a000000),
            blurRadius: 14,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 92,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  isCloset ? Icons.checkroom_outlined : icon,
                  color: AppColors.main,
                  size: 64,
                ),
                if (isCloset)
                  const Positioned(
                    right: 4,
                    bottom: 5,
                    child: CircleAvatar(
                      radius: 17,
                      backgroundColor: AppColors.main,
                      child: Icon(Icons.add, color: Colors.white, size: 24),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.ink,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  style: const TextStyle(
                    color: AppColors.muted,
                    fontSize: 13,
                    height: 1.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 18),
                SizedBox(
                  width: double.infinity,
                  height: 42,
                  child: ElevatedButton(
                    onPressed: onTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.canvas,
                      foregroundColor: AppColors.main,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                        side: const BorderSide(color: AppColors.line),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            buttonText,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Icon(Icons.arrow_forward, size: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ClosetRecommendationView extends StatefulWidget {
  final VoidCallback onBackPressed;

  const _ClosetRecommendationView({required this.onBackPressed});

  @override
  State<_ClosetRecommendationView> createState() =>
      _ClosetRecommendationViewState();
}

class _ClosetRecommendationViewState extends State<_ClosetRecommendationView> {
  static const _categories = ['전체', '상의', '하의', '아우터', '원피스'];

  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;
  String _selectedCategory = '전체';

  Future<void> _pickImage(ImageSource source) async {
    final image = await _picker.pickImage(source: source);
    if (image == null) return;

    setState(() => _selectedImage = File(image.path));
  }

  void _saveSelectedImage() {
    final image = _selectedImage;
    if (image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('먼저 옷 사진을 등록해주세요.')),
      );
      return;
    }

    final item = OutfitItem.localWardrobe(
      imagePath: image.path,
      category: _selectedCategory,
    );
    StyleClosetStore.addWardrobeItem(item);

    setState(() {
      _selectedImage = null;
      if (_selectedCategory == '전체') {
        _selectedCategory = item.category;
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('내 옷장에 저장했어요. 피팅룸에서 바로 선택할 수 있어요.')),
    );
  }

  void _showImageSourceSheet() {
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
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt_outlined),
                title: const Text('카메라로 촬영'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 356),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 6, 0, 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _BackButton(onPressed: widget.onBackPressed),
                  const SizedBox(height: 24),
                  const Text.rich(
                    TextSpan(
                      text: '내 옷으로\n',
                      style: TextStyle(color: AppColors.main),
                      children: [
                        TextSpan(
                          text: '코디해볼까요?',
                          style: TextStyle(color: AppColors.ink),
                        ),
                      ],
                    ),
                    style: TextStyle(
                      fontSize: 29,
                      height: 1.25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    '옷 사진을 등록하면\n내가 가진 옷과 어울리는 코디를 추천해드려요.',
                    style: TextStyle(
                      color: AppColors.muted,
                      fontSize: 14,
                      height: 1.55,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 34),
                  const Text(
                    '내 옷장',
                    style: TextStyle(
                      color: AppColors.ink,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    height: 42,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: _categories.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 9),
                      itemBuilder: (context, index) {
                        final category = _categories[index];
                        return _ClosetCategoryChip(
                          label: category,
                          selected: _selectedCategory == category,
                          onTap: () =>
                              setState(() => _selectedCategory = category),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  _PhotoUploadBox(
                    image: _selectedImage,
                    onTap: _showImageSourceSheet,
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton.icon(
                      onPressed: _saveSelectedImage,
                      icon: const Icon(Icons.checkroom_outlined, size: 18),
                      label: const Text(
                        '내 옷장에 저장',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.ink,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 34),
                  const Row(
                    children: [
                      Expanded(
                        child: Text(
                          '최근 등록한 옷',
                          style: TextStyle(
                            color: AppColors.ink,
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Text(
                        '전체 보기',
                        style: TextStyle(
                          color: AppColors.muted,
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.muted,
                        size: 15,
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  ValueListenableBuilder<int>(
                    valueListenable: StyleClosetStore.revision,
                    builder: (context, _, __) {
                      final items = StyleClosetStore.wardrobeItems
                          .where(
                            (item) =>
                                _selectedCategory == '전체' ||
                                item.category == _selectedCategory,
                          )
                          .take(4)
                          .toList();
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: items.isEmpty ? 4 : items.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 9,
                          crossAxisSpacing: 9,
                          childAspectRatio: 1.62,
                        ),
                        itemBuilder: (_, index) {
                          if (items.isEmpty) {
                            return const _EmptyClosetTile();
                          }
                          return _WardrobePreviewTile(item: items[index]);
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 22),
                  const _TipCard(
                    text: '정면 사진일수록 더 정확해요\n옷 전체가 잘 보이도록 정면에서 촬영해주세요.',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PhotoUploadBox extends StatelessWidget {
  final File? image;
  final VoidCallback onTap;

  const _PhotoUploadBox({required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomPaint(
        painter: _DashedBorderPainter(),
        child: Container(
          width: double.infinity,
          height: 142,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(14),
          child: image == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.camera_alt_outlined,
                      color: AppColors.main,
                      size: 30,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      '옷 사진을 업로드해 주세요',
                      style: TextStyle(
                        color: AppColors.ink,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      height: 34,
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.main,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        '사진 업로드',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    image!,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
        ),
      ),
    );
  }
}

class _ClosetCategoryChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _ClosetCategoryChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        height: 40,
        constraints: const BoxConstraints(minWidth: 58),
        padding: const EdgeInsets.symmetric(horizontal: 18),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? AppColors.main : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: selected ? AppColors.main : AppColors.line),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : AppColors.ink,
            fontSize: 13,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}

class _EmptyClosetTile extends StatelessWidget {
  const _EmptyClosetTile();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.line),
      ),
    );
  }
}

class _WardrobePreviewTile extends StatelessWidget {
  final OutfitItem item;

  const _WardrobePreviewTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.line),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.file(
            File(item.imageUrl),
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) {
              return const ColoredBox(
                color: AppColors.canvas,
                child: Icon(Icons.checkroom_outlined, color: AppColors.main),
              );
            },
          ),
          Positioned(
            left: 7,
            bottom: 7,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                item.category,
                style: const TextStyle(
                  color: AppColors.ink,
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TipCard extends StatelessWidget {
  final String text;

  const _TipCard({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.canvas,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xfff0f1eb)),
      ),
      child: Row(
        children: [
          const Icon(Icons.eco_outlined, color: AppColors.main, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.ink,
                fontSize: 13,
                height: 1.45,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const _BackButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      visualDensity: VisualDensity.compact,
      padding: EdgeInsets.zero,
      alignment: Alignment.centerLeft,
      icon: const Icon(Icons.arrow_back_ios_new, size: 20),
      color: AppColors.ink,
      onPressed: onPressed ??
          () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const radius = Radius.circular(12);
    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(Offset.zero & size, radius),
      );
    final paint = Paint()
      ..color = AppColors.main
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    for (final metric in path.computeMetrics()) {
      var distance = 0.0;
      const dashWidth = 5.5;
      const dashSpace = 5.5;
      while (distance < metric.length) {
        canvas.drawPath(
          metric.extractPath(distance, distance + dashWidth),
          paint,
        );
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
