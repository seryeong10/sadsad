import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/style_profile.dart';
import '../services/outfit_recommendation_service.dart';
import '../services/style_closet_store.dart';
import '../theme/app_colors.dart';
import '../widgets/outfit_image.dart';

class OutfitRecommendationPage extends StatefulWidget {
  final String gender;
  final String avatarImageData;
  final String situation;
  final String style;
  final PersonalColorProfile? personalColorProfile;
  final SkeletonProfile? skeletonProfile;

  const OutfitRecommendationPage({
    super.key,
    required this.gender,
    required this.avatarImageData,
    required this.situation,
    required this.style,
    this.personalColorProfile,
    this.skeletonProfile,
  });

  @override
  State<OutfitRecommendationPage> createState() =>
      _OutfitRecommendationPageState();
}

class _OutfitRecommendationPageState extends State<OutfitRecommendationPage> {
  late Future<OutfitRecommendationResponse> _recommendation;
  List<String> _previousIds = [];

  bool get _isMale => widget.gender.toLowerCase() == 'male';

  @override
  void initState() {
    super.initState();
    _loadRecommendations();
  }

  void _loadRecommendations({bool refresh = false}) {
    _recommendation = OutfitRecommendationService.recommendOutfits(
      situation: widget.situation,
      style: widget.style,
      gender: widget.gender,
      personalColorType: widget.personalColorProfile?.type ?? '',
      skeletonType: widget.skeletonProfile?.type ?? '',
      limit: 30,
      refreshSeed: refresh ? DateTime.now().microsecondsSinceEpoch.toString() : '',
      excludeIds: refresh ? _previousIds : const [],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: FutureBuilder<OutfitRecommendationResponse>(
          future: _recommendation,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const _LoadingView();
            }

            if (snapshot.hasError) {
              return _ErrorView(
                message: snapshot.error.toString(),
                onRetry: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => OutfitRecommendationPage(
                        gender: widget.gender,
                        avatarImageData: widget.avatarImageData,
                        situation: widget.situation,
                        style: widget.style,
                        personalColorProfile: widget.personalColorProfile,
                        skeletonProfile: widget.skeletonProfile,
                      ),
                    ),
                  );
                },
              );
            }

            final data = snapshot.data!;
            _previousIds = data.items.map((item) => item.imageId).toList();
            final groups = _groupItems(data.items);

            final sections = _visibleSections(groups);

            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: _RecommendationHeader(
                    situation: data.situation,
                    style: data.style,
                    personalColorProfile: widget.personalColorProfile,
                    skeletonProfile: widget.skeletonProfile,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: OutlinedButton.icon(
                      onPressed: () => setState(() => _loadRecommendations(refresh: true)),
                      icon: const Icon(Icons.refresh),
                      label: const Text('재추천 받기'),
                    ),
                  ),
                ),
                if (data.source == 'product_catalog')
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(24, 12, 24, 0),
                      child: Text(
                        '수집된 실제 상품을 프로필에 맞춰 추천합니다. 가격은 수집 당시 정보이며, 현재 가격·재고는 판매 페이지에서 확인해주세요.',
                        style: TextStyle(color: AppColors.muted, fontSize: 12),
                      ),
                    ),
                  ),
                if (sections.isEmpty)
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: _EmptyRecommendationState(),
                  )
                else
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(0, 18, 0, 28),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(
                        sections.map((section) {
                          return _CategorySection(section: section);
                        }).toList(),
                      ),
                    ),
                  ),
                if (data.shortages.isNotEmpty)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                      child: Text(
                        '${data.shortages.keys.join('·')} 상품이 부족해 카테고리별 7개를 모두 제공하지 못했어요.',
                        style: const TextStyle(color: AppColors.muted, fontSize: 12),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Map<String, List<OutfitItem>> _groupItems(List<OutfitItem> items) {
    final groups = <String, List<OutfitItem>>{
      '상의': [],
      '하의': [],
      '원피스': [],
      '아우터': [],
    };

    for (final item in items) {
      if (!groups.containsKey(item.itemType)) {
        continue;
      }
      if (!_matchesSelectedGender(item)) {
        continue;
      }
      if (_isMale && item.itemType == '원피스') {
        continue;
      }
      groups[item.itemType]!.add(item);
    }

    return groups;
  }

  List<_OutfitSectionData> _visibleSections(
    Map<String, List<OutfitItem>> groups,
  ) {
    final sections = [
      if (!_isMale)
        _OutfitSectionData(
            itemType: '원피스',
            icon: Icons.checkroom_outlined,
            helper: '하나만으로 완성되는 원피스 코디예요.',
            items: groups['원피스']!),
      _OutfitSectionData(
        itemType: '상의',
        icon: Icons.checkroom_outlined,
        helper: '어울리는 상의를 둘러보고 마음에 드는 상품을 찜해보세요.',
        items: groups['상의']!,
      ),
      _OutfitSectionData(
        itemType: '하의',
        icon: Icons.dry_cleaning_outlined,
        helper: '상황과 무드에 맞는 하의를 추천해드려요.',
        items: groups['하의']!,
      ),
      _OutfitSectionData(
        itemType: '아우터',
        icon: Icons.style_outlined,
        helper: '날씨나 상황에 따라 아우터를 추가해보세요.',
        items: groups['아우터']!,
        optional: true,
      ),
    ];

    return sections;
  }

  bool _matchesSelectedGender(OutfitItem item) {
    final text = [
      item.title,
      item.category,
      item.itemType,
    ].join(' ').toLowerCase();

    if (text.contains('남녀공용') ||
        text.contains('공용') ||
        text.contains('유니섹스') ||
        text.contains('unisex')) {
      return true;
    }

    if (_isMale) {
      return !RegExp(r'여성|여자|여아|우먼|레이디|레이디스|\bwoman\b|\bwomen\b')
          .hasMatch(text);
    }

    return !RegExp(r'남성|남자|남아|맨즈|\bman\b|\bmen\b').hasMatch(text);
  }
}

