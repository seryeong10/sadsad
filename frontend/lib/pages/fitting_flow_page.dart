import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../services/outfit_recommendation_service.dart';
import '../services/style_closet_store.dart';
import '../services/virtual_try_on_service.dart';
import '../theme/app_colors.dart';
import '../widgets/avatar_memory_image.dart';

class FittingRoomPage extends StatefulWidget {
  final String avatarImageData;

  const FittingRoomPage({
    super.key,
    required this.avatarImageData,
  });

  @override
  State<FittingRoomPage> createState() => _FittingRoomPageState();
}

class _FittingRoomPageState extends State<FittingRoomPage> {
  final List<OutfitItem> _selectedItems = [];
  _FittingSource _source = _FittingSource.liked;

  List<OutfitItem> get _items => _source == _FittingSource.liked
      ? StyleClosetStore.likedItems
      : StyleClosetStore.wardrobeItems;

  bool get _canFit => _selectedItems.isNotEmpty && _selectedItems.length <= 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('피팅룸'),
        centerTitle: true,
      ),
      body: ValueListenableBuilder<int>(
        valueListenable: StyleClosetStore.revision,
        builder: (context, _, __) {
          return Column(
            children: [
              _AvatarPreview(avatarImageData: widget.avatarImageData),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 14, 18, 12),
                child: _SourceTabs(
                  source: _source,
                  onChanged: (source) {
                    setState(() {
                      _source = source;
                      _selectedItems.clear();
                    });
                  },
                ),
              ),
              Expanded(
                child: _items.isEmpty
                    ? _EmptyState(
                        text: _source == _FittingSource.liked
                            ? '찜목록에 저장한 상품이 아직 없어요.'
                            : '내옷장은 옷 촬영 기능과 함께 연결될 예정이에요.',
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.fromLTRB(18, 0, 18, 120),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.72,
                        ),
                        itemCount: _items.length,
                        itemBuilder: (context, index) {
                          final item = _items[index];
                          return _SelectableItemCard(
                            item: item,
                            selected: _selectedItems.any(
                              (selected) => selected.imageId == item.imageId,
                            ),
                            onTap: () => _toggleItem(item),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: _FittingSelectionBar(
        selectedItems: _selectedItems,
        enabled: _canFit,
        onFit: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => FittingImageReviewPage(
                avatarImageData: widget.avatarImageData,
                items: _orderedFittingItems,
                stepIndex: 0,
              ),
            ),
          );
        },
      ),
    );
  }

  void _toggleItem(OutfitItem item) {
    setState(() {
      final existingIndex = _selectedItems.indexWhere(
        (selected) => selected.imageId == item.imageId,
      );
      if (existingIndex >= 0) {
        _selectedItems.removeAt(existingIndex);
        return;
      }
      final itemSlot = _fittingSlot(item);
      if (_selectedItems
          .any((selected) => _fittingSlot(selected) == itemSlot)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$itemSlot 아이템은 하나만 선택할 수 있어요.')),
        );
        return;
      }
      if (_selectedItems.length >= 3) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('피팅 아이템은 최대 3개까지 선택할 수 있어요.')),
        );
        return;
      }
      _selectedItems.add(item);
    });
  }

  List<OutfitItem> get _orderedFittingItems {
    final ordered = List<OutfitItem>.from(_selectedItems);
    ordered.sort(
        (a, b) => _fittingOrderForItem(a).compareTo(_fittingOrderForItem(b)));
    return List.unmodifiable(ordered);
  }
}

class FittingImageReviewPage extends StatefulWidget {
  final String avatarImageData;
  final List<OutfitItem> items;
  final int stepIndex;

  const FittingImageReviewPage({
    super.key,
    required this.avatarImageData,
    required this.items,
    required this.stepIndex,
  });

  @override
  State<FittingImageReviewPage> createState() => _FittingImageReviewPageState();
}

class _FittingImageReviewPageState extends State<FittingImageReviewPage> {
  GarmentImageInput? _imageInput;
  String? _errorMessage;
  Rect? _cropRect;
  Size _imageBoxSize = Size.zero;
  Rect _displayedImageRect = Rect.zero;

  @override
  void initState() {
    super.initState();
    _loadImageForReview();
  }

