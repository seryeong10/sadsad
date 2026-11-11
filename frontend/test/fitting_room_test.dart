import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:a_vata/pages/fitting_flow_page.dart';
import 'package:a_vata/services/style_closet_store.dart';
import 'package:a_vata/services/demo_catalog.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets(
      'one item can fit, categories replace, and sources retain selection',
      (tester) async {
    SharedPreferences.setMockInitialValues({});
    await StyleClosetStore.initialize();
    for (final item in await DemoCatalog.load()) {
      await StyleClosetStore.addWardrobeItem(item);
    }
    await tester.pumpWidget(
        const MaterialApp(home: FittingRoomPage(avatarImageData: '')));
    await tester.pumpAndSettle();

    Future<void> select(String title, String category) async {
      await tester.tap(find.byWidgetPredicate((widget) =>
          widget is Semantics &&
          widget.properties.label == '$title, $category'));
      await tester.pumpAndSettle();
    }

    expect(find.text('0 / 3'), findsOneWidget);
    expect(tester.widget<ElevatedButton>(find.byType(ElevatedButton)).onPressed,
        isNull);
    await select('라벤더 니트', '상의');
    expect(find.text('1 / 3'), findsOneWidget);
    expect(tester.widget<ElevatedButton>(find.byType(ElevatedButton)).onPressed,
        isNotNull);
    await select('아이스 블루 셔츠', '상의');
    expect(find.text('1 / 3'), findsOneWidget);

    await tester.tap(find.widgetWithText(ChoiceChip, '아우터'));
    await tester.pumpAndSettle();
    await select('로즈 핑크 가디건', '아우터');
    await tester.tap(find.widgetWithText(ChoiceChip, '하의'));
    await tester.pumpAndSettle();
    await select('쿨 그레이 팬츠', '하의');
    expect(find.text('3 / 3'), findsOneWidget);
    await tester.tap(find.text('위시리스트'));
    await tester.pumpAndSettle();
    expect(find.text('3 / 3'), findsOneWidget);
    await tester.tap(find.byWidgetPredicate((widget) =>
        widget is Semantics && widget.properties.label == '상의 선택 해제'));
    await tester.pumpAndSettle();
    expect(find.text('2 / 3'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
