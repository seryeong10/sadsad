import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/style_profile.dart';
import '../services/closet_item_analysis_service.dart';
import '../services/closet_outfit_recommendation_service.dart';
import '../services/outfit_recommendation_service.dart';
import '../services/style_closet_store.dart';
import '../theme/app_colors.dart';
import 'mood_page.dart';
import 'outfit_recommendation_page.dart';

enum _MoodEntryStep { mood, method, closet }

class MoodEntryPage extends StatefulWidget {
  final String gender;
  final String avatarImageData;
  final PersonalColorProfile? personalColorProfile;
  final SkeletonProfile? skeletonProfile;
  final VoidCallback? onExit;

  const MoodEntryPage({
    super.key,
    required this.gender,
    required this.avatarImageData,
    this.personalColorProfile,
    this.skeletonProfile,
    this.onExit,
  });

  @override
  State<MoodEntryPage> createState() => _MoodEntryPageState();
}

class _MoodEntryPageState extends State<MoodEntryPage> {
  _MoodEntryStep _step = _MoodEntryStep.mood;
  String? _situation;
  String? _style;

  @override
  Widget build(BuildContext context) {
    switch (_step) {
      case _MoodEntryStep.mood:
        return MoodPage(
          gender: widget.gender,
          avatarImageData: widget.avatarImageData,
          personalColorProfile: widget.personalColorProfile,
          skeletonProfile: widget.skeletonProfile,
          embeddedInTab: true,
          onBackPressed: widget.onExit,
          onNext: (situation, style) => setState(() {
            _situation = situation;
            _style = style;
            _step = _MoodEntryStep.method;
          }),
        );
      case _MoodEntryStep.method:
        return _RecommendationMethodView(
          onBackPressed: () => setState(() => _step = _MoodEntryStep.mood),
          onClosetSelected: () => setState(() => _step = _MoodEntryStep.closet),
          onShoppingSelected: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => OutfitRecommendationPage(
                  gender: widget.gender,
                  avatarImageData: widget.avatarImageData,
                  situation: _situation ?? '데일리',
                  style: _style ?? '캐주얼',
                  personalColorProfile: widget.personalColorProfile,
                  skeletonProfile: widget.skeletonProfile,
                ),
              ),
            );
          },
        );
      case _MoodEntryStep.closet:
        return _ClosetRecommendationView(
          situation: _situation ?? '데일리',
          style: _style ?? '캐주얼',
          gender: widget.gender,
          personalColorProfile: widget.personalColorProfile,
          skeletonProfile: widget.skeletonProfile,
          onBackPressed: () => setState(() => _step = _MoodEntryStep.method),
        );
    }
  }
}

class _RecommendationMethodView extends StatelessWidget {
  final VoidCallback onBackPressed;
  final VoidCallback onClosetSelected;
  final VoidCallback onShoppingSelected;