  Future<void> _loadImageForReview() async {
    try {
      final input = await VirtualTryOnService.garmentImageInput(_currentItem);
      if (!mounted) return;
      final shouldReview = VirtualTryOnService.shouldReviewGarmentImage(
        item: _currentItem,
        input: input,
      );
      if (!shouldReview) {
        _goToFitting(input.dataUri);
        return;
      }
      setState(() => _imageInput = input);
    } catch (error) {
      if (!mounted) return;
      setState(() => _errorMessage = error.toString());
    }
  }

  Future<void> _fitWithCrop() async {
    final input = _imageInput;
    final cropRect = _cropRect;
    if (input == null || cropRect == null) return;

    final imageRect = _displayedImageRect;
    final scaleX = input.width / imageRect.width;
    final scaleY = input.height / imageRect.height;
    final imageLeft = ((cropRect.left - imageRect.left) * scaleX)
        .clamp(0, input.width.toDouble());
    final imageTop = ((cropRect.top - imageRect.top) * scaleY)
        .clamp(0, input.height.toDouble());
    final imageWidth =
        (cropRect.width * scaleX).clamp(1, input.width.toDouble() - imageLeft);
    final imageHeight =
        (cropRect.height * scaleY).clamp(1, input.height.toDouble() - imageTop);
    final cropped = await VirtualTryOnService.cropDataUri(
      dataUri: input.dataUri,
      left: imageLeft.toDouble(),
      top: imageTop.toDouble(),
      width: imageWidth.toDouble(),
      height: imageHeight.toDouble(),
    );
    if (!mounted) return;
    _goToFitting(cropped);
  }

