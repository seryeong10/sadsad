import 'package:flutter/material.dart';

import 'pages/gender_select_page.dart';
import 'pages/mock_avatar_home_loader.dart';

void main() {
  runApp(const AvataApp());
}

const bool useMockAvatarHome = bool.fromEnvironment('MOCK_AVATAR_HOME');

class AvataApp extends StatelessWidget {
  const AvataApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'A-VATA',
      theme: ThemeData(
        fontFamily: 'Pretendard',
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff0f172a),
          primary: const Color(0xff0f172a),
        ),
      ),
      home: useMockAvatarHome
          ? const MockAvatarHomeLoader()
          : const GenderSelectPage(),
    );
  }
}
