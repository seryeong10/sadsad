import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:a_vata/widgets/outfit_image.dart';
import 'package:a_vata/services/outfit_recommendation_service.dart';
import 'package:a_vata/services/style_closet_store.dart';
import 'package:a_vata/services/virtual_try_on_service.dart';

void main() {
  test('all 60 catalog thumbnails are bundled as 512x512 PNGs', () async {
    final rows = jsonDecode(File('../backend/data/shopping_products.json').readAsStringSync()) as List;
    expect(rows, hasLength(60));
    for (final row in rows) {
      final bytes = await rootBundle.load(row['image_url'] as String);
      expect(bytes.getUint32(16), 512, reason: row['id'] as String);
      expect(bytes.getUint32(20), 512, reason: row['id'] as String);
    }
  });
  test('previously saved curated products regain their shipped thumbnail', () {
    final old = OutfitItem.fromJson({'image_id': 'male_bottom_10',
      'source_query': 'curated_products', 'image_url': ''}, baseUrl: '');
    expect(old.imageUrl, 'assets/shopping_products/male_bottom_10.png');
  });
  testWidgets('asset path renders, survives wishlist storage and becomes fitting image bytes', (tester) async {
    const assetPath = 'assets/shopping_products/female_top_01.png';
    final fixture = OutfitItem.fromJson({
      'image_id': 'asset-loader-fixture', 'title': 'asset loader fixture',
      'image_url': assetPath, 'item_type': '상의', 'category': '상의',
      'product_url': 'https://example.com/fixture',
    }, baseUrl: 'https://a-vata-api.vercel.app');
    expect(fixture.imageUrl, assetPath);
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body:
      OutfitImage(value: assetPath, width: 100, height: 100))));
    await tester.pumpAndSettle();
    expect(tester.widget<Image>(find.byType(Image)).image, isA<AssetImage>());
    expect(tester.takeException(), isNull);
    SharedPreferences.setMockInitialValues({});
    await StyleClosetStore.initialize();
    await StyleClosetStore.toggleLiked(fixture);
    final preferences = await SharedPreferences.getInstance();
    final saved = jsonDecode(preferences.getStringList('avata_liked_products_v1')!.single) as Map<String, dynamic>;
    final restored = OutfitItem.fromJson(saved, baseUrl: 'https://a-vata-api.vercel.app');
    expect(restored.imageUrl, assetPath);
    expect(restored.link, fixture.link);
    final expected = await rootBundle.load(assetPath);
    final input = (await tester.runAsync(() => VirtualTryOnService.garmentImageInput(restored)))!;
    expect(base64Decode(input.dataUri.split(',').last),
        expected.buffer.asUint8List(expected.offsetInBytes, expected.lengthInBytes));
    expect(input.isRemote, isFalse);
    expect(input.width, 512);
    expect(input.height, 512);
    var handedOff = false;
    await tester.runAsync(() => http.runWithClient(() async {
      await VirtualTryOnService.tryOn(personImage: 'test-avatar-fixture', item: restored);
    }, () => MockClient((request) async {
      final payload = jsonDecode(request.body) as Map<String, dynamic>;
      expect(payload['garment_image'], input.dataUri);
      expect(payload['item_type'], '상의');
      handedOff = true;
      return http.Response('{"image_url":"https://example.com/test-only-output"}', 200);
    })));
    expect(handedOff, isTrue);
    await StyleClosetStore.toggleLiked(restored);
    expect(StyleClosetStore.isLiked(fixture.imageId), isFalse);
  });
}
