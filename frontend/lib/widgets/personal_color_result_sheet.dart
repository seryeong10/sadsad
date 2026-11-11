import 'package:flutter/material.dart';
import '../models/style_profile.dart';
import '../theme/app_colors.dart';

Future<void> showPersonalColorResultSheet(
        BuildContext context, PersonalColorProfile profile) =>
    showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        showDragHandle: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        builder: (_) => _PersonalColorSheet(profile: profile));

class _SeasonGuide {
  final String english,
      description,
      goodLabel,
      avoidLabel,
      clothes,
      jewelry,
      material,
      tip;
  final List<Color> good, avoid;
  const _SeasonGuide(
      this.english,
      this.description,
      this.goodLabel,
      this.avoidLabel,
      this.good,
      this.avoid,
      this.clothes,
      this.jewelry,
      this.material,
      this.tip);
  static _SeasonGuide forType(String type) {
    final key = type.toLowerCase();
    if (key.contains('spring') || key.contains('봄'))
      return const _SeasonGuide(
          'Spring Warm',
          '맑고 따뜻한 색이 잘 어울리는\n생기 있고 화사한 이미지예요.',
          '맑고 화사한 웜톤 컬러',
          '탁하고 무거운 차가운 컬러',
          [
            Color(0xffffc6b0),
            Color(0xffffdf9b),
            Color(0xffffb8a7),
            Color(0xffb9dfb2),
            Color(0xffb6ded8)
          ],
          [
            Color(0xff686880),
            Color(0xff71616d),
            Color(0xff454659),
            Color(0xff5b6175),
            Color(0xff8c858d)
          ],
          '아이보리, 피치, 밝은 코랄 상의로\n생기 있는 인상을 연출해요.',
          '가벼운 골드, 로즈 골드처럼\n따뜻한 금속 컬러가 잘 어울려요.',
          '가볍고 매끈한 소재로\n산뜻하고 화사한 무드를 연출해요.',
          '맑은 웜톤 컬러와 가벼운 소재로\n생기 있는 분위기를 연출해보세요.');
    if (key.contains('autumn') || key.contains('fall') || key.contains('가을'))
      return const _SeasonGuide(
          'Autumn Warm',
          '깊고 부드러운 색이 잘 어울리는\n따뜻하고 차분한 이미지예요.',
          '깊이 있는 차분한 웜톤 컬러',
          '너무 차갑고 선명한 컬러',
          [
            Color(0xffc89669),
            Color(0xffb18154),
            Color(0xffa2a774),
            Color(0xffad6b51),
            Color(0xff806755)
          ],
          [
            Color(0xfff3a8d5),
            Color(0xffb4b5f8),
            Color(0xff8cddf2),
            Color(0xffd1ecf4),
            Color(0xffed8bb1)
          ],
          '카멜, 올리브, 테라코타 상의로\n깊이 있는 인상을 연출해요.',
          '앤티크 골드, 브론즈처럼\n차분한 금속 컬러가 잘 어울려요.',
          '스웨이드, 울, 코듀로이 소재로\n따뜻하고 편안한 무드를 연출해요.',
          '차분한 어스톤과 자연스러운 소재로\n깊이 있는 분위기를 연출해보세요.');
    if (key.contains('winter') || key.contains('겨울'))
      return const _SeasonGuide(
          'Winter Cool',
          '선명하고 대비감 있는 색이 어울리는\n또렷하고 시크한 이미지예요.',
          '또렷하고 선명한 쿨톤 컬러',
          '노랗고 탁한 따뜻한 컬러',
          [
            Color(0xff8b3264),
            Color(0xff5549a3),
            Color(0xff3157ad),
            Color(0xff367784),
            Color(0xff273148)
          ],
          [
            Color(0xffd9c08d),
            Color(0xffcf9e65),
            Color(0xffc38d73),
            Color(0xffa8a46b),
            Color(0xffcfa284)
          ],
          '화이트, 블랙, 선명한 블루로\n깔끔한 대비감을 연출해요.',
          '실버, 화이트 골드처럼\n선명하게 빛나는 금속이 잘 어울려요.',
          '탄탄하고 매끈한 소재로\n정돈되고 시크한 무드를 연출해요.',
          '선명한 쿨톤과 깔끔한 대비로\n또렷한 분위기를 연출해보세요.');
    return const _SeasonGuide(
        'Summer Cool',
        '맑고 부드러운 쿨한 색감이 잘 어울리는\n차분하고 시원한 이미지예요.',
        '맑고 부드러운 쿨톤 컬러',
        '노란기가 강한 따뜻한 컬러',
        [
          Color(0xffedc4eb),
          Color(0xffd2bff3),
          Color(0xffc1baf6),
          Color(0xffadd8fa),
          Color(0xffb5e6dc)
        ],
        [
          Color(0xfff2e6c1),
          Color(0xfff8df99),
          Color(0xfff2b69f),
          Color(0xffed9a6b),
          Color(0xffafad6e)
        ],
        '밝고 깨끗한 컬러의 상의로\n맑은 인상을 연출해요.',
        '실버, 화이트 골드처럼\n시원한 메탈이 잘 어울려요.',
        '가볍고 부드러운 소재로\n여리하고 차분한 무드를 연출해요.',
        '차분하고 시원한 파스텔, 쿨한 컬러로\n맑고 깨끗한 분위기를 연출해보세요.');
  }
}

