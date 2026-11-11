import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/style_profile.dart';
import '../services/outfit_recommendation_service.dart';
import '../services/style_closet_store.dart';
import '../theme/app_colors.dart';
import '../widgets/avatar_memory_image.dart';
import '../widgets/bottom_nav.dart';
import 'closet_placeholder_page.dart';
import 'fitting_flow_page.dart';
import 'home_page.dart';
import 'mood_entry_page.dart';
import 'my_page.dart';

class AvatarHomePage extends StatefulWidget {
  final String gender;
  final String avatarImageData;
  final PersonalColorProfile? personalColorProfile;
  final SkeletonProfile? skeletonProfile;

  const AvatarHomePage({
    super.key,
    required this.gender,
    required this.avatarImageData,
    this.personalColorProfile,
    this.skeletonProfile,
  });

  @override
  State<AvatarHomePage> createState() => _AvatarHomePageState();
}

class _AvatarHomePageState extends State<AvatarHomePage> {
  int _currentIndex = 0;
  int _moodEntryKey = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomePage(
        personalColorProfile: widget.personalColorProfile,
        skeletonProfile: widget.skeletonProfile,
      ),
      MoodEntryPage(
        key: ValueKey(_moodEntryKey),
        gender: widget.gender,
        avatarImageData: widget.avatarImageData,
        personalColorProfile: widget.personalColorProfile,
        skeletonProfile: widget.skeletonProfile,
        onExit: () => setState(() => _currentIndex = 0),
      ),
      _AvatarView(
          gender: widget.gender,
          personalColorProfile: widget.personalColorProfile,
          skeletonProfile: widget.skeletonProfile,
          avatarImageData: widget.avatarImageData,
          onBack: () => setState(() => _currentIndex = 0)),
      const ClosetPlaceholderPage(),
      MyPage(
          gender: widget.gender,
          personalColorProfile: widget.personalColorProfile,
          skeletonProfile: widget.skeletonProfile),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: AvataBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            if (index == 1) _moodEntryKey++;
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class _AvatarView extends StatefulWidget {
  final String gender;
  final PersonalColorProfile? personalColorProfile;
  final SkeletonProfile? skeletonProfile;
  final String avatarImageData;
  final VoidCallback onBack;

  const _AvatarView(
      {required this.avatarImageData,
      required this.onBack,
      required this.gender,
      this.personalColorProfile,
      this.skeletonProfile});

  @override
  State<_AvatarView> createState() => _AvatarViewState();
}

class _AvatarViewState extends State<_AvatarView> {
  int _selectedCollection = 0;

  @override
  void initState() {
    super.initState();
    StyleClosetStore.revision.addListener(_refreshCollections);
  }

