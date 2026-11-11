import 'package:flutter/material.dart';

import 'pages/auth_page.dart';
import 'pages/closet_placeholder_page.dart';
import 'pages/mock_avatar_home_loader.dart';
import 'pages/personal_color_page.dart';
import 'pages/recommendation_test_page.dart';
import 'pages/skeleton_diagnosis_page.dart';
import 'services/auth_store.dart';
import 'services/firebase_bootstrap.dart';
import 'services/style_closet_store.dart';
import 'theme/app_colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!useMockDemoFlow) await FirebaseBootstrap.initialize();
  await StyleClosetStore.initialize();
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
const bool useMockDemoFlow = bool.fromEnvironment('MOCK_DEMO_MODE');
const bool useClosetRegistrationPreview =
    bool.fromEnvironment('MOCK_CLOSET_PREVIEW');

class AvataApp extends StatelessWidget {
  const AvataApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'A-VATA',
      builder: (context, child) => useMockDemoFlow
          ? Banner(
              message: 'DEMO',
              location: BannerLocation.topEnd,
              child: child ?? const SizedBox.shrink(),
            )
          : child ?? const SizedBox.shrink(),
      theme: ThemeData(
        fontFamily: 'Pretendard',
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.point,
          primary: AppColors.main,
          surface: AppColors.background,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.background,
          foregroundColor: AppColors.ink,
          elevation: 0,
        ),
      ),
      home: useClosetRegistrationPreview
          ? const Scaffold(body: ClosetPlaceholderPage())
          : useMockDemoFlow
              ? const LoginPage()
              : useSkeletonDiagnosisPreview
                  ? const SkeletonDiagnosisPreviewPage(
                      gender: skeletonDiagnosisPreviewGender,
                    )
                  : usePersonalColorPreview
                      ? const PersonalColorPreviewPage()
                      : useMockAvatarHome
                          ? const MockAvatarHomeLoader(
                              gender: mockAvatarHomeGender)
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
      backgroundColor: AppColors.canvas,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white, Color(0xffedf4ff), Colors.white],
              ),
            ),
          ),
          Positioned(top: -110, right: -90, child: _SplashOrb(size: 300)),
          Positioned(bottom: -150, left: -100, child: _SplashOrb(size: 340)),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/brand/a_vata_logo.png',
                    width: 156, height: 156),
                const SizedBox(height: 20),
                const Text('A-VATA',
                    style: TextStyle(
                        color: Color(0xff7589a9),
                        fontSize: 19,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.4)),
                const SizedBox(height: 14),
                Container(width: 1, height: 26, color: AppColors.point),
                const SizedBox(height: 12),
                const Text('AI로 만나는\n나만의 스타일',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.muted,
                        fontSize: 13,
                        height: 1.55,
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SplashOrb extends StatelessWidget {
  final double size;
  const _SplashOrb({required this.size});

  @override
  Widget build(BuildContext context) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(colors: [
            AppColors.point.withValues(alpha: .28),
            AppColors.point.withValues(alpha: 0)
          ]),
        ),
      );
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
