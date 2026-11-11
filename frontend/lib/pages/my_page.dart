import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/style_profile.dart';
import '../services/auth_store.dart';
import '../theme/app_colors.dart';
import '../widgets/personal_color_result_sheet.dart';
import '../widgets/skeleton_result_guide.dart';

class MyPage extends StatefulWidget {
  final String gender;
  final PersonalColorProfile? personalColorProfile;
  final SkeletonProfile? skeletonProfile;
  const MyPage(
      {super.key,
      this.gender = 'female',
      this.personalColorProfile,
      this.skeletonProfile});
  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  String _name = '나의 프로필';
  String? _photo, _key;
  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final identity = await AuthStore.profileIdentity();
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    setState(() {
      _key = 'avata_profile_${identity.$1}';
      _name = prefs.getString('${_key}_name') ?? identity.$2;
      _photo = prefs.getString('${_key}_photo');
    });
  }

  Future<void> _edit() async {
    if (_key == null) return;
    final name = TextEditingController(text: _name);
    final saved = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
                title: const Text('닉네임 수정'),
                content: Column(mainAxisSize: MainAxisSize.min, children: [
                  TextField(
                      controller: name,
                      maxLength: 20,
                      decoration: const InputDecoration(labelText: '닉네임')),
                ]),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('취소')),
                  TextButton(
                      onPressed: () {
                        if (name.text.trim().isNotEmpty)
                          Navigator.pop(context, true);
                      },
                      child: const Text('저장'))
                ]));
    final nextName = name.text.trim();
    await Future<void>.delayed(const Duration(milliseconds: 250));
    name.dispose();
    if (saved != true || !mounted) return;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('${_key}_name', nextName);
      if (mounted)
        setState(() {
          _name = nextName;
        });
    } catch (_) {
      _error('프로필을 저장하지 못했어요.');
    }
  }

  Future<void> _pickPhoto() async {
    if (_key == null) return;
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          maxWidth: 360,
          maxHeight: 360,
          imageQuality: 80);
      if (image == null) return;
      final encoded = base64Encode(await image.readAsBytes());
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('${_key}_photo', encoded);
      if (mounted) setState(() => _photo = encoded);
    } catch (_) {
      _error('사진을 저장하지 못했어요.');
    }
  }

  void _error(String text) {
    if (mounted)
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  Color _hex(String value) {
    final hex = value.replaceFirst('#', '');
    return hex.length == 6
        ? Color(int.tryParse('ff$hex', radix: 16) ?? 0xffb7d1f8)
        : AppColors.point;
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.personalColorProfile,
        skeleton = widget.skeletonProfile;
    final ct = color?.type.toLowerCase() ?? '';
    final season = ct.contains('spring')
        ? 'Spring Warm'
        : ct.contains('summer')
            ? 'Summer Cool'
            : ct.contains('autumn') || ct.contains('fall')
                ? 'Autumn Warm'
                : ct.contains('winter')
                    ? 'Winter Cool'
                    : '';
    final palette = color == null
        ? <Color>[]
        : color.bestHexColors.isNotEmpty
            ? color.bestHexColors.take(6).map(_hex).toList()
            : ct.contains('spring')
                ? const [
                    Color(0xffffd2b0),
                    Color(0xffffb9ac),
                    Color(0xffffdf9e),
                    Color(0xffc8dfae),
                    Color(0xffa9d9cf),
                    Color(0xffecd4b5)
                  ]
                : ct.contains('autumn') || ct.contains('fall')
                    ? const [
                        Color(0xffb87956),
                        Color(0xffc69a58),
                        Color(0xffa9ad7a),
                        Color(0xff8b6955),
                        Color(0xffa15e51),
                        Color(0xffd8bc93)
                      ]
                    : ct.contains('winter')
                        ? const [
                            Color(0xffa63762),
                            Color(0xff6353ad),
                            Color(0xff3652a1),
                            Color(0xff327a83),
                            Color(0xffd6d9e6),
                            Color(0xff323b58)
                          ]
                        : const [
                            Color(0xffe7c1da),
                            Color(0xffc6c0ee),
                            Color(0xffa4adf3),
                            Color(0xffadcafa),
                            Color(0xffafd8e4),
                            Color(0xffd1d0e8)
                          ];
    final type = skeleton?.type ?? '';
    final suffix = type == '웨이브'
        ? 'wave'
        : type == '스트레이트'
            ? 'straight'
            : 'natural';
    final english = type == '웨이브'
        ? 'Wave'
        : type == '스트레이트'
            ? 'Straight'
            : 'Natural';
    final description = type == '웨이브'
        ? '부드럽고 곡선감 있는 실루엣이 특징이에요.\n허리 라인을 살리는 스타일이 잘 어울려요.'
        : type == '스트레이트'
            ? '탄탄하고 균형 잡힌 실루엣이 특징이에요.\n깔끔한 정핏과 일자 라인이 잘 어울려요.'
            : '골격과 관절의 프레임이 드러나는 유형이에요.\n여유 있는 핏과 자연스러운 소재가 잘 어울려요.';
    final tags = type == '웨이브'
        ? ['곡선 실루엣', '허리 강조', '부드러운 소재']
        : type == '스트레이트'
            ? ['깔끔한 정핏', '일자 라인', '탄탄한 소재']
            : ['여유 있는 핏', '레이어드', '자연스러운 소재'];
    final prefix = widget.gender == 'male' ? 'male' : 'female';
    return Center(
        child: SizedBox(
            width: 600,
            child: SafeArea(
                child: Column(children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 12, 4),
                  child: Row(children: [
                    const SizedBox(width: 44),
                    const Expanded(
                        child: Text('마이페이지',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w900,
                                color: AppColors.ink))),
                    const SizedBox(width: 44),
                  ])),
              Expanded(
                  child: ListView(
                      padding: const EdgeInsets.fromLTRB(16, 22, 16, 28),
                      children: [
                    Row(children: [
                      Semantics(
                          button: true,
                          label: '프로필 사진 변경',
                          child: Tooltip(
                              message: '프로필 사진 변경',
                              child: GestureDetector(
                                onTap: _pickPhoto,
                                child: CircleAvatar(
                                    radius: 44,
                                    backgroundColor: const Color(0xffedf3fe),
                                    backgroundImage: _photo == null
                                        ? null
                                        : MemoryImage(base64Decode(_photo!)),
                                    child: _photo == null
                                        ? const Icon(Icons.person_rounded,
                                            color: Color(0xffc2d5f3), size: 68)
                                        : null),
                              ))),
                      const SizedBox(width: 14),
                      Expanded(
                          child: Row(mainAxisSize: MainAxisSize.min, children: [
                        Flexible(
                            child: Text(_name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w900,
                                    color: AppColors.ink))),
                        IconButton(
                            tooltip: '닉네임 수정',
                            onPressed: _edit,
                            icon: const Icon(Icons.edit_outlined,
                                size: 19, color: AppColors.main)),
                      ]))
                    ]),
                    const SizedBox(height: 26),
                    _DiagnosisCard(
                        title: '퍼스널 컬러',
                        icon: Icons.palette_outlined,
                        onResult: color == null
                            ? null
                            : () =>
                                showPersonalColorResultSheet(context, color),
                        child: color == null
                            ? const _MissingDiagnosis(
                                '퍼스널 컬러 진단 후 나만의 컬러를 확인해보세요.')
                            : Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Container(
                                        width: 82,
                                        height: 110,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  palette.first,
                                                  Colors.white,
                                                  palette.first,
                                                  palette.last
                                                ],
                                                stops: const [
                                                  0,
                                                  .37,
                                                  .52,
                                                  1
                                                ]))),
                                    const SizedBox(width: 14),
                                    Expanded(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                          Wrap(
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.center,
                                              spacing: 6,
                                              runSpacing: 5,
                                              children: [
                                                Text(color.label,
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        color: AppColors.ink)),
                                                if (season.isNotEmpty)
                                                  _Badge(season)
                                              ]),
                                          const SizedBox(height: 9),
                                          Text(color.summary,
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontSize: 11,
                                                  height: 1.6,
                                                  color: AppColors.ink)),
                                          const SizedBox(height: 12),
                                          _Swatches(colors: palette)
                                        ]))
                                  ])),
                    const SizedBox(height: 18),
                    _DiagnosisCard(
                        title: '골격 유형',
                        icon: Icons.accessibility_new_outlined,
                        onResult: skeleton == null
                            ? null
                            : () => _details('골격 진단 결과', [
                                  Text('$type형',
                                      style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w900)),
                                  const SizedBox(height: 16),
                                  Image.asset(
                                      'assets/skeleton/results/${prefix}_${suffix}_info.png',
                                      fit: BoxFit.contain),
                                  const SizedBox(height: 14),
                                  Text(description,
                                      style: const TextStyle(height: 1.6)),
                                  const SizedBox(height: 18),
                                  SkeletonResultGuide(
                                      type: type, gender: widget.gender),
                                ]),
                        child: skeleton == null
                            ? const _MissingDiagnosis(
                                '골격 진단 후 나에게 어울리는 핏을 확인해보세요.')
                            : Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Container(
                                        width: 82,
                                        height: 122,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                            color: AppColors.canvas,
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: Image.asset(
                                            'assets/skeleton/results/${prefix}_$suffix.png',
                                            fit: BoxFit.cover,
                                            alignment:
                                                const Alignment(0, -0.4))),
                                    const SizedBox(width: 14),
                                    Expanded(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                          Wrap(
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.center,
                                              spacing: 6,
                                              children: [
                                                Text(type,
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        color: AppColors.ink)),
                                                _Badge('($english)')
                                              ]),
                                          const SizedBox(height: 10),
                                          Text(description,
                                              style: const TextStyle(
                                                  fontSize: 11,
                                                  height: 1.6,
                                                  color: AppColors.ink)),
                                          const SizedBox(height: 12),
                                          Wrap(
                                              spacing: 5,
                                              runSpacing: 6,
                                              children: tags
                                                  .map((tag) => Container(
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                              horizontal: 7,
                                                              vertical: 4),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          border: Border.all(
                                                              color: AppColors
                                                                  .line)),
                                                      child: Text('#$tag',
                                                          style: const TextStyle(
                                                              color: AppColors
                                                                  .muted,
                                                              fontSize: 9))))
                                                  .toList())
                                        ]))
                                  ])),
                  ]))
            ]))));
  }

  void _details(String title, List<Widget> children) =>
      showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          showDragHandle: true,
          backgroundColor: Colors.white,
          builder: (context) => SafeArea(
              child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * .8,
                  child: Column(children: [
                    Row(children: [
                      const SizedBox(width: 20),
                      Expanded(
                          child: Text(title,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w800))),
                      IconButton(
                          tooltip: '닫기',
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.close))
                    ]),
                    Expanded(
                        child: ListView(
                            padding: const EdgeInsets.all(22),
                            children: children))
                  ]))));
}