  const _RecommendationMethodView({
    required this.onBackPressed,
    required this.onClosetSelected,
    required this.onShoppingSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 390),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 7, 18, 14),
            child: Column(
              children: [
                Row(children: [
                  _BackButton(onPressed: onBackPressed),
                  const Expanded(
                      child: Text('코디 추천',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.muted,
                              fontSize: 14,
                              fontWeight: FontWeight.w700))),
                  const SizedBox(width: 48),
                ]),
                const SizedBox(height: 25),
                const Text('어떤 아이템으로\n코디를 추천받을까요?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.ink,
                        fontSize: 23,
                        height: 1.23,
                        fontWeight: FontWeight.w900)),
                const SizedBox(height: 25),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(children: [
                      SizedBox(
                          height: 228,
                          child: _RecommendationTypeCard(
                            eyebrow: 'M Y   C L O S E T',
                            title: '내 옷으로\n추천받기',
                            imagePath:
                                'assets/illustrations/clothing_rail_final.png',
                            onTap: onClosetSelected,
                          )),
                      const SizedBox(height: 20),
                      SizedBox(
                          height: 228,
                          child: _RecommendationTypeCard(
                            eyebrow: 'S H O P P I N G',
                            title: '쇼핑 아이템으로\n추천받기',
                            imagePath:
                                'assets/illustrations/shopping_bag_final.png',
                            onTap: onShoppingSelected,
                          )),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RecommendationTypeCard extends StatelessWidget {
  final String eyebrow;
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  const _RecommendationTypeCard({
    required this.eyebrow,
    required this.title,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Ink(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xfff4f9ff), Color(0xffeaf3ff)]),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xffe6effc)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(children: [
              Positioned(
                  right: -28,
                  top: 17,
                  child: Container(
                      width: 180,
                      height: 180,
                      decoration: const BoxDecoration(
                          color: Color(0xffe1edfc), shape: BoxShape.circle))),
              Positioned(
                  right: -30,
                  top: 13,
                  bottom: 0,
                  width: 190,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(imagePath,
                          fit: BoxFit.cover, alignment: Alignment.center))),
              Positioned(
                  right: 11,
                  bottom: 14,
                  child: Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                          color: const Color(0xeef4f8ff),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.main.withValues(alpha: .12),
                                blurRadius: 12)
                          ]),
                      child: const Icon(Icons.chevron_right_rounded,
                          color: AppColors.main, size: 28))),
              Positioned.fill(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(19, 20, 104, 18),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(eyebrow,
                          style: const TextStyle(
                              color: AppColors.muted,
                              fontSize: 9,
                              letterSpacing: 1.1,
                              fontWeight: FontWeight.w900)),
                      const SizedBox(height: 8),
                      Text(title,
                          style: const TextStyle(
                              color: AppColors.ink,
                              fontSize: 21,
                              height: 1.28,
                              fontWeight: FontWeight.w900)),
                      const Spacer(),
                    ]),
              )),
            ]),
          ),
        ),
      ),
    );
  }
}

class _ClosetRecommendationView extends StatefulWidget {
  final String situation;
  final String style;
  final String gender;
  final PersonalColorProfile? personalColorProfile;
  final SkeletonProfile? skeletonProfile;
  final VoidCallback onBackPressed;

  const _ClosetRecommendationView({
    required this.situation,
    required this.style,
    required this.gender,
    required this.personalColorProfile,
    required this.skeletonProfile,
    required this.onBackPressed,
  });

  @override
  State<_ClosetRecommendationView> createState() =>
      _ClosetRecommendationViewState();
}

class _ClosetRecommendationViewState extends State<_ClosetRecommendationView> {
  static const _categories = ['아우터', '상의', '하의'];

  final ImagePicker _picker = ImagePicker();
  String _selectedCategory = '';
  String _uploadCategory = '상의';
  List<_ClosetLook> _looks = const [];
  bool _loadingLooks = true;
  String? _recommendationError;

  @override
  void initState() {
    super.initState();
    _loadLooks();
  }

  Future<void> _loadLooks() async {
    if (mounted) {
      setState(() {
        _loadingLooks = true;
        _recommendationError = null;
      });
    }
    final closet = StyleClosetStore.wardrobeItems
        .where((item) => _categories.contains(item.category))
        .toList();
    if (closet.isEmpty) {
      if (mounted) {
        setState(() {
          _looks = const [];
          _loadingLooks = false;
          _recommendationError = null;
        });
      }
      return;
    }
    try {
      final recommendations = await ClosetOutfitRecommendationService.recommend(
        situation: widget.situation,
        mood: widget.style,
        gender: widget.gender,
        personalColor: widget.personalColorProfile?.type ?? '',
        skeletonType: widget.skeletonProfile?.type ?? '',
        closet: closet,
      );
      final itemsById = {for (final item in closet) item.imageId: item};
      final looks = <_ClosetLook>[];
      for (final recommendation in recommendations) {
        final items = recommendation.itemIds
            .map((id) => itemsById[id])
            .whereType<OutfitItem>()
            .toList();
        if (items.isEmpty) continue;
        looks.add(_ClosetLook(
          id: recommendation.id,
          title: recommendation.title,
          situation: widget.situation,
          style: widget.style,
          items: items,
          index: looks.length,
          reason: recommendation.reason,
        ));
      }
      if (mounted) setState(() => _looks = looks);
    } catch (error) {
      if (mounted) {
        final message = error.toString().replaceFirst('Exception: ', '');
        setState(() => _recommendationError =
            message.isEmpty ? '추천을 불러오지 못했어요. 다시 시도해주세요.' : message);
      }
    } finally {
      if (mounted) setState(() => _loadingLooks = false);
    }
  }

