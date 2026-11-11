import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:a_vata/pages/outfit_recommendation_page.dart';
import 'package:a_vata/pages/fitting_flow_page.dart';
import 'package:a_vata/services/outfit_recommendation_service.dart';
import 'package:a_vata/services/style_closet_store.dart';

void main() {
  testWidgets('supplied products refresh, persist, show fitting photos and open exact URLs', (tester) async {
    tester.view.physicalSize = const Size(1024, 1366);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    SharedPreferences.setMockInitialValues({});
    await StyleClosetStore.initialize();
    final products = (jsonDecode(File('../backend/data/shopping_products.json').readAsStringSync()) as List)
        .cast<Map<String, dynamic>>().where((row) => row['gender'] == 'male').toList();
    final launches = <String>[];
    Finder wishIcon(IconData icon) => find.byWidgetPredicate(
        (widget) => widget is Icon && widget.icon == icon && widget.size == 14).first;
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
      const MethodChannel('plugins.flutter.io/url_launcher'), (call) async {
        if ((call.arguments as Map?)?['url'] case final String url) launches.add(url);
        return true;
      });
    var requests = 0;
    final client = MockClient((request) async {
      if (request.url.path.endsWith('virtual-try-on')) {
        final body = jsonDecode(request.body) as Map<String, dynamic>;
        expect(body['garment_image'], startsWith('data:image/png;base64,'));
        return http.Response('{"image_url":"https://example.com/test-fitting-output"}', 200);
      }
      expect(request.url.path, endsWith('recommend-outfits'));
      requests++;
      if (requests == 2) {
        expect(request.url.queryParameters['refresh_seed'], isNotEmpty);
        expect(request.url.queryParameters['exclude_ids']!.split(','), hasLength(21));
      }
      final rows = <Map<String, dynamic>>[];
      for (final category in ['top', 'bottom', 'outer']) {
        final group = products.where((row) => row['category'] == category);
        for (final row in requests == 1 ? group.take(7) : group.skip(3)) {
          rows.add({'image_id': row['id'], 'title': row['name'], 'image_url': row['image_url'],
            'price': null, 'product_url': row['product_url'],
            'item_type': {'top': '상의', 'bottom': '하의', 'outer': '아우터'}[category]});
        }
      }
      return http.Response.bytes(utf8.encode(jsonEncode({'source': 'curated_products',
        'situation': '데일리', 'style': '캐주얼', 'items': rows})), 200);
    });
    await http.runWithClient(() async {
      await tester.pumpWidget(const MaterialApp(home: OutfitRecommendationPage(
        gender: 'male', avatarImageData: '', situation: '데일리', style: '캐주얼')));
      await tester.pumpAndSettle();
      expect(find.text('이미지 미등록'), findsNothing);
      expect(find.text('원피스'), findsNothing);
      final title = products.first['name'] as String;
      final url = products.first['product_url'] as String;
      await tester.tap(find.text(title));
      await tester.pumpAndSettle();
      expect(launches.last, url);
      await tester.tap(wishIcon(Icons.favorite_border));
      await tester.pumpAndSettle();
      expect(StyleClosetStore.likedItems.single.link, url);
      expect(StyleClosetStore.likedItems.single.imageUrl, products.first['image_url']);
      await tester.tap(wishIcon(Icons.favorite));
      await tester.pumpAndSettle();
      expect(StyleClosetStore.likedItems, isEmpty);
      await tester.tap(wishIcon(Icons.favorite_border));
      await tester.pumpAndSettle();
      final prefs = await SharedPreferences.getInstance();
      final saved = jsonDecode(prefs.getStringList('avata_liked_products_v1')!.single) as Map<String, dynamic>;
      expect(OutfitItem.fromJson(saved, baseUrl: '').link, url);
      await tester.ensureVisible(find.text('재추천 받기'));
      await tester.tap(find.text('재추천 받기'));
      await tester.pumpAndSettle();
      expect(requests, 2);
      expect(find.text(products[3]['name'] as String), findsOneWidget);
      await tester.pumpWidget(const MaterialApp(home: FittingRoomPage(avatarImageData: '')));
      await tester.pumpAndSettle();
      await tester.tap(find.text('위시리스트'));
      await tester.pumpAndSettle();
      await tester.tap(find.byWidgetPredicate((widget) => widget is Semantics && widget.properties.label == '$title, 상의'));
      await tester.pumpAndSettle();
      expect(find.text('1 / 3'), findsOneWidget);
      await tester.tap(find.text('피팅하러가기'));
      await tester.pump();
      for (var frame = 0; frame < 6; frame++) {
        await tester.runAsync(() async => Future<void>.delayed(const Duration(milliseconds: 50)));
        await tester.pump(const Duration(milliseconds: 50));
      }
      await tester.pumpAndSettle();
      expect(find.textContaining('피팅에 사용할 옷 사진이 아직 없어요'), findsNothing);
      expect(find.text('이 영역으로 피팅하기'), findsOneWidget);
      expect(requests, 2);
      await tester.pageBack();
      await tester.pumpAndSettle();
      await tester.pumpWidget(const MaterialApp(home: WishlistPage()));
      await tester.pumpAndSettle();
      await tester.tap(find.byTooltip(title));
      await tester.pumpAndSettle();
      expect(launches.last, url);
      expect(tester.takeException(), isNull);
    }, () => client);
  });
}