  void _goToFitting(String garmentImageData) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => FittingLoadingPage(
          avatarImageData: widget.avatarImageData,
          items: widget.items,
          stepIndex: widget.stepIndex,
          garmentImageOverride: garmentImageData,
        ),
      ),
    );
  }

  void _setCropBoxFromLayout(Size size) {
    if (_imageInput == null || size == _imageBoxSize) return;
    _imageBoxSize = size;
    _displayedImageRect = _containRect(
      containerSize: size,
      imageWidth: _imageInput!.width,
      imageHeight: _imageInput!.height,
    );
    _cropRect ??= _defaultCropRect(_displayedImageRect);
  }

  void _moveCropBox(Offset delta) {
    final current = _cropRect;
    if (current == null) return;
    setState(() {
      _cropRect = _clampRect(current.translate(delta.dx, delta.dy));
    });
  }

  void _resizeCropBox(Offset delta) {
    final current = _cropRect;
    if (current == null) return;
    const minSize = 70.0;
    final next = Rect.fromLTWH(
      current.left,
      current.top,
      math.max(minSize, current.width + delta.dx),
      math.max(minSize, current.height + delta.dy),
    );
    setState(() => _cropRect = _clampRect(next));
  }

  Rect _clampRect(Rect rect) {
    final bounds = _displayedImageRect;
    final width = math.min(rect.width, bounds.width);
    final height = math.min(rect.height, bounds.height);
    final left = rect.left.clamp(bounds.left, bounds.right - width);
    final top = rect.top.clamp(bounds.top, bounds.bottom - height);
    return Rect.fromLTWH(left.toDouble(), top.toDouble(), width, height);
  }

  OutfitItem get _currentItem => widget.items[widget.stepIndex];

  @override
  Widget build(BuildContext context) {
    final input = _imageInput;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('피팅 이미지 확인'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: input == null
              ? _ReviewLoadingState(errorMessage: _errorMessage)
              : Column(
                  children: [
                    Expanded(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final size = Size(
                            constraints.maxWidth,
                            constraints.maxHeight,
                          );
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            if (mounted) {
                              setState(() => _setCropBoxFromLayout(size));
                            }
                          });
                          final cropRect = _cropRect;
                          return Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColors.line),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: _ReviewGarmentImage(
                                    input: input,
                                    item: _currentItem,
                                  ),
                                ),
                                if (cropRect != null) ...[
                                  Positioned.fromRect(
                                    rect: cropRect,
                                    child: GestureDetector(
                                      onPanUpdate: (details) =>
                                          _moveCropBox(details.delta),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: AppColors.main,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: cropRect.right - 34,
                                    top: cropRect.bottom - 34,
                                    child: GestureDetector(
                                      onPanUpdate: (details) =>
                                          _resizeCropBox(details.delta),
                                      child: const _CropHandle(),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      '${widget.stepIndex + 1}/${widget.items.length} ${_fittingSlot(_currentItem)} 이미지예요.',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.ink,
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      '옷만 최대한 크게 들어오게 영역을 맞추면 피팅이 더 자연스러워져요.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.muted,
                        fontSize: 12,
                        height: 1.35,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: _fitWithCrop,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.ink,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          '이 영역으로 피팅하기',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: OutlinedButton(
                        onPressed: () => _goToFitting(input.dataUri),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.ink,
                          side: const BorderSide(color: AppColors.line),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          '그대로 피팅하기',
                          style: TextStyle(fontWeight: FontWeight.w900),
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

class _ReviewLoadingState extends StatelessWidget {
  final String? errorMessage;

  const _ReviewLoadingState({this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (errorMessage == null)
            const CircularProgressIndicator(color: AppColors.main)
          else
            const Icon(Icons.error_outline, color: AppColors.main, size: 34),
          const SizedBox(height: 18),
          Text(
            errorMessage == null ? '피팅할 이미지를 확인하고 있어요.' : '이미지를 불러오지 못했어요.',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.ink,
              fontSize: 15,
              fontWeight: FontWeight.w900,
            ),
          ),
          if (errorMessage != null) ...[
            const SizedBox(height: 8),
            Text(
              errorMessage!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.muted,
                fontSize: 12,
                height: 1.4,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ReviewGarmentImage extends StatelessWidget {
  final GarmentImageInput input;
  final OutfitItem item;

  const _ReviewGarmentImage({
    required this.input,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final sourceUrl = input.sourceUrl;
    if (sourceUrl != null && sourceUrl.isNotEmpty) {
      return Image.network(
        sourceUrl,
        fit: BoxFit.contain,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return const Center(
            child: CircularProgressIndicator(color: AppColors.main),
          );
        },
        errorBuilder: (_, __, ___) => _memoryImageFallback,
      );
    }

    return _memoryImageFallback;
  }

  Widget get _memoryImageFallback {
    return Image.memory(
      base64Decode(input.dataUri.split(',').last),
      fit: BoxFit.contain,
      errorBuilder: (_, __, ___) => _OutfitItemImage(
        item: item,
        fit: BoxFit.contain,
      ),
    );
  }
}

class _CropHandle extends StatelessWidget {
  const _CropHandle();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        color: AppColors.main,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: const Icon(
        Icons.open_in_full,
        color: Colors.white,
        size: 18,
      ),
    );
  }
}

Rect _containRect({
  required Size containerSize,
  required int imageWidth,
  required int imageHeight,
}) {
  if (containerSize.isEmpty || imageWidth <= 0 || imageHeight <= 0) {
    return Rect.zero;
  }
  final imageRatio = imageWidth / imageHeight;
  final containerRatio = containerSize.width / containerSize.height;
  double width;
  double height;
  if (imageRatio > containerRatio) {
    width = containerSize.width;
    height = width / imageRatio;
  } else {
    height = containerSize.height;
    width = height * imageRatio;
  }
  return Rect.fromLTWH(
    (containerSize.width - width) / 2,
    (containerSize.height - height) / 2,
    width,
    height,
  );
}

Rect _defaultCropRect(Rect imageRect) {
  final width = imageRect.width * 0.72;
  final height = imageRect.height * 0.72;
  return Rect.fromLTWH(
    imageRect.left + (imageRect.width - width) / 2,
    imageRect.top + (imageRect.height - height) / 2,
    width,
    height,
  );
}

class FittingLoadingPage extends StatefulWidget {
  final String avatarImageData;
  final List<OutfitItem> items;
  final int stepIndex;
  final String? garmentImageOverride;

  const FittingLoadingPage({
    super.key,
    required this.avatarImageData,
    required this.items,
    required this.stepIndex,
    this.garmentImageOverride,
  });

  @override
  State<FittingLoadingPage> createState() => _FittingLoadingPageState();
}

class _FittingLoadingPageState extends State<FittingLoadingPage> {
  String? _currentImage;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _runSequentialFitting();
  }

  Future<void> _runSequentialFitting() async {
    final item = widget.items[widget.stepIndex];
    setState(() {
      _currentImage = widget.avatarImageData;
      _errorMessage = null;
    });

    try {
      final resultImage = await VirtualTryOnService.tryOn(
        personImage: widget.avatarImageData,
        item: item,
        garmentImageOverride: widget.garmentImageOverride,
      );
      if (resultImage.isEmpty) {
        throw Exception('피팅 결과 이미지가 비어 있어요.');
      }

      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => FittingResultPage(
            avatarImageData: resultImage,
            items: widget.items,
            completedStepIndex: widget.stepIndex,
          ),
        ),
      );
    } catch (error) {
      if (!mounted) return;
      setState(() => _errorMessage = error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Spacer(),
              SizedBox(
                height: 280,
                child: AvatarMemoryImage(
                  imageData: _currentImage ?? widget.avatarImageData,
                ),
              ),
              const SizedBox(height: 28),
              if (_errorMessage == null)
                const CircularProgressIndicator(color: AppColors.main)
              else
                const Icon(Icons.error_outline,
                    color: AppColors.main, size: 34),
              const SizedBox(height: 22),
              Text(
                _errorMessage == null
                    ? '${widget.stepIndex + 1}/${widget.items.length} $_currentItemLabel 피팅 중이에요.'
                    : '피팅 중 문제가 생겼어요.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.ink,
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                _errorMessage ?? '이번 단계 결과를 확인한 뒤 다음 피팅을 이어갈 수 있어요.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.muted,
                  fontSize: 12,
                  height: 1.45,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              _SelectedThumbRow(
                items: widget.items,
                completedCount: widget.stepIndex,
                activeIndex: widget.stepIndex,
              ),
              if (_errorMessage != null) ...[
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _runSequentialFitting,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.ink,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('다시 시도하기'),
                  ),
                ),
              ],
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  String get _currentItemLabel {
    if (widget.items.isEmpty) return '아이템';
    return _fittingSlot(widget.items[widget.stepIndex]);
  }
}

class FittingResultPage extends StatelessWidget {
  final String avatarImageData;
  final List<OutfitItem> items;
  final int completedStepIndex;

  const FittingResultPage({
    super.key,
    required this.avatarImageData,
    required this.items,
    required this.completedStepIndex,
  });

  @override
  Widget build(BuildContext context) {
    final hasNextStep = completedStepIndex < items.length - 1;
    final currentLabel = _fittingSlot(items[completedStepIndex]);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('피팅 결과'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xfff8f7f3),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.line),
                  ),
                  child: AvatarMemoryImage(imageData: avatarImageData),
                ),
              ),
              const SizedBox(height: 14),
              _SelectedThumbRow(
                items: items,
                completedCount: completedStepIndex + 1,
                activeIndex: completedStepIndex,
              ),
              const SizedBox(height: 14),
              Text(
                hasNextStep
                    ? '${completedStepIndex + 1}/${items.length} $currentLabel 피팅 결과예요.'
                    : '피팅 결과예요.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.muted,
                  fontSize: 12,
                  height: 1.45,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    if (hasNextStep) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => FittingImageReviewPage(
                            avatarImageData: avatarImageData,
                            items: items,
                            stepIndex: completedStepIndex + 1,
                          ),
                        ),
                      );
                      return;
                    }

                    StyleClosetStore.addFittingRecord(
                      avatarImageData: avatarImageData,
                      items: items,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('피팅기록에 저장했어요.')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.ink,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    hasNextStep ? '다음 순서 피팅하기' : '기록하기',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w900),
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

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _StoredItemsPage(
      title: '찜목록',
      emptyText: '추천 코디에서 하트를 누른 상품이 여기에 모여요.',
      itemsBuilder: () => StyleClosetStore.likedItems,
    );
  }
}

class WardrobePage extends StatelessWidget {
  const WardrobePage({super.key});

  @override
  Widget build(BuildContext context) {
    return _StoredItemsPage(
      title: '내옷장',
      emptyText: '추후 옷 촬영 기능을 연결하면 내가 찍은 옷이 여기에 저장돼요.',
      itemsBuilder: () => StyleClosetStore.wardrobeItems,
    );
  }
}

class FittingHistoryPage extends StatelessWidget {
  const FittingHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('피팅기록'),
        centerTitle: true,
      ),
      body: ValueListenableBuilder<int>(
        valueListenable: StyleClosetStore.revision,
        builder: (context, _, __) {
          final records = StyleClosetStore.fittingRecords;
          if (records.isEmpty) {
            return const _EmptyState(text: '아직 저장한 피팅 결과가 없어요.');
          }
          return ListView.separated(
            padding: const EdgeInsets.all(18),
            itemCount: records.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final record = records[index];
              return _FittingRecordCard(record: record);
            },
          );
        },
      ),
    );
  }
}