  void _refreshCollections() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    StyleClosetStore.revision.removeListener(_refreshCollections);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(builder: (context, constraints) {
        final compact = constraints.maxHeight < 720;
        final recent = _selectedCollection == 0;
        final records =
            recent ? StyleClosetStore.fittingRecords : const <FittingRecord>[];
        final savedLooks = recent
            ? const <SavedClosetLook>[]
            : StyleClosetStore.savedClosetLooks;
        return Container(
          color: const Color(0xfffbfcff),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 3, 12, 12),
              child: Row(children: [
                IconButton(
                    onPressed: widget.onBack,
                    icon:
                        const Icon(Icons.arrow_back_ios_new_rounded, size: 19)),
                const Expanded(
                    child: Text('내 아바타',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.ink,
                            fontSize: 15,
                            fontWeight: FontWeight.w900))),
                const SizedBox(width: 48),
              ]),
            ),
            Expanded(
                child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: compact ? 278 : 340,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                  flex: 6,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                        color: const Color(0xfff0f5fd),
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 10, 8, 0),
                                        child: AvatarMemoryImage(
                                            imageData: widget.avatarImageData)),
                                  )),
                              const SizedBox(width: 12),
                              Expanded(
                                  flex: 4,
                                  child: Column(children: [
                                    Expanded(
                                        child: _AvatarActionCard(
                                            icon: Icons.checkroom_outlined,
                                            title: '피팅룸',
                                            subtitle: '옷을 입혀보고\n코디해보세요.',
                                            onTap: () => _openAction(
                                                _AvatarQuickAction
                                                    .fittingRoom))),
                                    const SizedBox(height: 12),
                                    Expanded(
                                        child: _AvatarActionCard(
                                            icon: Icons.favorite_border_rounded,
                                            title: '위시리스트',
                                            subtitle: '저장한 아이템과\n코디를 모아보세요.',
                                            onTap: () => _openAction(
                                                _AvatarQuickAction.wishlist))),
                                  ])),
                            ])),
                    const SizedBox(height: 18),
                    Row(children: [
                      Expanded(
                          child: _CollectionTab(
                              label: '최근 착용',
                              selected: _selectedCollection == 0,
                              onTap: () =>
                                  setState(() => _selectedCollection = 0))),
                      Expanded(
                        child: _CollectionTab(
                            label: '저장한 코디',
                            selected: _selectedCollection == 1,
                            onTap: () =>
                                setState(() => _selectedCollection = 1)),
                      ),
                    ]),
                    const SizedBox(height: 12),
                    if (recent && records.isNotEmpty)
                      SizedBox(
                          height: 202,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: records.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(width: 10),
                              itemBuilder: (context, index) =>
                                  _RecentFitCard(record: records[index])))
                    else if (!recent && savedLooks.isNotEmpty)
                      SizedBox(
                          height: 202,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: savedLooks.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(width: 10),
                              itemBuilder: (context, index) => _SavedLookCard(
                                  look: savedLooks[index],
                                  onTap: () => showSavedLookFittingSheet(
                                      context,
                                      look: savedLooks[index],
                                      avatarImageData:
                                          widget.avatarImageData))))
                    else
                      _CollectionEmptyState(
                          label: recent
                              ? '피팅한 코디가 여기에 모여요.'
                              : '마음에 드는 아이템을 저장해보세요.'),
                  ]),
            )),
          ]),
        );
      }),
    );
  }

  void _openAction(_AvatarQuickAction action) {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => action.page(widget.avatarImageData)));
  }
}

class _AvatarActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  const _AvatarActionCard(
      {required this.icon,
      required this.title,
      required this.subtitle,
      required this.onTap});
  @override
  Widget build(BuildContext context) => Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(17),
      child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(17),
          child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  border: Border.all(color: const Color(0xffe8eef8)),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0x080c2856),
                        blurRadius: 12,
                        offset: Offset(0, 4))
                  ]),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, color: AppColors.main, size: 28),
                    const SizedBox(height: 10),
                    Row(children: [
                      Expanded(
                          child: Text(title,
                              style: const TextStyle(
                                  color: AppColors.ink,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900))),
                      const Icon(Icons.chevron_right_rounded,
                          color: AppColors.muted)
                    ]),
                    const SizedBox(height: 5),
                    Text(subtitle,
                        style: const TextStyle(
                            color: AppColors.muted,
                            fontSize: 11,
                            height: 1.45,
                            fontWeight: FontWeight.w600))
                  ]))));
}

class _CollectionTab extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _CollectionTab(
      {required this.label, required this.selected, required this.onTap});
  @override
  Widget build(BuildContext context) => InkWell(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.only(bottom: 9),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color:
                          selected ? AppColors.main : const Color(0xffe8edf5),
                      width: selected ? 2 : 1))),
          child: Text(label,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: selected ? AppColors.ink : AppColors.muted,
                  fontSize: 12,
                  fontWeight: FontWeight.w800))));
}

class _CollectionEmptyState extends StatelessWidget {
  final String label;
  const _CollectionEmptyState({required this.label});
  @override
  Widget build(BuildContext context) => Container(
      height: 145,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xffedf1f7))),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Icon(Icons.checkroom_outlined,
            color: Color(0xffb7d1f8), size: 30),
        const SizedBox(height: 8),
        Text(label,
            style: const TextStyle(
                color: AppColors.muted,
                fontSize: 12,
                fontWeight: FontWeight.w600))
      ]));
}

