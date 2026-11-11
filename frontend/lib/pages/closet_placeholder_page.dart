import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../services/closet_item_analysis_service.dart';
import '../services/outfit_recommendation_service.dart';
import '../services/style_closet_store.dart';
import '../theme/app_colors.dart';

const _closetCategories = ['아우터', '상의', '하의'];

class ClosetPlaceholderPage extends StatefulWidget {
  const ClosetPlaceholderPage({super.key});

  @override
  State<ClosetPlaceholderPage> createState() => _ClosetPlaceholderPageState();
}

class _ClosetPlaceholderPageState extends State<ClosetPlaceholderPage> {
  // Show the full closet at first without adding an "전체" category tab.
  String _selectedCategory = '';

  Future<void> _openRegister() async {
    final saved = await Navigator.push<bool>(
      context,
      MaterialPageRoute(builder: (_) => const ClosetItemRegisterPage()),
    );
    if (saved == true && StyleClosetStore.wardrobeItems.isNotEmpty && mounted) {
      setState(() {
        _selectedCategory = StyleClosetStore.wardrobeItems.first.category;
      });
    }
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<int>(
        valueListenable: StyleClosetStore.revision,
        builder: (context, _, __) {
          final allItems = StyleClosetStore.wardrobeItems;
          final items = _selectedCategory.isEmpty
              ? allItems
              : allItems
                  .where((item) => item.category == _selectedCategory)
                  .toList();
          return SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) => Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 460,
                    maxHeight: constraints.maxHeight,
                  ),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14, 4, 14, 12),
                      child: Row(children: [
                        const SizedBox(width: 34),
                        const Expanded(
                            child: Text('마이클로젯',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColors.ink,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900))),
                        const SizedBox(width: 34),
                      ]),
                    ),
                    Expanded(
                      child: CustomScrollView(slivers: [
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
                            child: _AddClothesBanner(onTap: _openRegister),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
                            child: Row(
                                children: _closetCategories.map((category) {
                              final count = allItems
                                  .where((item) => item.category == category)
                                  .length;
                              final selected = category == _selectedCategory;
                              return Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 7),
                                  child: InkWell(
                                    onTap: () => setState(
                                        () => _selectedCategory = category),
                                    borderRadius: BorderRadius.circular(13),
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 160),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 11),
                                      decoration: BoxDecoration(
                                        color: selected
                                            ? const Color(0xffdce9ff)
                                            : const Color(0xfff7f9fc),
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                      child: Column(children: [
                                        Text(category,
                                            style: TextStyle(
                                                color: selected
                                                    ? const Color(0xff315a9e)
                                                    : AppColors.ink,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w900)),
                                        const SizedBox(height: 3),
                                        Text('$count',
                                            style: TextStyle(
                                                color: selected
                                                    ? const Color(0xff315a9e)
                                                    : AppColors.muted,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w700)),
                                      ]),
                                    ),
                                  ),
                                ),
                              );
                            }).toList()),
                          ),
                        ),
                        if (items.isEmpty)
                          SliverFillRemaining(
                              hasScrollBody: false,
                              child: _ClosetEmptyState(
                                  category: _selectedCategory,
                                  onTap: _openRegister))
                        else
                          SliverPadding(
                            padding: const EdgeInsets.fromLTRB(14, 0, 14, 18),
                            sliver: SliverGrid.builder(
                              itemCount: items.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                      childAspectRatio: .79),
                              itemBuilder: (context, index) =>
                                  _ClosetItemTile(item: items[index]),
                            ),
                          ),
                      ]),
                    ),
                  ]),
                ),
              ),
            ),
          );
        },
      );
}

class _AddClothesBanner extends StatelessWidget {
  final VoidCallback onTap;
  const _AddClothesBanner({required this.onTap});