enum _FittingSource { liked, wardrobe }

int _fittingOrderForItem(OutfitItem item) {
  switch (_fittingSlot(item)) {
    case '원피스':
      return 0;
    case '상의':
      return 1;
    case '하의':
      return 2;
    case '아우터':
      return 3;
  }
  return 4;
}

String _fittingSlot(OutfitItem item) {
  final title = item.title.toLowerCase();
  final itemType = item.itemType.toLowerCase();
  final category = item.category.toLowerCase();
  final combined = '$title $itemType $category';

  if (_containsAny(title, ['원피스', '드레스', 'dress'])) return '원피스';
  if (_containsAny(title, ['스커트', '치마', '팬츠', '바지', '데님', '슬랙스', '하의'])) {
    return '하의';
  }
  if (_containsAny(
      title, ['가디건', '니트', '셔츠', '블라우스', '티셔츠', '맨투맨', '후드', '상의', '탑'])) {
    return '상의';
  }
  if (_containsAny(title, ['아우터', '자켓', '재킷', '코트', '점퍼', '블레이저'])) {
    return '아우터';
  }

  if (_containsAny(combined, ['원피스', '드레스', 'dress'])) return '원피스';
  if (_containsAny(
      combined, ['하의', '바지', '팬츠', '스커트', '치마', 'bottom', 'lower'])) {
    return '하의';
  }
  if (_containsAny(combined, ['아우터', '자켓', '재킷', '코트', 'outer'])) {
    return '아우터';
  }
  return '상의';
}

