import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:a_vata/main.dart';

void main() {
  testWidgets('shows login page when signed out', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});

    await tester.pumpWidget(const AvataApp());
    await tester.pumpAndSettle();

    expect(find.text('로그인'), findsOneWidget);
    expect(find.text('회원가입하기'), findsOneWidget);
  });
}