  void _showNextOutfits() {
    if (_looks.length < 2) return;
    setState(() => _looks = [..._looks.skip(1), _looks.first]);
  }

  Future<void> _addClothes() async {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) => StatefulBuilder(
          builder: (sheetContext, setSheetState) => Padding(
                padding: const EdgeInsets.fromLTRB(22, 24, 22, 30),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const Text('내 옷장에 옷 추가',
                      style: TextStyle(
                          color: AppColors.ink,
                          fontSize: 19,
                          fontWeight: FontWeight.w900)),
                  const SizedBox(height: 10),
                  const Text('사진 한 장으로 코디에 활용할 옷을 등록해요.',
                      style: TextStyle(color: AppColors.muted, fontSize: 13)),
                  const SizedBox(height: 18),
                  SizedBox(
                      height: 40,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: _categories.length,
                          separatorBuilder: (_, __) => const SizedBox(width: 7),
                          itemBuilder: (_, index) {
                            final category = _categories[index];
                            return _ClosetCategoryChip(
                                label: category,
                                selected: _uploadCategory == category,
                                onTap: () => setSheetState(
                                    () => _uploadCategory = category));
                          })),
                  const SizedBox(height: 12),
                  ListTile(
                      leading: const Icon(Icons.photo_library_outlined,
                          color: AppColors.main),
                      title: const Text('사진 보관함에서 선택'),
                      onTap: () {
                        final category = _uploadCategory;
                        Navigator.pop(sheetContext);
                        _pickAndStore(ImageSource.gallery, category);
                      }),
                  ListTile(
                      leading: const Icon(Icons.camera_alt_outlined,
                          color: AppColors.main),
                      title: const Text('카메라로 촬영'),
                      onTap: () {
                        final category = _uploadCategory;
                        Navigator.pop(sheetContext);
                        _pickAndStore(ImageSource.camera, category);
                      }),
                ]),
              )),
    );
  }

  Future<void> _pickAndStore(ImageSource source, String category) async {
    try {
      final file = await _picker.pickImage(source: source, imageQuality: 88);
      if (file == null) return;
      final bytes = await file.readAsBytes();
      final mime = file.mimeType ?? 'image/jpeg';
      final originalData = 'data:$mime;base64,${base64Encode(bytes)}';
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('배경을 흰색으로 정리하고 옷을 분석하고 있어요.')),
      );
      final analysis = await ClosetItemAnalysisService.analyze(
        imageData: originalData,
        category: category,
      );
      final item = OutfitItem.localWardrobe(
        imagePath: analysis.processedImage ?? originalData,
        category: analysis.category,
        itemName: analysis.item,
        color: analysis.color,
        pattern: analysis.pattern,
        styleTags: analysis.styleTags,
      );
      await StyleClosetStore.addWardrobeItem(item);
      if (mounted) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(const SnackBar(content: Text('흰 배경 사진을 옷장에 저장했어요.')));
        await _loadLooks();
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
              const SnackBar(content: Text('옷을 등록하지 못했어요. 다시 시도해주세요.')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: StyleClosetStore.revision,
      builder: (context, _, __) {
        final allClothes = StyleClosetStore.wardrobeItems;
        return SafeArea(
            child: Align(
                alignment: Alignment.topCenter,
                child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 410),
                    child: Column(children: [
                      Padding(
                          padding: const EdgeInsets.fromLTRB(10, 2, 14, 6),
                          child: Row(children: [
                            IconButton(
                                onPressed: widget.onBackPressed,
                                icon: const Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    size: 19)),
                            const Expanded(
                                child: Text('내 옷으로 추천받기',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColors.ink,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800))),
                            const SizedBox(width: 48),
                          ])),
                      Expanded(
                          child: SingleChildScrollView(
                              padding: const EdgeInsets.fromLTRB(16, 4, 16, 18),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (allClothes.isEmpty)
                                      _ClosetEmptyPrompt(onAdd: _addClothes)
                                    else if (_loadingLooks)
                                      const Padding(
                                          padding: EdgeInsets.all(36),
                                          child: Center(
                                              child:
                                                  CircularProgressIndicator()))
                                    else if (_recommendationError != null)
                                      Center(
                                          child: Column(children: [
                                        Text(_recommendationError!,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                color: AppColors.muted)),
                                        TextButton(
                                            onPressed: _loadLooks,
                                            child: const Text('다시 시도'))
                                      ]))
                                    else ...[
                                      Builder(builder: (_) {
                                        final visibleLooks =
                                            _selectedCategory.isEmpty
                                                ? _looks
                                                : _looks
                                                    .where((look) => look.items
                                                        .any((item) =>
                                                            item.category ==
                                                            _selectedCategory))
                                                    .toList();
                                        if (visibleLooks.isEmpty)
                                          return _ClosetEmptyPrompt(
                                              onAdd: _addClothes,
                                              message: _selectedCategory.isEmpty
                                                  ? '아우터·상의·하의 옷을 등록하면 코디를 추천해드릴게요.'
                                                  : '선택한 종류가 포함된 코디가 아직 없어요.');
                                        return Column(children: [
                                          for (final look in visibleLooks)
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10),
                                              child: _ClosetLookCard(
                                                look: look,
                                                onTap: () => Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            _ClosetLookDetailPage(
                                                                look: look))),
                                              ),
                                            ),
                                        ]);
                                      }),
                                      if (_looks.length > 1) ...[
                                        const SizedBox(height: 12),
                                        SizedBox(
                                            width: double.infinity,
                                            child: TextButton.icon(
                                                onPressed: _showNextOutfits,
                                                icon: const Icon(
                                                    Icons.refresh_rounded,
                                                    size: 17),
                                                label: const Text('다른 코디 추천받기'),
                                                style: TextButton.styleFrom(
                                                    foregroundColor:
                                                        AppColors.ink,
                                                    backgroundColor:
                                                        const Color(0xffedf4ff),
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 26,
                                                        vertical: 12)))),
                                      ],
                                    ],
                                  ]))),
                    ]))));
      },
    );
  }
}

