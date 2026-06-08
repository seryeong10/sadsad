import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../services/community_store.dart';
import '../theme/app_colors.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  int selectedTab = 0;
  int selectedCategory = 0;
  final List<CommunityPost> _posts = CommunityStore.posts;

  static const categories = ['추천', '전체', '데일리룩', '데이트룩', '오피스룩', '꾸안꾸'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.fromLTRB(22, 22, 22, 24),
            children: [
              const _CommunityHeader(),
              const SizedBox(height: 18),
              _CommunityTabs(
                selectedIndex: selectedTab,
                onChanged: (index) => setState(() => selectedTab = index),
              ),
              const SizedBox(height: 16),
              const _SearchBar(),
              const SizedBox(height: 18),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 180),
                child: selectedTab == 0
                    ? _StyleShareView(
                        selectedCategory: selectedCategory,
                        posts: _filteredPosts,
                        onPostChanged: () => setState(() {}),
                        onCategoryChanged: (index) {
                          setState(() => selectedCategory = index);
                        },
                      )
                    : const _FashionMagazineView(),
              ),
            ],
          ),
          if (selectedTab == 0)
            Positioned(
              right: 22,
              bottom: 24,
              child: _WriteButton(onTap: _openWritePage),
            ),
        ],
      ),
    );
  }

  List<CommunityPost> get _filteredPosts {
    final category = categories[selectedCategory];
    if (category == '추천' || category == '전체') {
      return _posts;
    }
    return _posts.where((post) => post.tags.contains(category)).toList();
  }

  Future<void> _openWritePage() async {
    final post = await Navigator.push<CommunityPost>(
      context,
      MaterialPageRoute(builder: (_) => const CommunityWritePage()),
    );
    if (post == null || !mounted) return;
    setState(() => _posts.insert(0, post));
  }
}

class _CommunityHeader extends StatelessWidget {
  const _CommunityHeader();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Text(
            'COMMUNITY',
            style: TextStyle(
              color: AppColors.ink,
              fontSize: 26,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Icon(Icons.notifications_none_outlined, color: AppColors.ink, size: 26),
      ],
    );
  }
}

class _CommunityTabs extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const _CommunityTabs({
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.line),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          _CommunityTabButton(
            icon: Icons.people_alt_outlined,
            label: '스타일 공유',
            selected: selectedIndex == 0,
            onTap: () => onChanged(0),
          ),
          _CommunityTabButton(
            icon: Icons.menu_book_outlined,
            label: '패션 매거진',
            selected: selectedIndex == 1,
            onTap: () => onChanged(1),
          ),
        ],
      ),
    );
  }
}