  @override
  Widget build(BuildContext context) => Material(
        color: const Color(0xfff0f6ff),
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: 126,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xffe7effc))),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Icon(Icons.add_a_photo_outlined,
                  color: AppColors.main, size: 31),
              const SizedBox(height: 8),
              const Text('옷 등록하러 가기  ›',
                  style: TextStyle(
                      color: AppColors.ink,
                      fontSize: 15,
                      fontWeight: FontWeight.w900)),
              const SizedBox(height: 4),
              Text('내 옷 사진을 등록하면 AI가 자동으로 분석해요.',
                  style: TextStyle(
                      color: AppColors.muted,
                      fontSize: 10,
                      fontWeight: FontWeight.w600)),
            ]),
          ),
        ),
      );
}

class _ClosetEmptyState extends StatelessWidget {
  final String category;
  final VoidCallback onTap;
  const _ClosetEmptyState({required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) => Center(
      child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const Icon(Icons.checkroom_outlined,
                color: Color(0xffb7d1f8), size: 40),
            const SizedBox(height: 12),
            Text(category.isEmpty ? '아직 등록한 옷이 없어요.' : '$category 옷이 아직 없어요.',
                style: const TextStyle(
                    color: AppColors.ink,
                    fontSize: 14,
                    fontWeight: FontWeight.w800)),
            const SizedBox(height: 5),
            const Text('사진을 등록하고 나만의 옷장을 채워보세요.',
                style: TextStyle(color: AppColors.muted, fontSize: 12)),
            const SizedBox(height: 14),
            TextButton(onPressed: onTap, child: const Text('옷 등록하기'))
          ])));
}

class _ClosetItemTile extends StatelessWidget {
  final OutfitItem item;
  const _ClosetItemTile({required this.item});

  @override
  Widget build(BuildContext context) => Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: const Color(0xfff6f7f9),
            borderRadius: BorderRadius.circular(12)),
        child: Stack(fit: StackFit.expand, children: [
          _ClosetImage(value: item.imageUrl, fit: BoxFit.contain),
          Positioned(
              left: 7,
              right: 28,
              bottom: 7,
              child: Text(item.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: AppColors.ink,
                      fontSize: 10,
                      fontWeight: FontWeight.w800))),
          Positioned(
              right: 0,
              top: 0,
              child: PopupMenuButton<String>(
                  padding: EdgeInsets.zero,
                  iconSize: 17,
                  onSelected: (value) async {
                    if (value == 'delete')
                      await StyleClosetStore.removeWardrobeItem(item.imageId);
                  },
                  itemBuilder: (_) => const [
                        PopupMenuItem(value: 'delete', child: Text('삭제'))
                      ])),
        ]),
      );
}

enum _RegisterStep { choose, preview, loading, result }

class ClosetItemRegisterPage extends StatefulWidget {
  const ClosetItemRegisterPage({super.key});

  @override
  State<ClosetItemRegisterPage> createState() => _ClosetItemRegisterPageState();
}

class _ClosetItemRegisterPageState extends State<ClosetItemRegisterPage> {
  final ImagePicker _picker = ImagePicker();
  _RegisterStep _step = _RegisterStep.choose;
  XFile? _photo;
  Uint8List? _photoBytes;
  Uint8List? _processedPhotoBytes;
  ClosetItemAnalysis? _analysis;
  OutfitItem? _savedItem;
  String? _error;