class _PersonalColorSheet extends StatelessWidget {
  final PersonalColorProfile profile;
  const _PersonalColorSheet({required this.profile});
  @override
  Widget build(BuildContext context) {
    final guide = _SeasonGuide.forType(profile.type);
    final good = profile.bestHexColors
        .map((hex) => int.tryParse(hex.replaceFirst('#', ''), radix: 16))
        .whereType<int>()
        .map((hex) => Color(0xff000000 | hex))
        .take(5)
        .toList();
    for (final color in guide.good) {
      if (good.length < 5 && !good.contains(color)) good.add(color);
    }
    return SafeArea(
        top: false,
        child: SizedBox(
            height: MediaQuery.sizeOf(context).height * .94,
            child: Center(
                child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 620),
                    child: Column(children: [
                      const SizedBox(height: 14),
                      Container(
                          width: 36,
                          height: 5,
                          decoration: BoxDecoration(
                              color: AppColors.ink,
                              borderRadius: BorderRadius.circular(4))),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(24, 10, 12, 8),
                          child: Row(children: [
                            const Expanded(
                                child: Text('퍼스널 컬러 진단 결과',
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w900,
                                        color: AppColors.ink))),
                            IconButton(
                                tooltip: '닫기',
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(Icons.close,
                                    color: AppColors.ink))
                          ])),
                      Expanded(
                          child: SingleChildScrollView(
                              padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
                              child: Column(children: [
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              width: 98,
                                              height: 116,
                                              child: _FabricTile(colors: [
                                                guide.good[3],
                                                guide.good[1]
                                              ])),
                                          const SizedBox(width: 15),
                                          Expanded(
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                const _TipBadge('나의 퍼스널 컬러'),
                                                const SizedBox(height: 10),
                                                Wrap(
                                                    spacing: 7,
                                                    runSpacing: 5,
                                                    crossAxisAlignment:
                                                        WrapCrossAlignment
                                                            .center,
                                                    children: [
                                                      Text(profile.label,
                                                          style: const TextStyle(
                                                              fontSize: 24,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              color: AppColors
                                                                  .ink)),
                                                      _TipBadge(guide.english)
                                                    ]),
                                                const SizedBox(height: 10),
                                                Text(guide.description,
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        height: 1.55,
                                                        color: AppColors.ink))
                                              ]))
                                        ])),
                                const SizedBox(height: 16),
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: _ColorGuideCard(
                                              title: '잘 어울리는 컬러',
                                              caption: guide.goodLabel,
                                              colors: good,
                                              positive: true)),
                                      const SizedBox(width: 8),
                                      Expanded(
                                          child: _ColorGuideCard(
                                              title: '피하면 좋은 컬러',
                                              caption: guide.avoidLabel,
                                              colors: guide.avoid,
                                              positive: false))
                                    ]),
                                const SizedBox(height: 14),
                                _SoftPanel(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                      const Row(children: [
                                        Icon(Icons.checkroom_outlined,
                                            size: 22, color: Color(0xff5078db)),
                                        SizedBox(width: 9),
                                        Text('스타일링 팁',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w900,
                                                color: AppColors.ink))
                                      ]),
                                      const SizedBox(height: 14),
                                      _StyleTipRow(
                                          kind: 0,
                                          label: '아이템',
                                          text: guide.clothes,
                                          colors: guide.good),
                                      const Divider(
                                          color: AppColors.line, height: 14),
                                      _StyleTipRow(
                                          kind: 1,
                                          label: '액세서리',
                                          text: guide.jewelry,
                                          colors: guide.good,
                                          warm: guide.english.contains('Warm')),
                                      const Divider(
                                          color: AppColors.line, height: 14),
                                      _StyleTipRow(
                                          kind: 2,
                                          label: '소재',
                                          text: guide.material,
                                          colors: guide.good),
                                    ])),
                                const SizedBox(height: 14),
                                Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 14),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(32),
                                        gradient: const LinearGradient(colors: [
                                          Color(0xffedf3ff),
                                          Color(0xffe7efff)
                                        ])),
                                    child: Row(children: [
                                      const Icon(Icons.lightbulb_outline,
                                          color: Color(0xff5078db), size: 24),
                                      const SizedBox(width: 8),
                                      const Text('한 줄 팁!',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              color: Color(0xff3e65cd),
                                              fontSize: 14)),
                                      const SizedBox(width: 12),
                                      Container(
                                          height: 28,
                                          width: 1,
                                          color: AppColors.point),
                                      const SizedBox(width: 12),
                                      Expanded(
                                          child: Text(guide.tip,
                                              style: const TextStyle(
                                                  fontSize: 11,
                                                  height: 1.5,
                                                  color: AppColors.ink)))
                                    ])),
                              ]))),
                    ])))));
  }
}