class _DiagnosisCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onResult;
  final Widget child;
  const _DiagnosisCard(
      {required this.title,
      required this.icon,
      required this.child,
      this.onResult});
  @override
  Widget build(BuildContext context) => Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(17),
          border: Border.all(color: AppColors.line),
          boxShadow: const [
            BoxShadow(
                color: Color(0x06a0b7dc), blurRadius: 14, offset: Offset(0, 5))
          ]),
      child: Column(children: [
        Container(
            color: const Color(0xfff7f9fe),
            padding: const EdgeInsets.fromLTRB(15, 4, 6, 4),
            child: Row(children: [
              Icon(icon, color: const Color(0xff4265c7), size: 23),
              const SizedBox(width: 10),
              Expanded(
                  child: Text(title,
                      style: const TextStyle(
                          color: AppColors.ink,
                          fontWeight: FontWeight.w800,
                          fontSize: 14))),
              TextButton(
                  onPressed: onResult,
                  child: const Row(mainAxisSize: MainAxisSize.min, children: [
                    Text('진단 결과', style: TextStyle(fontSize: 11)),
                    Icon(Icons.chevron_right, size: 17)
                  ]))
            ])),
        Padding(padding: const EdgeInsets.all(15), child: child)
      ]));
}

class _Badge extends StatelessWidget {
  final String text;
  const _Badge(this.text);
  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
          color: const Color(0xffe7efff),
          borderRadius: BorderRadius.circular(20)),
      child: Text(text,
          style: const TextStyle(fontSize: 9, color: Color(0xff3359b7))));
}

class _Swatches extends StatelessWidget {
  final List<Color> colors;
  const _Swatches({required this.colors});
  @override
  Widget build(BuildContext context) => Wrap(
      spacing: 6,
      runSpacing: 6,
      children: colors
          .map((color) => SizedBox(
              width: 26,
              height: 26,
              child: DecoratedBox(
                  decoration:
                      BoxDecoration(color: color, shape: BoxShape.circle))))
          .toList());
}

class _MissingDiagnosis extends StatelessWidget {
  final String text;
  const _MissingDiagnosis(this.text);
  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(text,
          style: const TextStyle(
              color: AppColors.muted, fontSize: 13, height: 1.6)));
}
