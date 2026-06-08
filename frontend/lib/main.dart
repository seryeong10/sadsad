import 'package:flutter/material.dart';

import 'pages/auth_page.dart';
import 'pages/mock_avatar_home_loader.dart';
import 'pages/personal_color_page.dart';
import 'pages/recommendation_test_page.dart';
import 'pages/skeleton_diagnosis_page.dart';
import 'services/auth_store.dart';
import 'services/firebase_bootstrap.dart';
import 'theme/app_colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseBootstrap.initialize();
  runApp(const AvataApp());
}

const bool useMockAvatarHome = bool.fromEnvironment('MOCK_AVATAR_HOME');
const bool usePersonalColorPreview =
    bool.fromEnvironment('MOCK_PERSONAL_COLOR');
const bool useSkeletonDiagnosisPreview =
    bool.fromEnvironment('MOCK_SKELETON_DIAGNOSIS');
const String skeletonDiagnosisPreviewGender =
    String.fromEnvironment('MOCK_SKELETON_GENDER', defaultValue: 'female');
const String mockAvatarHomeGender =
    String.fromEnvironment('MOCK_AVATAR_GENDER', defaultValue: 'female');
const bool useRecommendationTest =
    bool.fromEnvironment('MOCK_RECOMMENDATION_TEST');

class AvataApp extends StatelessWidget {
  const AvataApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'A-VATA',
      theme: ThemeData(
        fontFamily: 'Pretendard',
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.main,
          primary: AppColors.main,
          surface: AppColors.background,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.background,
          foregroundColor: AppColors.ink,
          elevation: 0,
        ),
      ),
      home: useSkeletonDiagnosisPreview
          ? const SkeletonDiagnosisPreviewPage(
              gender: skeletonDiagnosisPreviewGender,
            )
          : usePersonalColorPreview
              ? const PersonalColorPreviewPage()
              : useMockAvatarHome
                  ? const MockAvatarHomeLoader(gender: mockAvatarHomeGender)
                  : useRecommendationTest
                      ? const RecommendationTestPage()
                      : const AppSplashGate(),
    );
  }
}

class AppSplashGate extends StatefulWidget {
  const AppSplashGate({super.key});

  @override
  State<AppSplashGate> createState() => _AppSplashGateState();
}

class _AppSplashGateState extends State<AppSplashGate>
    with SingleTickerProviderStateMixin {
  late final AnimationController _splashTimer;
  bool _showSplash = true;

  @override
  void initState() {
    super.initState();
    _splashTimer = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..forward().whenComplete(() {
        if (!mounted) return;
        setState(() => _showSplash = false);
      });
  }

  @override
  void dispose() {
    _splashTimer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 360),
      child: _showSplash
          ? const AvataSplashScreen(key: ValueKey('splash'))
          : const AuthGate(key: ValueKey('auth')),
    );
  }
}

class AvataSplashScreen extends StatelessWidget {
  const AvataSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/brand/a_vata_logo.png',
          width: 176,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: AuthStore.isSignedIn(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: AppColors.main),
            ),
          );
        }

        return const LoginPage();
      },
    );
  }
}