  Future<void> _selectPhoto(ImageSource source) async {
    try {
      final photo = await _picker.pickImage(
        source: source,
        maxWidth: 1600,
        maxHeight: 2000,
        imageQuality: 85,
      );
      if (photo == null) return;
      final bytes = await photo.readAsBytes();
      if (!mounted) return;
      setState(() {
        _photo = photo;
        _photoBytes = bytes;
        _processedPhotoBytes = null;
        _step = _RegisterStep.preview;
        _error = null;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() => _error = '사진을 불러오지 못했어요. 다시 시도해주세요.');
    }
  }

  Future<void> _analyze() async {
    final photo = _photo;
    final bytes = _photoBytes;
    if (photo == null || bytes == null) return;
    setState(() {
      _step = _RegisterStep.loading;
      _error = null;
    });
    try {
      final mime = photo.mimeType ?? 'image/jpeg';
      final dataUri = 'data:$mime;base64,${base64Encode(bytes)}';
      final result = await ClosetItemAnalysisService.analyze(
          imageData: dataUri, category: '');
      final processedDataUri = result.processedImage ?? dataUri;
      final processedBytes = result.processedImage == null
          ? bytes
          : base64Decode(result.processedImage!.split(',').last);
      final item = OutfitItem.localWardrobe(
          imagePath: processedDataUri,
          category: result.category,
          itemName: result.item,
          color: result.color,
          pattern: result.pattern,
          styleTags: result.styleTags);
      await StyleClosetStore.addWardrobeItem(item);
      if (!mounted) return;
      setState(() {
        _analysis = result;
        _savedItem = item;
        _processedPhotoBytes = processedBytes;
        _step = _RegisterStep.result;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _step = _RegisterStep.preview;
        _error = error.toString();
      });
    }
  }

  Future<void> _editResult() async {
    final current = _analysis;
    final item = _savedItem;
    if (current == null || item == null) return;
    var category = current.category;
    final itemController = TextEditingController(text: current.item);
    final updated = await showDialog<ClosetItemAnalysis>(
        context: context,
        builder: (context) => StatefulBuilder(
            builder: (context, setDialogState) => AlertDialog(
                    title: const Text('분석 결과 수정'),
                    content: Column(mainAxisSize: MainAxisSize.min, children: [
                      DropdownButtonFormField<String>(
                          value: category,
                          items: _closetCategories
                              .map((value) => DropdownMenuItem(
                                  value: value, child: Text(value)))
                              .toList(),
                          onChanged: (value) {
                            if (value != null)
                              setDialogState(() => category = value);
                          },
                          decoration: const InputDecoration(labelText: '카테고리')),
                      TextField(
                          controller: itemController,
                          decoration: const InputDecoration(labelText: '아이템')),
                    ]),
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('취소')),
                      TextButton(
                          onPressed: () => Navigator.pop(
                              context,
                              ClosetItemAnalysis(
                                  category: category,
                                  item: itemController.text.trim(),
                                  color: current.color,
                                  pattern: current.pattern,
                                  styleTags: current.styleTags)),
                          child: const Text('저장'))
                    ])));
    itemController.dispose();
    if (updated == null || !mounted) return;
    final revisedItem = OutfitItem.localWardrobe(
        imagePath: item.imageUrl,
        category: updated.category,
        itemName: updated.item,
        color: updated.color,
        pattern: updated.pattern,
        styleTags: updated.styleTags);
    await StyleClosetStore.replaceWardrobeItem(item.imageId, revisedItem);
    setState(() {
      _analysis = updated;
      _savedItem = revisedItem;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Row(children: [
                IconButton(
                    onPressed: () {
                      if (_step == _RegisterStep.choose) {
                        Navigator.pop(context);
                      } else if (_step == _RegisterStep.preview) {
                        setState(() => _step = _RegisterStep.choose);
                      } else if (_step == _RegisterStep.result) {
                        setState(() => _step = _RegisterStep.preview);
                      }
                    },
                    icon:
                        const Icon(Icons.arrow_back_ios_new_rounded, size: 19)),
                Expanded(
                    child: Text(
                        _step == _RegisterStep.result ? '옷 분석 결과' : '옷 등록하기',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: AppColors.ink,
                            fontSize: 15,
                            fontWeight: FontWeight.w900))),
                const SizedBox(width: 48)
              ])),
          Expanded(
              child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: switch (_step) {
                    _RegisterStep.choose => _ChoosePhotoView(
                        key: const ValueKey('choose'),
                        error: _error,
                        onGallery: () => _selectPhoto(ImageSource.gallery),
                        onCamera: () => _selectPhoto(ImageSource.camera)),
                    _RegisterStep.preview => _PhotoPreviewView(
                        key: const ValueKey('preview'),
                        bytes: _photoBytes!,
                        onChange: () =>
                            setState(() => _step = _RegisterStep.choose),
                        onAnalyze: _analyze,
                        error: _error),
                    _RegisterStep.loading =>
                      const _AnalysisLoadingView(key: ValueKey('loading')),
                    _RegisterStep.result => _AnalysisResultView(
                        key: const ValueKey('result'),
                        bytes: _processedPhotoBytes ?? _photoBytes!,
                        result: _analysis!,
                        onEdit: _editResult,
                        onConfirm: () => Navigator.pop(context, true)),
                  })),
        ])),
      );
}