class _RecommendationHeader extends StatelessWidget {
  final String situation;
  final String style;
  final PersonalColorProfile? personalColorProfile;
  final SkeletonProfile? skeletonProfile;

  const _RecommendationHeader({
    required this.situation,
    required this.style,
    required this.personalColorProfile,
    required this.skeletonProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 8, 18, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.zero,
                alignment: Alignment.centerLeft,
                icon: const Icon(Icons.arrow_back_ios_new, size: 20),
                color: AppColors.ink,
                onPressed: () => Navigator.pop(context),
              ),
              const Expanded(
                child: Text(
                  '추천 코디',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.ink,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(width: 48),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            '나에게 어울리는 추천 아이템을 골라봤어요.',
            style: TextStyle(
              color: AppColors.ink,
              fontSize: 14,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            '상품을 누르면 쇼핑몰로 이동하고, 하트를 누르면 찜목록에 저장돼요.',
            style: TextStyle(
              color: AppColors.muted,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: _SelectionInfoCard(
                  icon: Icons.event_available_outlined,
                  label: '선택한 상황',
                  value: situation,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _SelectionInfoCard(
                  icon: Icons.favorite_border,
                  label: '선택한 무드',
                  value: style,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SelectionInfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _SelectionInfoCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.line),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0a000000),
            blurRadius: 12,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: AppColors.selectedBackground,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Icon(icon, color: AppColors.main, size: 17),
          ),
          const SizedBox(width: 9),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.muted,
                    fontSize: 9,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.ink,
                    fontSize: 13,
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

class _EmptyRecommendationState extends StatelessWidget {
  const _EmptyRecommendationState();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(28),
        child: Text(
          '이 조건에 맞는 상품을 찾지 못했어요.\n다른 무드나 상황으로 다시 추천받아보세요.',
          textAlign: TextAlign.center,
          style: TextStyle(
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

class _CategorySection extends StatelessWidget {
  final _OutfitSectionData section;

  const _CategorySection({
    required this.section,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(section.icon, color: AppColors.main, size: 18),
                const SizedBox(width: 7),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        section.optional
                            ? '${section.itemType} (선택)'
                            : section.itemType,
                        style: const TextStyle(
                          color: AppColors.ink,
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        section.helper,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.muted,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 11),
          if (section.items.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
              child: Text('현재 추천할 수 있는 유효한 상품이 없어요.',
                  style: TextStyle(color: AppColors.muted, fontSize: 12)),
            )
          else
          SizedBox(
            height: 174,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              scrollDirection: Axis.horizontal,
              itemCount: section.items.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                final item = section.items[index];
                return _OutfitPickCard(item: item);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _OutfitPickCard extends StatelessWidget {
  final OutfitItem item;

  const _OutfitPickCard({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final uri = Uri.tryParse(item.link);
        if (uri == null) return;
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        width: 104,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.line),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0d000000),
              blurRadius: 12,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: OutfitImage(
                    value: item.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 9),
                  child: Column(
                    children: [
                      Text(
                        item.title.isNotEmpty
                            ? item.title
                            : item.category.isEmpty
                                ? item.itemType
                                : item.category,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.ink,
                          fontSize: 11,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _ColorDot(item.color),
                          if (item.subColor.isNotEmpty) ...[
                            const SizedBox(width: 5),
                            _ColorDot(item.subColor),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 7,
              right: 7,
              child: _FavoriteButton(item: item),
            ),
          ],
        ),
      ),
    );
  }
}

class _ColorDot extends StatelessWidget {
  final String colorName;

  const _ColorDot(this.colorName);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: _colorFromName(colorName),
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0x22000000)),
      ),
    );
  }

  Color _colorFromName(String name) {
    if (name.contains('블랙')) return const Color(0xff1e1e1e);
    if (name.contains('화이트')) return const Color(0xfff4f1e8);
    if (name.contains('아이보리')) return const Color(0xffede4d4);
    if (name.contains('베이지')) return const Color(0xffd8c4a2);
    if (name.contains('브라운')) return const Color(0xff6f4e37);
    if (name.contains('그레이')) return const Color(0xff9a9a9a);
    if (name.contains('블루') || name.contains('스카이')) {
      return const Color(0xff88aeca);
    }
    if (name.contains('핑크')) return const Color(0xffe7b5b7);
    if (name.contains('레드')) return const Color(0xffb6524b);
    if (name.contains('그린') || name.contains('카키')) {
      return const Color(0xff7d8c5f);
    }
    if (name.contains('옐로')) return const Color(0xffd4b75f);
    if (name.contains('퍼플')) return const Color(0xff9a7bb2);
    return const Color(0xffd8d1c3);
  }
}

class _FavoriteButton extends StatelessWidget {
  final OutfitItem item;

  const _FavoriteButton({required this.item});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: StyleClosetStore.revision,
      builder: (context, _, __) {
        final liked = StyleClosetStore.isLiked(item.imageId);
        return GestureDetector(
          onTap: () => StyleClosetStore.toggleLiked(item),
          child: Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.92),
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.line),
            ),
            child: Icon(
              liked ? Icons.favorite : Icons.favorite_border,
              color: liked ? AppColors.liked : AppColors.ink,
              size: 14,
            ),
          ),
        );
      },
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: AppColors.main),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorView({
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: AppColors.main, size: 34),
          const SizedBox(height: 18),
          const Text(
            '추천 데이터를 불러오지 못했어요.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.ink,
              fontSize: 17,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            message,
            textAlign: TextAlign.center,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.muted,
              fontSize: 12,
              height: 1.45,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onRetry,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.ink,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('다시 시도'),
          ),
        ],
      ),
    );
  }
}

class _OutfitSectionData {
  final String itemType;
  final IconData icon;
  final String helper;
  final List<OutfitItem> items;
  final bool optional;

  const _OutfitSectionData({
    required this.itemType,
    required this.icon,
    required this.helper,
    required this.items,
    this.optional = false,
  });
}