class _RecentFitCard extends StatelessWidget {
  final FittingRecord record;
  const _RecentFitCard({required this.record});
  @override
  Widget build(BuildContext context) => Container(
      width: 138,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color(0xffedf1f7))),
      child: Column(children: [
        Expanded(child: AvatarMemoryImage(imageData: record.avatarImageData)),
        Padding(
            padding: const EdgeInsets.all(9),
            child: Text('${record.createdAt.month}.${record.createdAt.day} 피팅',
                style: const TextStyle(
                    color: AppColors.ink,
                    fontSize: 11,
                    fontWeight: FontWeight.w800)))
      ]));
}

class _SavedLookCard extends StatelessWidget {
  final SavedClosetLook look;
  final VoidCallback onTap;
  const _SavedLookCard({required this.look, required this.onTap});
  @override
  Widget build(BuildContext context) => Semantics(
      button: true,
      label: '${look.title} 코디 보기',
      child: GestureDetector(
          onTap: onTap,
          child: Container(
              width: 138,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: const Color(0xffedf1f7))),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _SavedLookPreview(items: look.items)),
                    Padding(
                        padding: const EdgeInsets.all(9),
                        child: Text(look.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: AppColors.ink,
                                fontSize: 11,
                                fontWeight: FontWeight.w800)))
                  ]))));
}

class _SavedLookPreview extends StatelessWidget {
  final List<OutfitItem> items;
  const _SavedLookPreview({required this.items});

  @override
  Widget build(BuildContext context) {
    const places = [
      Rect.fromLTWH(.04, .08, .48, .54),
      Rect.fromLTWH(.52, .03, .41, .43),
      Rect.fromLTWH(.18, .49, .47, .46),
      Rect.fromLTWH(.60, .48, .35, .46),
    ];
    return LayoutBuilder(
        builder: (context, size) => ColoredBox(
              color: const Color(0xfff8faff),
              child: Stack(children: [
                for (var index = 0;
                    index < items.length && index < places.length;
                    index++)
                  Positioned(
                    left: size.maxWidth * places[index].left,
                    top: size.maxHeight * places[index].top,
                    width: size.maxWidth * places[index].width,
                    height: size.maxHeight * places[index].height,
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: _savedItemImage(items[index].imageUrl),
                    ),
                  ),
              ]),
            ));
  }

  Widget _savedItemImage(String value) {
    if (value.startsWith('data:')) {
      return Image.memory(base64Decode(value.split(',').last),
          fit: BoxFit.contain);
    }
    if (value.startsWith('http://') || value.startsWith('https://')) {
      return Image.network(value, fit: BoxFit.contain);
    }
    return const Center(
        child: Icon(Icons.checkroom_outlined, color: AppColors.main));
  }
}

class _BookmarkActionRail extends StatelessWidget {
  final String avatarImageData;
  final _AvatarQuickAction? expandedAction;
  final ValueChanged<_AvatarQuickAction> onActionTap;