class _SoftPanel extends StatelessWidget {
  final Widget child;
  const _SoftPanel({required this.child});
  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.line),
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xfff5f7fd), Colors.white])),
      child: child);
}

class _ColorGuideCard extends StatelessWidget {
  final String title, caption;
  final List<Color> colors;
  final bool positive;
  const _ColorGuideCard(
      {required this.title,
      required this.caption,
      required this.colors,
      required this.positive});
  @override
  Widget build(BuildContext context) => _SoftPanel(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CircleAvatar(
              radius: 10,
              backgroundColor:
                  positive ? const Color(0xff7ba2ff) : const Color(0xffee81a0),
              child: Icon(positive ? Icons.check : Icons.close,
                  size: 14, color: Colors.white)),
          const SizedBox(width: 7),
          Expanded(
              child: Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 12,
                      color: AppColors.ink)))
        ]),
        const SizedBox(height: 5),
        Text(caption,
            style: const TextStyle(
                fontSize: 10, color: AppColors.muted, height: 1.4)),
        const SizedBox(height: 12),
        Row(
            children: colors
                .map((color) => Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(right: 3),
                        child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                                color: color,
                                borderRadius: BorderRadius.circular(7))))))
                .toList()),
      ]));
}

class _TipBadge extends StatelessWidget {
  final String label;
  const _TipBadge(this.label);
  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
      decoration: BoxDecoration(
          color: const Color(0xffe5edff),
          borderRadius: BorderRadius.circular(20)),
      child: Text(label,
          style: const TextStyle(
              color: Color(0xff3e65cd),
              fontSize: 10,
              fontWeight: FontWeight.w700)));
}