class _CommunityTabButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _CommunityTabButton({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 18,
              color: selected ? AppColors.ink : AppColors.muted,
            ),
            const SizedBox(width: 7),
            Text(
              label,
              style: TextStyle(
                color: selected ? AppColors.ink : AppColors.muted,
                fontSize: 13,
                fontWeight: selected ? FontWeight.w900 : FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: AppColors.chip,
              borderRadius: BorderRadius.circular(22),
            ),
            child: const Row(
              children: [
                Icon(Icons.search, color: AppColors.ink, size: 20),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '스타일, 아이템, 색상, 키워드 검색',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.muted,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _StyleShareView extends StatelessWidget {
  final int selectedCategory;
  final List<CommunityPost> posts;
  final ValueChanged<int> onCategoryChanged;
  final VoidCallback onPostChanged;

  const _StyleShareView({
    required this.selectedCategory,
    required this.posts,
    required this.onCategoryChanged,
    required this.onPostChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey('style-share'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 38,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: _CommunityPageState.categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              return _CategoryChip(
                label: _CommunityPageState.categories[index],
                selected: selectedCategory == index,
                onTap: () => onCategoryChanged(index),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        if (posts.isEmpty)
          const _EmptyCommunityState()
        else
          ...List.generate(posts.length, (index) {
            return Padding(
              padding: EdgeInsets.only(bottom: index == posts.length - 1 ? 0 : 14),
              child: _PostCard(post: posts[index], onChanged: onPostChanged),
            );
          }),
      ],
    );
  }
}

class _EmptyCommunityState extends StatelessWidget {
  const _EmptyCommunityState();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 44),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.line),
      ),
      child: const Column(
        children: [
          Icon(Icons.chat_bubble_outline, color: AppColors.main, size: 34),
          SizedBox(height: 12),
          Text(
            '아직 이 카테고리의 게시물이 없어요.',
            style: TextStyle(
              color: AppColors.ink,
              fontSize: 13,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _CategoryChip({
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
        height: 36,
        padding: const EdgeInsets.symmetric(horizontal: 17),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? AppColors.main : Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: selected ? AppColors.main : AppColors.line,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : AppColors.ink,
            fontSize: 12,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

class _PostCard extends StatelessWidget {
  final CommunityPost post;
  final VoidCallback onChanged;

  const _PostCard({
    required this.post,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final changed = await Navigator.push<bool>(
          context,
          MaterialPageRoute(builder: (_) => CommunityPostDetailPage(post: post)),
        );
        if (changed == true) onChanged();
      },
      child: Container(
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.line),
          boxShadow: const [
            BoxShadow(
              color: Color(0x08000000),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                _AvatarDot(label: post.user),
                const SizedBox(width: 10),
                Text(
                  post.user,
                  style: const TextStyle(
                    color: AppColors.ink,
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  post.time,
                  style: const TextStyle(
                    color: AppColors.muted,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                if (post.isMine)
                  _PostMoreMenu(post: post, onChanged: onChanged)
                else
                  const Icon(Icons.more_horiz, color: AppColors.ink, size: 22),
              ],
            ),
            const SizedBox(height: 13),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _PostPreviewImage(post: post, width: 144, height: 228),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${post.title} 𖤣',
                        style: const TextStyle(
                          color: AppColors.ink,
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        post.body,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.ink,
                          fontSize: 11,
                          height: 1.8,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Wrap(
                        spacing: 7,
                        runSpacing: 7,
                        children: post.tags.map((tag) => _TagPill(tag)).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 13),
            _EngagementRow(post: post, compact: true),
          ],
        ),
      ),
    );
  }
}

class _PostMoreMenu extends StatelessWidget {
  final CommunityPost post;
  final VoidCallback onChanged;

  const _PostMoreMenu({
    required this.post,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_horiz, color: AppColors.ink, size: 22),
      onSelected: (value) async {
        if (value == 'edit') {
          final edited = await Navigator.push<CommunityPost>(
            context,
            MaterialPageRoute(
              builder: (_) => CommunityWritePage(initialPost: post),
            ),
          );
          if (edited == null) return;
          post.updateFrom(edited);
          onChanged();
          return;
        }

        if (value == 'delete') {
          CommunityStore.posts.remove(post);
          onChanged();
        }
      },
      itemBuilder: (_) => const [
        PopupMenuItem(value: 'edit', child: Text('수정하기')),
        PopupMenuItem(value: 'delete', child: Text('삭제하기')),
      ],
    );
  }
}

class _PostPreviewImage extends StatelessWidget {
  final CommunityPost post;
  final double width;
  final double height;

  const _PostPreviewImage({
    required this.post,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: post.imagePaths.isEmpty
            ? _SmallEditorialImage(type: post.imageType)
            : Image.file(
                File(post.imagePaths.first),
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) {
                  return _SmallEditorialImage(type: post.imageType);
                },
              ),
      ),
    );
  }
}

class _EngagementRow extends StatefulWidget {
  final CommunityPost post;
  final bool compact;

  const _EngagementRow({
    required this.post,
    this.compact = false,
  });

  @override
  State<_EngagementRow> createState() => _EngagementRowState();
}

class _EngagementRowState extends State<_EngagementRow> {
  @override
  Widget build(BuildContext context) {
    final iconSize = widget.compact ? 19.0 : 24.0;
    return Row(
      children: [
        SizedBox(width: widget.compact ? 6 : 0),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: _toggleLike,
          child: Icon(
            widget.post.isLiked ? Icons.favorite : Icons.favorite_border,
            color: widget.post.isLiked ? const Color(0xffd84b4b) : Colors.black,
            size: iconSize,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          '${widget.post.likes}',
          style: TextStyle(
            fontSize: widget.compact ? 11 : 13,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: _toggleSave,
          child: Icon(
            widget.post.isSaved ? Icons.bookmark : Icons.bookmark_border,
            color: widget.post.isSaved ? AppColors.main : Colors.black,
            size: widget.compact ? 21 : 24,
          ),
        ),
        SizedBox(width: widget.compact ? 6 : 0),
      ],
    );
  }

  void _toggleLike() {
    setState(() {
      widget.post.isLiked = !widget.post.isLiked;
      widget.post.likes += widget.post.isLiked ? 1 : -1;
    });
  }

  void _toggleSave() {
    setState(() {
      widget.post.isSaved = !widget.post.isSaved;
    });
  }
}

class CommunityWritePage extends StatefulWidget {
  final CommunityPost? initialPost;

  const CommunityWritePage({super.key, this.initialPost});

  @override
  State<CommunityWritePage> createState() => _CommunityWritePageState();
}

class _CommunityWritePageState extends State<CommunityWritePage> {
  final ImagePicker _picker = ImagePicker();
  final PageController _pageController = PageController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _tagController = TextEditingController();
  final Map<String, TextEditingController> _itemControllers = {
    '아우터': TextEditingController(),
    '상의': TextEditingController(),
    '하의': TextEditingController(),
    '신발': TextEditingController(),
    '그 외': TextEditingController(),
  };
  final List<XFile> _images = [];
  final List<String> _tags = [];
  bool _itemExpanded = true;
  int _imageIndex = 0;

  @override
  void initState() {
    super.initState();
    final post = widget.initialPost;
    if (post == null) {
      _tags.addAll(['데일리룩', '라이트올리브', '셔츠코디']);
      return;
    }

    _titleController.text = post.title;
    _bodyController.text = post.body;
    _tags.addAll(post.tags);
    _images.addAll(post.imagePaths.map((path) => XFile(path)));
    for (final entry in post.itemInfo.entries) {
      _itemControllers[entry.key]?.text = entry.value;
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _titleController.dispose();
    _bodyController.dispose();
    _tagController.dispose();
    for (final controller in _itemControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _WriteHeader(onSubmit: _submit),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(22, 8, 22, 24),
                children: [
                  _PhotoPickerBox(
                    images: _images,
                    pageController: _pageController,
                    currentIndex: _imageIndex,
                    onPick: _pickImages,
                    onRemove: _removeImage,
                    onPageChanged: (index) => setState(() => _imageIndex = index),
                    onReorder: _reorderImage,
                  ),
                  const SizedBox(height: 16),
                  _WriteTextField(
                    label: '제목',
                    hint: '오늘의 코디를 소개해보세요',
                    controller: _titleController,
                  ),
                  const SizedBox(height: 14),
                  _WriteTextField(
                    label: '내용',
                    hint: '스타일링 포인트, 매치한 아이템, 착용 후기 등을 자유롭게 작성해주세요',
                    controller: _bodyController,
                    maxLines: 5,
                    counterText: '${_bodyController.text.length}/1000',
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 14),
                  _ItemInfoEditor(
                    expanded: _itemExpanded,
                    controllers: _itemControllers,
                    onToggle: () => setState(() => _itemExpanded = !_itemExpanded),
                  ),
                  const SizedBox(height: 14),
                  _HashTagEditor(
                    tags: _tags,
                    controller: _tagController,
                    onAdd: _addTag,
                    onRemove: (tag) => setState(() => _tags.remove(tag)),
                  ),
                  const SizedBox(height: 24),
                  _SubmitPostButton(onPressed: _submit),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImages() async {
    final picked = await _picker.pickMultiImage(imageQuality: 86);
    if (picked.isEmpty) return;
    setState(() {
      final slots = 5 - _images.length;
      _images.addAll(picked.take(slots));
      _imageIndex = _images.length - 1;
    });
    if (_images.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_pageController.hasClients) {
          _pageController.jumpToPage(_imageIndex);
        }
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _images.removeAt(index);
      _imageIndex = _images.isEmpty ? 0 : _imageIndex.clamp(0, _images.length - 1);
    });
  }

  void _reorderImage(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) newIndex -= 1;
      final item = _images.removeAt(oldIndex);
      _images.insert(newIndex, item);
      _imageIndex = newIndex;
    });
  }

  void _addTag() {
    final raw = _tagController.text.trim();
    if (raw.isEmpty || _tags.length >= 10) return;
    final tag = raw.replaceAll('#', '');
    if (_tags.contains(tag)) return;
    setState(() {
      _tags.add(tag);
      _tagController.clear();
    });
  }

  void _submit() {
    final title = _titleController.text.trim();
    final body = _bodyController.text.trim();
    if (title.isEmpty || body.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('제목과 내용을 입력해주세요.')),
      );
      return;
    }

    final items = <String, String>{};
    for (final entry in _itemControllers.entries) {
      final value = entry.value.text.trim();
      if (value.isNotEmpty) items[entry.key] = value;
    }

    Navigator.pop(
      context,
      CommunityPost(
        user: CommunityStore.myUserName,
        time: widget.initialPost?.time ?? '방금 전',
        title: title,
        body: body,
        tags: List.unmodifiable(_tags),
        likes: widget.initialPost?.likes ?? 0,
        imageType: OutfitImageType.oliveShirt,
        imagePaths: List.unmodifiable(_images.map((image) => image.path)),
        itemInfo: items,
        isLiked: widget.initialPost?.isLiked ?? false,
        isSaved: widget.initialPost?.isSaved ?? false,
      ),
    );
  }
}

class _WriteHeader extends StatelessWidget {
  final VoidCallback onSubmit;

  const _WriteHeader({required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 14, 6),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back, color: AppColors.ink),
          ),
          const Expanded(
            child: Text(
              '게시물 작성',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.ink,
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          TextButton(
            onPressed: onSubmit,
            child: const Text(
              '등록',
              style: TextStyle(
                color: AppColors.main,
                fontSize: 15,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PhotoPickerBox extends StatelessWidget {
  final List<XFile> images;
  final PageController pageController;
  final int currentIndex;
  final VoidCallback onPick;
  final ValueChanged<int> onRemove;
  final ValueChanged<int> onPageChanged;
  final void Function(int oldIndex, int newIndex) onReorder;

  const _PhotoPickerBox({
    required this.images,
    required this.pageController,
    required this.currentIndex,
    required this.onPick,
    required this.onRemove,
    required this.onPageChanged,
    required this.onReorder,
  });

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return GestureDetector(
        onTap: onPick,
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.muted, style: BorderStyle.solid),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_photo_alternate_outlined, color: AppColors.muted, size: 42),
              SizedBox(height: 10),
              Text(
                '사진 추가',
                style: TextStyle(
                  color: AppColors.ink,
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 6),
              Text(
                '최대 5장',
                style: TextStyle(
                  color: AppColors.muted,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.line),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 190,
            child: Stack(
              children: [
                PageView.builder(
                  controller: pageController,
                  itemCount: images.length,
                  onPageChanged: onPageChanged,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        File(images[index].path),
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    );
                  },
                ),
                Positioned(
                  left: 10,
                  top: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.main,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      currentIndex == 0 ? '대표 사진' : '${currentIndex + 1}/${images.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: _RoundIconButton(
                    icon: Icons.close,
                    onTap: () => onRemove(currentIndex),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 76,
            child: ReorderableListView.builder(
              scrollDirection: Axis.horizontal,
              buildDefaultDragHandles: false,
              itemCount: images.length + (images.length < 5 ? 1 : 0),
              onReorder: onReorder,
              itemBuilder: (context, index) {
                if (index == images.length) {
                  return Padding(
                    key: const ValueKey('add-photo'),
                    padding: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: onPick,
                      child: Container(
                        width: 70,
                        decoration: BoxDecoration(
                          color: AppColors.canvas,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.line),
                        ),
                        child: const Icon(Icons.add, color: AppColors.main),
                      ),
                    ),
                  );
                }
                return ReorderableDelayedDragStartListener(
                  key: ValueKey(images[index].path),
                  index: index,
                  child: GestureDetector(
                    onTap: () {
                      pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 180),
                        curve: Curves.easeOut,
                      );
                    },
                    child: Container(
                      width: 70,
                      margin: const EdgeInsets.only(right: 8),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: index == currentIndex ? AppColors.main : AppColors.line,
                          width: index == currentIndex ? 2 : 1,
                        ),
                      ),
                      child: Image.file(File(images[index].path), fit: BoxFit.cover),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '사진 ${images.length}/5',
            style: const TextStyle(
              color: AppColors.ink,
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            '사진을 길게 눌러 순서를 바꿀 수 있어요',
            style: TextStyle(
              color: AppColors.muted,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _RoundIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 34,
        height: 34,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppColors.main, size: 20),
      ),
    );
  }
}

class _WriteTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final int maxLines;
  final String? counterText;
  final ValueChanged<String>? onChanged;

  const _WriteTextField({
    required this.label,
    required this.hint,
    required this.controller,
    this.maxLines = 1,
    this.counterText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.line),
      ),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        maxLength: maxLines > 1 ? 1000 : null,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          counterText: counterText,
          border: InputBorder.none,
          labelStyle: const TextStyle(
            color: AppColors.ink,
            fontSize: 15,
            fontWeight: FontWeight.w900,
          ),
          hintStyle: const TextStyle(
            color: AppColors.muted,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: const TextStyle(
          color: AppColors.ink,
          fontSize: 14,
          height: 1.55,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _ItemInfoEditor extends StatelessWidget {
  final bool expanded;
  final Map<String, TextEditingController> controllers;
  final VoidCallback onToggle;

  const _ItemInfoEditor({
    required this.expanded,
    required this.controllers,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.line),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: onToggle,
            child: Row(
              children: [
                const Text(
                  '착용 아이템 정보',
                  style: TextStyle(
                    color: AppColors.ink,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.chip,
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: const Text(
                    '선택 입력',
                    style: TextStyle(
                      color: AppColors.muted,
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const Spacer(),
                Icon(
                  expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: AppColors.main,
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '입력하지 않아도 괜찮아요',
              style: TextStyle(
                color: AppColors.muted,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          if (expanded) ...[
            const SizedBox(height: 14),
            ...controllers.entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    SizedBox(
                      width: 62,
                      child: Text(
                        entry.key,
                        style: const TextStyle(
                          color: AppColors.ink,
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 36,
                        child: TextField(
                          controller: entry.value,
                          decoration: InputDecoration(
                            hintText: _itemHint(entry.key),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 14),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(99),
                              borderSide: const BorderSide(color: AppColors.line),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(99),
                              borderSide: const BorderSide(color: AppColors.line),
                            ),
                          ),
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ],
      ),
    );
  }

  String _itemHint(String label) {
    switch (label) {
      case '아우터':
        return '예: 블랙 자켓';
      case '상의':
        return '예: 라이트 올리브 셔츠';
      case '하의':
        return '예: 블랙 팬츠';
      case '신발':
        return '예: 로퍼';
      default:
        return '예: 실버 시계';
    }
  }
}

class _HashTagEditor extends StatelessWidget {
  final List<String> tags;
  final TextEditingController controller;
  final VoidCallback onAdd;
  final ValueChanged<String> onRemove;

  const _HashTagEditor({
    required this.tags,
    required this.controller,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '해시태그',
            style: TextStyle(
              color: AppColors.ink,
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            '자유롭게 입력해보세요',
            style: TextStyle(
              color: AppColors.muted,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ...tags.map((tag) {
                return GestureDetector(
                  onTap: () => onRemove(tag),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.chip,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '#$tag  ×',
                      style: const TextStyle(
                        color: AppColors.ink,
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                );
              }),
              SizedBox(
                width: 86,
                height: 36,
                child: TextField(
                  controller: controller,
                  onSubmitted: (_) => onAdd(),
                  decoration: InputDecoration(
                    hintText: '+',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: AppColors.muted),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            '최대 10개까지 등록할 수 있어요',
            style: TextStyle(
              color: AppColors.muted,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _SubmitPostButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _SubmitPostButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.main,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: const Text(
          '게시물 올리기',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}

class CommunityPostDetailPage extends StatefulWidget {
  final CommunityPost post;

  const CommunityPostDetailPage({super.key, required this.post});

  @override
  State<CommunityPostDetailPage> createState() => CommunityPostDetailPageState();
}

class CommunityPostDetailPageState extends State<CommunityPostDetailPage> {
  int _page = 0;
  bool _itemExpanded = false;

  @override
  Widget build(BuildContext context) {
    final post = widget.post;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 14, 6),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, color: AppColors.ink),
                  ),
                  const Expanded(
                    child: Text(
                      '게시물',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.ink,
                        fontSize: 17,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  if (post.isMine)
                    PopupMenuButton<String>(
                      icon: const Icon(Icons.more_horiz, color: AppColors.ink),
                      onSelected: _handlePostMenu,
                      itemBuilder: (_) => const [
                        PopupMenuItem(value: 'edit', child: Text('수정하기')),
                        PopupMenuItem(value: 'delete', child: Text('삭제하기')),
                      ],
                    )
                  else
                    const Icon(Icons.more_horiz, color: AppColors.ink),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(22, 10, 22, 28),
                children: [
                  Row(
                    children: [
                      _AvatarDot(label: post.user),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.user,
                            style: const TextStyle(
                              color: AppColors.ink,
                              fontSize: 13,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            post.time,
                            style: const TextStyle(
                              color: AppColors.muted,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _DetailImageCarousel(
                    post: post,
                    page: _page,
                    onChanged: (index) => setState(() => _page = index),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '${post.title} 🌿',
                    style: const TextStyle(
                      color: AppColors.ink,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    post.body,
                    style: const TextStyle(
                      color: AppColors.ink,
                      fontSize: 13,
                      height: 1.65,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: post.tags.map((tag) => _TagPill(tag)).toList(),
                  ),
                  const SizedBox(height: 16),
                  _EngagementRow(post: post),
                  const SizedBox(height: 18),
                  _DetailItemInfoCard(
                    items: post.itemInfo,
                    expanded: _itemExpanded,
                    onToggle: () => setState(() => _itemExpanded = !_itemExpanded),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handlePostMenu(String value) async {
    final post = widget.post;
    if (value == 'edit') {
      final edited = await Navigator.push<CommunityPost>(
        context,
        MaterialPageRoute(
          builder: (_) => CommunityWritePage(initialPost: post),
        ),
      );
      if (edited == null || !mounted) return;
      setState(() => post.updateFrom(edited));
      return;
    }

    if (value == 'delete') {
      CommunityStore.posts.remove(post);
      if (!mounted) return;
      Navigator.pop(context, true);
    }
  }
}

class _DetailImageCarousel extends StatelessWidget {
  final CommunityPost post;
  final int page;
  final ValueChanged<int> onChanged;

  const _DetailImageCarousel({
    required this.post,
    required this.page,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final count = post.imagePaths.isEmpty ? 1 : post.imagePaths.length;
    return Column(
      children: [
        SizedBox(
          height: 360,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: PageView.builder(
                  itemCount: count,
                  onPageChanged: onChanged,
                  itemBuilder: (context, index) {
                    if (post.imagePaths.isEmpty) {
                      return _SmallEditorialImage(type: post.imageType);
                    }
                    return Image.file(
                      File(post.imagePaths[index]),
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => _SmallEditorialImage(type: post.imageType),
                    );
                  },
                ),
              ),
              Positioned(
                right: 12,
                top: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.55),
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: Text(
                    '${page + 1}/$count',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(count, (index) {
            return Container(
              width: index == page ? 7 : 6,
              height: index == page ? 7 : 6,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: index == page ? AppColors.ink : AppColors.line,
                shape: BoxShape.circle,
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _DetailItemInfoCard extends StatelessWidget {
  final Map<String, String> items;
  final bool expanded;
  final VoidCallback onToggle;

  const _DetailItemInfoCard({
    required this.items,
    required this.expanded,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.line),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: onToggle,
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    '착용 아이템 정보',
                    style: TextStyle(
                      color: AppColors.ink,
                      fontSize: 13,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Icon(
                  expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: AppColors.ink,
                ),
              ],
            ),
          ),
          if (expanded) ...[
            const SizedBox(height: 12),
            if (items.isEmpty)
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '등록된 착용 아이템 정보가 없어요.',
                  style: TextStyle(
                    color: AppColors.muted,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            else
              ...items.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 58,
                        child: Text(
                          entry.key,
                          style: const TextStyle(
                            color: AppColors.ink,
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          entry.value,
                          style: const TextStyle(
                            color: AppColors.muted,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
          ],
        ],
      ),
    );
  }
}

class _FashionMagazineView extends StatelessWidget {
  const _FashionMagazineView();

  @override
  Widget build(BuildContext context) {
    return const Column(
      key: ValueKey('fashion-magazine'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TrendKeywordStrip(),
        SizedBox(height: 20),
        _HeroMagazineCard(),
        SizedBox(height: 26),
        _SectionHeader(title: "EDITOR'S PICK"),
        SizedBox(height: 12),
        _EditorsPickRow(),
        SizedBox(height: 26),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _ColorGuideCard()),
            SizedBox(width: 12),
            Expanded(child: _BrandCard()),
          ],
        ),
      ],
    );
  }
}

class _TrendKeywordStrip extends StatelessWidget {
  const _TrendKeywordStrip();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          '실시간 인기 검색어',
          style: TextStyle(
            color: AppColors.ink,
            fontSize: 11,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(width: 18),
        Container(width: 1, height: 20, color: AppColors.line),
        const SizedBox(width: 16),
        const Expanded(
          child: Text(
            '올리브 자켓  ↑ 2',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.ink,
              fontSize: 14,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        const SizedBox(width: 12),
        const Icon(Icons.circle, color: AppColors.main, size: 5),
        const SizedBox(width: 5),
        const Text(
          '지금 뜨는 키워드',
          style: TextStyle(
            color: AppColors.muted,
            fontSize: 9,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _HeroMagazineCard extends StatelessWidget {
  const _HeroMagazineCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 254,
      decoration: BoxDecoration(
        color: AppColors.canvas,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.line),
      ),
      clipBehavior: Clip.antiAlias,
      child: const Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(22, 26, 14, 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '2026 S/S TREND',
                    style: TextStyle(
                      color: AppColors.muted,
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Soft Utility\nLook',
                    style: TextStyle(
                      color: AppColors.ink,
                      fontSize: 25,
                      height: 1.05,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    '실용적인 무드에 부드러운 감성을 더한\n이번 시즌 가장 주목할 스타일.',
                    style: TextStyle(
                      color: AppColors.muted,
                      fontSize: 10,
                      height: 1.7,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        '자세히 보기',
                        style: TextStyle(
                          color: AppColors.ink,
                          fontSize: 11,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_forward, size: 13, color: AppColors.ink),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: _EditorialFigureCard(),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: AppColors.ink,
              fontSize: 15,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        const Text(
          '전체 보기 >',
          style: TextStyle(
            color: AppColors.muted,
            fontSize: 10,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _EditorsPickRow extends StatelessWidget {
  const _EditorsPickRow();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: _PickCard(
            label: 'STYLE',
            title: '요즘 자주 보이는\n셔츠 레이어드 스타일',
            type: OutfitImageType.ivoryShirt,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: _PickCard(
            label: 'ITEM',
            title: '스웨이드 백,\n왜 이렇게 인기일까?',
            type: OutfitImageType.bag,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: _PickCard(
            label: 'TREND',
            title: '미니멀은 계속된다\n2026 미니멀 키워드',
            type: OutfitImageType.blackWhite,
          ),
        ),
      ],
    );
  }
}

class _PickCard extends StatelessWidget {
  final String label;
  final String title;
  final OutfitImageType type;

  const _PickCard({
    required this.label,
    required this.title,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 172,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: AppColors.line),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _SmallEditorialImage(type: type)),
          Padding(
            padding: const EdgeInsets.all(9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.selectedBackground,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Text(
                    label,
                    style: const TextStyle(
                      color: AppColors.main,
                      fontSize: 7,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.ink,
                    fontSize: 10,
                    height: 1.35,
                    fontWeight: FontWeight.w900,
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

class _ColorGuideCard extends StatelessWidget {
  const _ColorGuideCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 146,
      decoration: BoxDecoration(
        color: AppColors.canvas,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.line),
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xff6f7658), Color(0xffaab18e)],
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Text(
                    'Dusty Olive',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '차분하고 세련된 무드의\n대표 컬러.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _ColorSwatch(color: Color(0xff8f9b72), label: 'Olive'),
                  SizedBox(height: 10),
                  _ColorSwatch(color: Color(0xffeee7da), label: 'Ivory'),
                  SizedBox(height: 10),
                  _ColorSwatch(color: Color(0xffd4c9b7), label: 'Stone'),
                  SizedBox(height: 10),
                  _ColorSwatch(color: Color(0xff4b4f4d), label: 'Charcoal'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ColorSwatch extends StatelessWidget {
  final Color color;
  final String label;

  const _ColorSwatch({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              color: AppColors.ink,
              fontSize: 9,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

class _BrandCard extends StatelessWidget {
  const _BrandCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 146,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.line),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xffd6d7d0), Color(0xff777b73)],
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          Text(
            'LOW CLASSIC',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '미니멀한 실루엣과\n절제된 디테일의 조합',
            style: TextStyle(
              color: Colors.white,
              fontSize: 9,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _AvatarDot extends StatelessWidget {
  final String label;

  const _AvatarDot({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppColors.selectedBackground,
        shape: BoxShape.circle,
      ),
      child: Text(
        label.characters.first,
        style: const TextStyle(
          color: AppColors.main,
          fontSize: 12,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

class _TagPill extends StatelessWidget {
  final String label;

  const _TagPill(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: AppColors.line),
      ),
      child: Text(
        '# $label',
        style: const TextStyle(
          color: AppColors.ink,
          fontSize: 9,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _WriteButton extends StatelessWidget {
  final VoidCallback onTap;

  const _WriteButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56,
        height: 56,
        decoration: const BoxDecoration(
          color: AppColors.main,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color(0x33000000),
              blurRadius: 12,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }
}

class _EditorialFigureCard extends StatelessWidget {
  const _EditorialFigureCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xfff1f0eb),
      child: const Stack(
        children: [
          Center(
            child: Icon(
              Icons.image_not_supported_outlined,
              color: AppColors.muted,
              size: 34,
            ),
          ),
          Positioned(
            right: 15,
            bottom: 20,
            child: SizedBox(
              width: 114,
              child: Divider(height: 1, color: Colors.white70),
            ),
          ),
          Positioned(
            right: 18,
            bottom: 28,
            child: Text(
              '01 / 05',
              style: TextStyle(
                color: AppColors.muted,
                fontSize: 10,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SmallEditorialImage extends StatelessWidget {
  final OutfitImageType type;

  const _SmallEditorialImage({required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.canvas),
      clipBehavior: Clip.antiAlias,
      child: Center(
        child: Icon(
          _iconFor(type),
          color: AppColors.muted,
          size: 28,
        ),
      ),
    );
  }

  IconData _iconFor(OutfitImageType type) {
    switch (type) {
      case OutfitImageType.oliveShirt:
      case OutfitImageType.blackWhite:
      case OutfitImageType.ivoryShirt:
        return Icons.checkroom_outlined;
      case OutfitImageType.flatlay:
      case OutfitImageType.bag:
        return Icons.image_not_supported_outlined;
    }
  }
}
