import 'dart:convert';
import 'dart:ui' as ui;

import 'outfit_recommendation_service.dart';

/// Local illustrations, not products for sale or generated fitting results.
class DemoCatalog {
  static List<OutfitItem>? _items;

  static Future<List<OutfitItem>> load() async {
    if (_items != null) return _items!;
    final items = <OutfitItem>[];
    const entries = [
      ('라벤더 니트', '상의', '라벤더', 0xffb8a9c9),
      ('아이스 블루 셔츠', '상의', '블루', 0xffa9c8df),
      ('소프트 네이비 팬츠', '하의', '네이비', 0xff415b7a),
      ('쿨 그레이 팬츠', '하의', '그레이', 0xffa8adb8),
      ('로즈 핑크 가디건', '아우터', '핑크', 0xffd992a6),
      ('크림 재킷', '아우터', '아이보리', 0xffe3dfd6),
    ];
    for (var i = 0; i < entries.length; i++) {
      final (name, category, color, hex) = entries[i];
      final recorder = ui.PictureRecorder();
      final canvas = ui.Canvas(recorder);
      canvas.drawColor(const ui.Color(0xfff4f5f8), ui.BlendMode.src);
      final path = ui.Path();
      if (category == '하의') {
        path.moveTo(105, 65);
        for (final point in const [
          ui.Offset(255, 65), ui.Offset(278, 350),
          ui.Offset(198, 350), ui.Offset(180, 170),
          ui.Offset(162, 350), ui.Offset(82, 350),
        ]) { path.lineTo(point.dx, point.dy); }
      } else {
        path.moveTo(135, 75);
        for (final point in const [
          ui.Offset(80, 95), ui.Offset(28, 210),
          ui.Offset(82, 235), ui.Offset(110, 175),
          ui.Offset(105, 340), ui.Offset(255, 340),
          ui.Offset(250, 175), ui.Offset(278, 235),
          ui.Offset(332, 210), ui.Offset(280, 95),
          ui.Offset(225, 75), ui.Offset(205, 108),
          ui.Offset(155, 108),
        ]) { path.lineTo(point.dx, point.dy); }
      }
      path.close();
      canvas.drawPath(path, ui.Paint()..color = ui.Color(hex));
      canvas.drawPath(path, ui.Paint()
        ..color = const ui.Color(0xff697386)
        ..style = ui.PaintingStyle.stroke
        ..strokeWidth = 2);
      if (category == '아우터') {
        canvas.drawLine(const ui.Offset(180, 110), const ui.Offset(180, 340),
            ui.Paint()..color = const ui.Color(0xff697386)..strokeWidth = 2);
      }
      final picture = recorder.endRecording();
      final image = await picture.toImage(360, 420);
      final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
      image.dispose();
      picture.dispose();
      items.add(OutfitItem.localWardrobe(
        imageId: 'demo_catalog_$i',
        imagePath: 'data:image/png;base64,${base64Encode(bytes!.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes))}',
        category: category,
        itemName: name,
        color: color,
        styleTags: const ['데일리', '캐주얼'],
        material: '시연용 일러스트',
      ));
    }
    return _items = items;
  }
}