bool _containsAny(String value, List<String> tokens) {
  return tokens.any(value.contains);
}

class _AvatarPreview extends StatelessWidget {
  final String avatarImageData;

  const _AvatarPreview({required this.avatarImageData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 168,
      margin: const EdgeInsets.fromLTRB(18, 8, 18, 0),
      decoration: BoxDecoration(
        color: const Color(0xfff8f7f3),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.line),
      ),
      child: AvatarMemoryImage(imageData: avatarImageData),
    );
  }
}

class _SourceTabs extends StatelessWidget {
  final _FittingSource source;
  final ValueChanged<_FittingSource> onChanged;

  const _SourceTabs({
    required this.source,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.line),
      ),
      child: Row(
        children: [
          _SourceTabButton(
            text: '찜목록',
            selected: source == _FittingSource.liked,
            onTap: () => onChanged(_FittingSource.liked),
          ),
          _SourceTabButton(
            text: '내옷장',
            selected: source == _FittingSource.wardrobe,
            onTap: () => onChanged(_FittingSource.wardrobe),
          ),
        ],
      ),
    );
  }
}

class _SourceTabButton extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const _SourceTabButton({
    required this.text,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected ? AppColors.main : Colors.transparent,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: selected ? Colors.white : AppColors.ink,
              fontSize: 12,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}

class _StoredItemsPage extends StatelessWidget {
  final String title;
  final String emptyText;
  final List<OutfitItem> Function() itemsBuilder;

  const _StoredItemsPage({
    required this.title,
    required this.emptyText,
    required this.itemsBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: ValueListenableBuilder<int>(
        valueListenable: StyleClosetStore.revision,
        builder: (context, _, __) {
          final items = itemsBuilder();
          if (items.isEmpty) {
            return _EmptyState(text: emptyText);
          }
          return GridView.builder(
            padding: const EdgeInsets.all(18),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.72,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return _StoredItemCard(item: items[index]);
            },
          );
        },
      ),
    );
  }
}

class _SelectableItemCard extends StatelessWidget {
  final OutfitItem item;
  final bool selected;
  final VoidCallback onTap;