  const _BookmarkActionRail({
    required this.avatarImageData,
    required this.expandedAction,
    required this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 154,
      height: 224,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            width: 52,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.88),
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(20),
                ),
                border: Border.all(color: Colors.white),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x12000000),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _AvatarQuickAction.values.map((action) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: _BookmarkActionTab(
                    action: action,
                    expanded: expandedAction == action,
                    onTap: () => onActionTap(action),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _BookmarkActionTab extends StatelessWidget {
  final _AvatarQuickAction action;
  final bool expanded;
  final VoidCallback onTap;

  const _BookmarkActionTab({
    required this.action,
    required this.expanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 240),
        curve: Curves.easeOutCubic,
        width: expanded ? 154 : 52,
        height: expanded ? 48 : 44,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: expanded ? Colors.white : Colors.transparent,
          borderRadius: const BorderRadius.horizontal(
            right: Radius.circular(18),
          ),
          boxShadow: expanded
              ? const [
                  BoxShadow(
                    color: Color(0x16000000),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ]
              : const [],
        ),
        child: Row(
          children: [
            SizedBox(
              width: 52,
              child: Icon(action.icon, color: AppColors.main, size: 19),
            ),
            if (expanded)
              Expanded(
                child: Text(
                  action.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.ink,
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            if (expanded) const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}

enum _AvatarQuickAction {
  fittingRoom(Icons.meeting_room_outlined, '피팅룸'),
  wardrobe(Icons.checkroom_outlined, '내옷장'),
  wishlist(Icons.favorite_border, '찜목록'),
  history(Icons.history, '피팅기록');

  final IconData icon;
  final String label;

  const _AvatarQuickAction(this.icon, this.label);

  Widget page(String avatarImageData) {
    switch (this) {
      case _AvatarQuickAction.fittingRoom:
        return FittingRoomPage(avatarImageData: avatarImageData);
      case _AvatarQuickAction.wardrobe:
        return const WardrobePage();
      case _AvatarQuickAction.wishlist:
        return const WishlistPage();
      case _AvatarQuickAction.history:
        return const FittingHistoryPage();
    }
  }
}

class _FittingRoomBackground extends StatelessWidget {
  const _FittingRoomBackground();

  @override
  Widget build(BuildContext context) {
    return const CustomPaint(
      painter: _FittingRoomPainter(),
      child: SizedBox.expand(),
    );
  }
}

class _FittingRoomPainter extends CustomPainter {
  const _FittingRoomPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..isAntiAlias = true;

    paint.shader = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xfffbfaf7),
        Color(0xfff1f0eb),
      ],
    ).createShader(Offset.zero & size);
    canvas.drawRect(Offset.zero & size, paint);
    paint.shader = null;

    paint.color = const Color(0xffdedbd2);
    paint.strokeWidth = 1;
    canvas.drawLine(
      Offset(0, size.height * 0.76),
      Offset(size.width, size.height * 0.76),
      paint,
    );

    paint.color = const Color(0x55d7d2c8);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width * 0.08,
          size.height * 0.08,
          size.width * 0.84,
          size.height * 0.66,
        ),
        const Radius.circular(22),
      ),
      paint,
    );

    paint
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4
      ..color = const Color(0xffd8d5cc);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width * 0.12,
          size.height * 0.1,
          size.width * 0.76,
          size.height * 0.62,
        ),
        const Radius.circular(18),
      ),
      paint,
    );

    paint
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..color = const Color(0xffc9c5ba);
    final railY = size.height * 0.18;
    canvas.drawLine(
      Offset(size.width * 0.18, railY),
      Offset(size.width * 0.82, railY),
      paint,
    );

    paint
      ..style = PaintingStyle.fill
      ..color = const Color(0xffeeeae1);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.16, size.height * 0.2, 34, 88),
        const Radius.circular(10),
      ),
      paint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.73, size.height * 0.21, 32, 82),
        const Radius.circular(10),
      ),
      paint,
    );

    paint.color = const Color(0xffddd7ca);
    canvas.drawCircle(Offset(size.width * 0.23, railY), 4, paint);
    canvas.drawCircle(Offset(size.width * 0.77, railY), 4, paint);

    paint
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2
      ..color = const Color(0xffd2cec4);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width * 0.67,
          size.height * 0.36,
          size.width * 0.18,
          size.height * 0.28,
        ),
        const Radius.circular(16),
      ),
      paint,
    );

    paint
      ..style = PaintingStyle.fill
      ..color = const Color(0x35ffffff);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width * 0.69,
          size.height * 0.38,
          size.width * 0.14,
          size.height * 0.24,
        ),
        const Radius.circular(14),
      ),
      paint,
    );

    paint
      ..style = PaintingStyle.fill
      ..color = const Color(0xffe6e1d8);
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.82),
        width: size.width * 0.62,
        height: size.height * 0.06,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