class _FabricTile extends StatelessWidget {
  final List<Color> colors;
  const _FabricTile({required this.colors});
  @override
  Widget build(BuildContext context) => DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colors.first,
                Color.lerp(colors.first, Colors.white, .7)!,
                colors.last,
                Colors.white,
                colors.first
              ],
              stops: const [
                0,
                .24,
                .5,
                .59,
                1
              ])));
}

class _StyleTipRow extends StatelessWidget {
  final int kind;
  final String label, text;
  final List<Color> colors;
  final bool warm;
  const _StyleTipRow(
      {required this.kind,
      required this.label,
      required this.text,
      required this.colors,
      this.warm = false});
  @override
  Widget build(BuildContext context) => Row(children: [
        Container(
            width: 112,
            height: 58,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                color: const Color(0xffedf0f8),
                borderRadius: BorderRadius.circular(16)),
            child: kind == 2
              ? Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                    Expanded(
                        child: _FabricTile(colors: [colors[3], Colors.white])),
                    Expanded(
                        child: _FabricTile(colors: [colors[1], Colors.white]))
                  ])
                : CustomPaint(
                    painter: _StylePreviewPainter(
                        accessories: kind == 1, color: colors[3], warm: warm))),
        const SizedBox(width: 14),
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _TipBadge(label),
          const SizedBox(height: 4),
          Text(text,
              style: const TextStyle(
                  fontSize: 11, height: 1.45, color: AppColors.ink))
        ])),
      ]);
}

class _StylePreviewPainter extends CustomPainter {
  final bool accessories, warm;
  final Color color;
  const _StylePreviewPainter(
      {required this.accessories, required this.color, required this.warm});
  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.scale(size.width / 112, size.height / 58);
    if (accessories) {
      final pen = Paint()
        ..color = warm ? const Color(0xffbba16b) : const Color(0xff9da7b7)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;
      canvas.drawOval(const Rect.fromLTWH(17, 17, 13, 24), pen);
      canvas.drawOval(const Rect.fromLTWH(34, 17, 13, 24), pen);
      canvas.drawPath(
          Path()
            ..moveTo(65, 7)
            ..quadraticBezierTo(69, 30, 80, 45)
            ..quadraticBezierTo(91, 30, 98, 7),
          pen);
      canvas.drawCircle(const Offset(80, 45), 3, Paint()..color = pen.color);
    } else {
      for (var i = 0; i < 2; i++) {
        final dx = i * 39.0 + 13;
        final path = Path()
          ..moveTo(dx + 12, 6)
          ..lineTo(dx + 3, 10)
          ..lineTo(dx - 3, 31)
          ..lineTo(dx + 5, 34)
          ..lineTo(dx + 10, 20)
          ..lineTo(dx + 8, 55)
          ..lineTo(dx + 37, 55)
          ..lineTo(dx + 35, 20)
          ..lineTo(dx + 40, 34)
          ..lineTo(dx + 47, 31)
          ..lineTo(dx + 41, 10)
          ..lineTo(dx + 31, 6)
          ..lineTo(dx + 23, 13)
          ..close();
        canvas.drawPath(path, Paint()..color = i == 0 ? color : Colors.white);
        canvas.drawPath(
            path,
            Paint()
              ..color = const Color(0xffa8b8cd)
              ..style = PaintingStyle.stroke
              ..strokeWidth = .7);
        canvas.drawLine(
            Offset(dx + 23, 13),
            Offset(dx + 23, 55),
            Paint()
              ..color = const Color(0xffb9c7da)
              ..strokeWidth = .6);
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(_StylePreviewPainter old) =>
      old.color != color || old.warm != warm || old.accessories != accessories;
}