  const _SelectableItemCard({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          _StoredItemCard(item: item),
          Positioned(
            top: 8,
            right: 8,
            child: CircleAvatar(
              radius: 13,
              backgroundColor: selected ? AppColors.main : Colors.white,
              child: Icon(
                selected ? Icons.check : Icons.add,
                color: selected ? Colors.white : AppColors.main,
                size: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StoredItemCard extends StatelessWidget {
  final OutfitItem item;

  const _StoredItemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.line),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: _OutfitItemImage(item: item),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(9, 9, 9, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title.isEmpty ? item.category : item.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.ink,
                        fontSize: 11,
                        height: 1.25,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      item.mallName.isEmpty ? item.itemType : item.mallName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.muted,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (item.link.isNotEmpty)
          Positioned(
            top: 8,
            left: 8,
            child: GestureDetector(
              onTap: () async {
                final uri = Uri.tryParse(item.link);
                if (uri == null) return;
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              },
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.92),
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.line),
                ),
                child: const Icon(
                  Icons.open_in_new,
                  color: AppColors.ink,
                  size: 14,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _FittingSelectionBar extends StatelessWidget {
  final List<OutfitItem> selectedItems;
  final bool enabled;
  final VoidCallback onFit;

  const _FittingSelectionBar({
    required this.selectedItems,
    required this.enabled,
    required this.onFit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 12, 18, 14),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: AppColors.line)),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(child: _SelectedThumbRow(items: selectedItems)),
            const SizedBox(width: 12),
            SizedBox(
              width: 132,
              height: 46,
              child: ElevatedButton(
                onPressed: enabled ? onFit : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.ink,
                  disabledBackgroundColor: AppColors.chip,
                  foregroundColor: Colors.white,
                  disabledForegroundColor: AppColors.muted,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  '피팅하러가기',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SelectedThumbRow extends StatelessWidget {
  final List<OutfitItem> items;
  final int completedCount;
  final int? activeIndex;

  const _SelectedThumbRow({
    required this.items,
    this.completedCount = 0,
    this.activeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          if (index >= items.length) {
            return const _EmptySlot();
          }
          final completed = index < completedCount;
          final active = activeIndex == index;
          return Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: completed || active
                  ? AppColors.selectedBackground
                  : Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: completed || active ? AppColors.main : AppColors.line,
                width: completed || active ? 1.6 : 1,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: _OutfitItemImage(
                item: items[index],
                width: 46,
                height: 46,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _EmptySlot extends StatelessWidget {
  const _EmptySlot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.canvas,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.line),
      ),
      child: const Icon(Icons.add, color: AppColors.main, size: 18),
    );
  }
}

class _OutfitItemImage extends StatelessWidget {
  final OutfitItem item;
  final double? width;
  final double? height;
  final BoxFit fit;

  const _OutfitItemImage({
    required this.item,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  bool get _isRemote =>
      item.imageUrl.startsWith('http://') ||
      item.imageUrl.startsWith('https://');

  @override
  Widget build(BuildContext context) {
    if (_isRemote) {
      return Image.network(
        item.imageUrl,
        width: width,
        height: height,
        fit: fit,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return _fallback;
        },
        errorBuilder: (_, __, ___) => _fallback,
      );
    }

    return Image.file(
      File(item.imageUrl),
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (_, __, ___) => _fallback,
    );
  }

  Widget get _fallback {
    return const ColoredBox(
      color: AppColors.canvas,
      child: Icon(
        Icons.checkroom_outlined,
        color: AppColors.main,
      ),
    );
  }
}

class _FittingRecordCard extends StatelessWidget {
  final FittingRecord record;

  const _FittingRecordCard({required this.record});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.line),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 74,
            height: 92,
            child: AvatarMemoryImage(imageData: record.avatarImageData),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${record.items.length}개 아이템 피팅',
                  style: const TextStyle(
                    color: AppColors.ink,
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  record.items
                      .map((item) =>
                          item.title.isEmpty ? item.category : item.title)
                      .join(', '),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.muted,
                    fontSize: 11,
                    height: 1.4,
                    fontWeight: FontWeight.w700,
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

class _EmptyState extends StatelessWidget {
  final String text;

  const _EmptyState({required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.muted,
            fontSize: 13,
            height: 1.5,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