class _ClosetLook extends SavedClosetLook {
  final int index;
  final String reason;

  _ClosetLook({
    required super.id,
    required super.title,
    required super.situation,
    required super.style,
    required super.items,
    required this.index,
    this.reason = '',
  });
}

class _ClosetEmptyPrompt extends StatelessWidget {
  final VoidCallback onAdd;
  final String message;
  const _ClosetEmptyPrompt(
      {required this.onAdd,
      this.message = '아직 등록한 옷이 없어요. 옷을 추가하면 코디를 만들어드릴게요.'});
  @override
  Widget build(BuildContext context) => Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      decoration: BoxDecoration(
          color: const Color(0xfff2f7ff),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xffe5eefb))),
      child: Column(children: [
        const Icon(Icons.checkroom_outlined, color: AppColors.main, size: 42),
        const SizedBox(height: 14),
        Text(message,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: AppColors.muted,
                fontSize: 13,
                height: 1.5,
                fontWeight: FontWeight.w600)),
        const SizedBox(height: 18),
        FilledButton.icon(
            onPressed: onAdd,
            icon: const Icon(Icons.add),
            label: const Text('내 옷 추가하기'))
      ]));
}

class _ClosetLookCard extends StatelessWidget {
  final _ClosetLook look;
  final VoidCallback onTap;
  const _ClosetLookCard({required this.look, required this.onTap});
  @override
  Widget build(BuildContext context) => ValueListenableBuilder<int>(
      valueListenable: StyleClosetStore.revision,
      builder: (context, _, __) {
        final saved = StyleClosetStore.isClosetLookSaved(look.id);
        return Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 7, 10, 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xffedf1f7))),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                    color: const Color(0xffe8f0ff),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                    '${(look.index + 1).toString().padLeft(2, '0')}',
                                    style: const TextStyle(
                                        color: AppColors.main,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w900))),
                            const SizedBox(width: 8),
                            Expanded(
                                child: Wrap(
                                    spacing: 7,
                                    runSpacing: 5,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    children: [
                                  Text(look.title,
                                      style: const TextStyle(
                                          color: AppColors.ink,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w900)),
                                  for (final tag in [
                                    look.situation,
                                    look.style
                                  ])
                                    Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 7, vertical: 3),
                                        decoration: BoxDecoration(
                                            color: AppColors.selectedBackground,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Text('#$tag',
                                            style: const TextStyle(
                                                color: Color(0xff3159af),
                                                fontSize: 10,
                                                fontWeight: FontWeight.w700))),
                                ])),
                            IconButton(
                                onPressed: () =>
                                    StyleClosetStore.toggleClosetLook(look),
                                icon: Icon(
                                    saved
                                        ? Icons.favorite_rounded
                                        : Icons.favorite_border_rounded,
                                    color: saved
                                        ? const Color(0xffe887a1)
                                        : AppColors.muted,
                                    size: 19),
                                visualDensity: VisualDensity.compact,
                                constraints: const BoxConstraints(
                                    minWidth: 34, minHeight: 34))
                          ]),
                          const SizedBox(height: 6),
                          Row(
                              children: look.items
                                  .map((item) => Expanded(
                                      child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 3),
                                          child: Container(
                                              height: 142,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xffedf1f7))),
                                              child: Column(children: [
                                                Expanded(
                                                    child: SizedBox.expand(
                                                        child: _WardrobeImage(
                                                            value:
                                                                item.imageUrl,
                                                            fit: BoxFit
                                                                .contain))),
                                                Container(
                                                    width: double.infinity,
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 4,
                                                        vertical: 5),
                                                    color:
                                                        const Color(0xfff5f8fd),
                                                    child: Column(children: [
                                                      Text(item.category,
                                                          style: const TextStyle(
                                                              color: AppColors
                                                                  .main,
                                                              fontSize: 9,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800)),
                                                      Text(item.title,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: const TextStyle(
                                                              color:
                                                                  AppColors.ink,
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700))
                                                    ]))
                                              ])))))
                                  .toList()),
                        ]))));
      });
}