class _ChoosePhotoView extends StatelessWidget {
  final String? error;
  final VoidCallback onCamera;
  final VoidCallback onGallery;
  const _ChoosePhotoView(
      {super.key,
      required this.error,
      required this.onCamera,
      required this.onGallery});
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 26, 24, 24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text.rich(
            TextSpan(text: '옷 사진을\n', children: [
              TextSpan(text: '등록해주세요.', style: TextStyle(color: AppColors.main))
            ]),
            style: TextStyle(
                color: AppColors.ink,
                fontSize: 28,
                height: 1.3,
                fontWeight: FontWeight.w900)),
        const SizedBox(height: 6),
        const Text('대충 찍어도 괜찮아요!',
            style: TextStyle(color: AppColors.muted, fontSize: 14)),
        const SizedBox(height: 34),
        const Row(children: [
          Text('촬영 팁',
              style: TextStyle(
                  color: AppColors.ink,
                  fontSize: 14,
                  fontWeight: FontWeight.w900)),
          Spacer(),
          Text('1 / 3', style: TextStyle(color: AppColors.muted, fontSize: 11))
        ]),
        const SizedBox(height: 14),
        const Row(children: [
          Expanded(
              child: _PhotoTip(
                  icon: Icons.wb_sunny_outlined, text: '밝은 곳에서\n촬영해주세요.')),
          Expanded(
              child: _PhotoTip(
                  icon: Icons.checkroom_outlined, text: '옷 전체가 잘 보이게\n찍어주세요.')),
          Expanded(
              child: _PhotoTip(
                  icon: Icons.block_rounded, text: '배경은 단순하게\n촬영해주세요.'))
        ]),
        if (error != null)
          Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(error!,
                  style: const TextStyle(color: Colors.red, fontSize: 12))),
        const SizedBox(height: 36),
        _PhotoSourceButton(
            icon: Icons.camera_alt_outlined, label: '사진 촬영하기', onTap: onCamera),
        const SizedBox(height: 10),
        _PhotoSourceButton(
            icon: Icons.photo_library_outlined,
            label: '앨범에서 선택하기',
            onTap: onGallery),
      ]));
}

class _PhotoPreviewView extends StatelessWidget {
  final Uint8List bytes;
  final VoidCallback onChange;
  final VoidCallback onAnalyze;
  final String? error;
  const _PhotoPreviewView(
      {super.key,
      required this.bytes,
      required this.onChange,
      required this.onAnalyze,
      required this.error});
  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('사진이 등록되었어요.',
            style: TextStyle(
                color: AppColors.ink,
                fontSize: 24,
                fontWeight: FontWeight.w900)),
        const SizedBox(height: 7),
        const Text('옷이 잘 보이는지 확인해주세요.',
            style: TextStyle(color: AppColors.muted, fontSize: 14)),
        const SizedBox(height: 24),
        Expanded(
            child: Center(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.memory(bytes, fit: BoxFit.contain)))),
        if (error != null)
          Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(error!,
                  style: const TextStyle(color: Colors.red, fontSize: 12))),
        const SizedBox(height: 14),
        _PhotoSourceButton(
            icon: Icons.refresh_rounded, label: '다른 사진으로 바꾸기', onTap: onChange),
        const SizedBox(height: 12),
        _PrimaryClosetButton(label: '분석하기', onTap: onAnalyze),
      ]));
}

