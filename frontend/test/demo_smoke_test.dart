import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:a_vata/main.dart';
import 'package:a_vata/pages/gender_select_page.dart';
import 'package:a_vata/services/closet_outfit_recommendation_service.dart';
import 'package:a_vata/services/demo_catalog.dart';
import 'package:a_vata/services/outfit_recommendation_service.dart';
import 'package:a_vata/services/style_closet_store.dart';
import 'package:a_vata/services/weather_service.dart';
import 'package:a_vata/widgets/outfit_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUp(() => SharedPreferences.setMockInitialValues({}));

  test('demo catalog, weather, and closet recommendations work without server', () async {
    expect(useMockDemoFlow, isTrue,
        reason: 'Run with --dart-define=MOCK_DEMO_MODE=true');
    final items = await DemoCatalog.load();
    expect(items.length, 6);
    expect(items.map((item) => item.imageId).toSet().length, 6);
    for (final item in items) {
      expect(base64Decode(item.imageUrl.split(',').last).take(8),
          [137, 80, 78, 71, 13, 10, 26, 10]);
    }
    await StyleClosetStore.initialize();
    final response = await OutfitRecommendationService.recommendOutfits(
      situation: '일상', style: '캐주얼', gender: 'female');
    expect(response.items.length, 6);
    final looks = await ClosetOutfitRecommendationService.recommend(
      situation: '일상', mood: '편안함', gender: 'female',
      personalColor: 'summer_cool', skeletonType: 'wave', closet: items);
    expect(looks.length, 3);
    expect(looks.every((look) => look.itemIds.length == 3), isTrue);
    expect((await WeatherService.loadForCurrentLocation()).temperature, 18);
  });

  testWidgets('demo starts without credentials and opens gender selection', (tester) async {
    await tester.pumpWidget(const AvataApp());
    await tester.pumpAndSettle();
    await tester.tap(find.text('데모 시작하기'));
    await tester.pumpAndSettle();
    expect(find.byType(GenderSelectPage), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('demo garment PNG renders from data URI', (tester) async {
    final items = await tester.runAsync(DemoCatalog.load);
    await tester.pumpWidget(MaterialApp(home: Scaffold(body:
      OutfitImage(value: items!.first.imageUrl))));
    await tester.pumpAndSettle();
    expect(find.byType(Image), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