class _ClosetLookDetailPage extends StatelessWidget {
  final _ClosetLook look;
  const _ClosetLookDetailPage({required this.look});
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: ValueListenableBuilder<int>(
              valueListenable: StyleClosetStore.revision,
              builder: (context, _, __) {
                final saved = StyleClosetStore.isClosetLookSaved(look.id);
                return Column(children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(children: [
                        IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.arrow_back_ios_new_rounded,
                                size: 19)),
                        const Expanded(
                            child: Text('코디 상세보기',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColors.muted,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w800))),
                        IconButton(
                            onPressed: () =>
                                StyleClosetStore.toggleClosetLook(look),
                            icon: Icon(
                                saved
                                    ? Icons.favorite_rounded
                                    : Icons.favorite_border_rounded,
                                color: saved
                                    ? const Color(0xffe887a1)
                                    : AppColors.ink))
                      ])),
                  Expanded(
                      child: SingleChildScrollView(
                          padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: look.items.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 10,
                                            mainAxisSpacing: 10,
                                            childAspectRatio: .82),
                                    itemBuilder: (context, index) {
                                      final item = look.items[index];
                                      return Container(
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              border: Border.all(
                                                  color:
                                                      const Color(0xffedf1f7))),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                    child: SizedBox.expand(
                                                        child: _WardrobeImage(
                                                            value:
                                                                item.imageUrl,
                                                            fit: BoxFit
                                                                .contain))),
                                                Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(
                                                        10, 0, 10, 10),
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          7,
                                                                      vertical:
                                                                          3),
                                                              decoration: BoxDecoration(
                                                                  color: const Color(
                                                                      0xffeef4ff),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8)),
                                                              child: Text(
                                                                  item.category,
                                                                  style: const TextStyle(
                                                                      color: AppColors
                                                                          .main,
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w800))),
                                                          const SizedBox(
                                                              height: 4),
                                                          Text(item.title,
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: const TextStyle(
                                                                  color:
                                                                      AppColors
                                                                          .ink,
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800))
                                                        ]))
                                              ]));
                                    }),
                                const SizedBox(height: 18),
                                Text(look.title,
                                    style: const TextStyle(
                                        color: AppColors.ink,
                                        fontSize: 21,
                                        fontWeight: FontWeight.w900)),
                                const SizedBox(height: 7),
                                Text(
                                    '#${look.style}   #${look.situation}   #내옷장',
                                    style: const TextStyle(
                                        color: AppColors.muted,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600)),
                                const SizedBox(height: 13),
                                Text(
                                    look.reason.isEmpty
                                        ? '${look.style} 무드에 맞춰 내가 등록한 옷을 함께 매치했어요.'
                                        : look.reason,
                                    style: const TextStyle(
                                        color: AppColors.muted,
                                        fontSize: 13,
                                        height: 1.55)),
                                const SizedBox(height: 20),
                                const Text('코디에 사용된 아이템',
                                    style: TextStyle(
                                        color: AppColors.ink,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w900)),
                                const SizedBox(height: 10),
                                SizedBox(
                                    height: 104,
                                    child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: look.items.length,
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(width: 8),
                                        itemBuilder: (_, index) => SizedBox(
                                            width: 78,
                                            child: Column(children: [
                                              Expanded(
                                                  child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              11),
                                                      child: _WardrobeImage(
                                                          value: look
                                                              .items[index]
                                                              .imageUrl,
                                                          fit:
                                                              BoxFit.contain))),
                                              const SizedBox(height: 5),
                                              Text(look.items[index].category,
                                                  style: const TextStyle(
                                                      color: AppColors.muted,
                                                      fontSize: 10))
                                            ])))),
                              ]))),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 14),
                      child: SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: FilledButton(
                              onPressed: () =>
                                  StyleClosetStore.toggleClosetLook(look),
                              child: Text(saved ? '저장된 코디' : '이 코디 저장하기')))),
                ]);
              })));
}

class _WardrobeImage extends StatelessWidget {
  final String value;
  final BoxFit fit;
  const _WardrobeImage({required this.value, this.fit = BoxFit.contain});
  @override
  Widget build(BuildContext context) {
    if (value.startsWith('data:'))
      return Image.memory(base64Decode(value.split(',').last),
          fit: fit,
          errorBuilder: (_, __, ___) => const _WardrobeImagePlaceholder());
    if (value.startsWith('http://') || value.startsWith('https://'))
      return Image.network(value,
          fit: fit,
          errorBuilder: (_, __, ___) => const _WardrobeImagePlaceholder());
    if (kIsWeb) return const _WardrobeImagePlaceholder();
    return Image.file(File(value),
        fit: fit,
        errorBuilder: (_, __, ___) => const _WardrobeImagePlaceholder());
  }
}

class _WardrobeImagePlaceholder extends StatelessWidget {
  const _WardrobeImagePlaceholder();
  @override
  Widget build(BuildContext context) => const ColoredBox(
      color: Color(0xfff5f8fd),
      child:
          Center(child: Icon(Icons.checkroom_outlined, color: AppColors.main)));
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
          _WardrobeImage(
            value: item.imageUrl,
            fit: BoxFit.cover,
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