class _AnalysisLoadingView extends StatelessWidget {
  const _AnalysisLoadingView({super.key});
  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.fromLTRB(24, 44, 24, 34),
      child: Column(children: [
        const SizedBox(height: 12),
        const Text('AI가 옷을 분석하고 있어요.',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.ink,
                fontSize: 22,
                fontWeight: FontWeight.w900)),
        const SizedBox(height: 8),
        const Text('사진 속 아이템을 확인하고 있어요.',
            style: TextStyle(color: AppColors.muted, fontSize: 14)),
        const Spacer(),
        SizedBox(
            width: 190,
            height: 190,
            child: Stack(alignment: Alignment.center, children: [
              SizedBox.expand(
                  child: CircularProgressIndicator(
                      strokeWidth: 7,
                      backgroundColor: const Color(0xffeff4fc),
                      color: AppColors.main)),
              Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                      color: Color(0xfff4f8ff), shape: BoxShape.circle),
                  child: const Icon(Icons.checkroom_outlined,
                      color: AppColors.main, size: 42))
            ])),
        const Spacer(),
        const _ProgressStep(label: '사진 업로드 완료', state: 0),
        const _ProgressStep(label: '옷을 인식하고 분석하는 중이에요.', state: 1),
        const _ProgressStep(label: '분석 결과를 준비하고 있어요.', state: 2),
        const Spacer(),
        const SizedBox(height: 52),
      ]));
}

class _AnalysisResultView extends StatelessWidget {
  final Uint8List bytes;
  final ClosetItemAnalysis result;
  final VoidCallback onEdit;
  final VoidCallback onConfirm;
  const _AnalysisResultView(
      {super.key,
      required this.bytes,
      required this.result,
      required this.onEdit,
      required this.onConfirm});
  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.fromLTRB(18, 10, 18, 18),
      child: Column(children: [
        const SizedBox(height: 10),
        const Icon(Icons.check_circle_rounded, color: AppColors.main, size: 32),
        const SizedBox(height: 9),
        const Text('옷 분석이 완료되었어요!',
            style: TextStyle(
                color: AppColors.ink,
                fontSize: 21,
                fontWeight: FontWeight.w900)),
        const SizedBox(height: 5),
        const Text('AI가 옷의 정보를 분석했어요.',
            style: TextStyle(color: AppColors.muted, fontSize: 13)),
        Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
                onPressed: onEdit,
                icon: const Icon(Icons.edit_outlined, size: 16),
                label: const Text('수정하기'))),
        Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffe8edf5)),
                borderRadius: BorderRadius.circular(16)),
            child: Row(children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                      width: 116,
                      height: 152,
                      color: Colors.white,
                      child: Image.memory(bytes, fit: BoxFit.contain))),
              const SizedBox(width: 14),
              Expanded(
                  child: Column(children: [
                _ResultRow(label: '카테고리', value: result.category),
                _ResultRow(label: '아이템', value: result.item, last: true)
              ]))
            ])),
        const Spacer(),
        Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
                color: const Color(0xfff1f6ff),
                borderRadius: BorderRadius.circular(14)),
            child: const Row(children: [
              Icon(Icons.checkroom_outlined, color: AppColors.main),
              SizedBox(width: 12),
              Expanded(
                  child: Text('분석된 옷이 내 옷장에 자동으로 저장되었어요.',
                      style: TextStyle(
                          color: AppColors.ink,
                          fontSize: 12,
                          fontWeight: FontWeight.w800)))
            ])),
        const SizedBox(height: 22),
        _PrimaryClosetButton(label: '확인', onTap: onConfirm),
      ]));
}

