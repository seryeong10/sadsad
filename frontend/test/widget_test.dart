import 'package:flutter_test/flutter_test.dart';

import 'package:a_vata/main.dart';

void main() {
  testWidgets('shows gender selection page', (WidgetTester tester) async {
    await tester.pumpWidget(const AvataApp());

    expect(find.text('성별 선택'), findsOneWidget);
    expect(find.text('남자'), findsOneWidget);
    expect(find.text('여자'), findsOneWidget);
  });
}