class _ResultRow extends StatelessWidget {
  final String label;
  final String value;
  final bool last;
  const _ResultRow(
      {required this.label, required this.value, this.last = false});
  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
          border: last
              ? null
              : const Border(bottom: BorderSide(color: Color(0xffedf1f7)))),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
            width: 66,
            child: Text(label,
                style: const TextStyle(color: AppColors.muted, fontSize: 12))),
        Expanded(
            child: Text(value,
                style: const TextStyle(
                    color: AppColors.ink,
                    fontSize: 13,
                    fontWeight: FontWeight.w900)))
      ]));
}

class _PhotoTip extends StatelessWidget {
  final IconData icon;
  final String text;
  const _PhotoTip({required this.icon, required this.text});
  @override
  Widget build(BuildContext context) => Column(children: [
        CircleAvatar(
            radius: 22,
            backgroundColor: const Color(0xfff3f7fd),
            child: Icon(icon, color: AppColors.main, size: 20)),
        const SizedBox(height: 8),
        Text(text,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: AppColors.muted, fontSize: 10, height: 1.4))
      ]);
}

class _PhotoSourceButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _PhotoSourceButton(
      {required this.icon, required this.label, required this.onTap});
  @override
  Widget build(BuildContext context) => Material(
      color: const Color(0xfff2f6fd),
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: SizedBox(
              height: 58,
              child: Row(children: [
                const SizedBox(width: 18),
                CircleAvatar(
                    radius: 19,
                    backgroundColor: Colors.white,
                    child: Icon(icon, color: AppColors.main, size: 20)),
                const SizedBox(width: 14),
                Expanded(
                    child: Text(label,
                        style: const TextStyle(
                            color: AppColors.ink,
                            fontSize: 14,
                            fontWeight: FontWeight.w800))),
                const Icon(Icons.chevron_right_rounded, color: AppColors.ink),
                const SizedBox(width: 14)
              ]))));
}

class _PrimaryClosetButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _PrimaryClosetButton({required this.label, required this.onTap});
  @override
  Widget build(BuildContext context) => SizedBox(
      width: double.infinity,
      height: 48,
      child: FilledButton(
          onPressed: onTap,
          style: FilledButton.styleFrom(
              backgroundColor: const Color(0xffb7d1f8),
              foregroundColor: Colors.white,
              shape: const StadiumBorder()),
          child: Text(label,
              style: const TextStyle(fontWeight: FontWeight.w900))));
}

class _ProgressStep extends StatelessWidget {
  final String label;
  final int state;
  const _ProgressStep({required this.label, required this.state});
  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Row(children: [
        Icon(
            state == 0
                ? Icons.check_circle
                : state == 1
                    ? Icons.radio_button_checked
                    : Icons.circle_outlined,
            color: state < 2 ? AppColors.main : const Color(0xffdce4f0),
            size: 22),
        const SizedBox(width: 12),
        Text(label,
            style: TextStyle(
                color: state == 1 ? AppColors.ink : AppColors.muted,
                fontSize: 12,
                fontWeight: FontWeight.w600))
      ]));
}

class _ClosetImage extends StatelessWidget {
  final String value;
  final BoxFit fit;
  const _ClosetImage({required this.value, required this.fit});
  @override
  Widget build(BuildContext context) {
    if (value.startsWith('data:'))
      return Image.memory(base64Decode(value.split(',').last),
          fit: fit, errorBuilder: (_, __, ___) => const _ImageFallback());
    if (value.startsWith('http://') || value.startsWith('https://'))
      return Image.network(value,
          fit: fit, errorBuilder: (_, __, ___) => const _ImageFallback());
    if (kIsWeb) return const _ImageFallback();
    return Image.file(File(value),
        fit: fit, errorBuilder: (_, __, ___) => const _ImageFallback());
  }
}

class _ImageFallback extends StatelessWidget {
  const _ImageFallback();
  @override
  Widget build(BuildContext context) => const ColoredBox(
      color: Color(0xfff4f7fc),
      child:
          Center(child: Icon(Icons.checkroom_outlined, color: AppColors.main)));
}
