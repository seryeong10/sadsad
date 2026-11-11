import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../models/style_profile.dart';
import '../services/weather_service.dart';
import '../theme/app_colors.dart';

class HomePage extends StatelessWidget {
  final PersonalColorProfile? personalColorProfile;
  final SkeletonProfile? skeletonProfile;

  const HomePage({super.key, this.personalColorProfile, this.skeletonProfile});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 28),
            children: [
              const _HomeHeader(),
              const SizedBox(height: 25),
              const Text('오늘도 좋은 하루예요!',
                  style: TextStyle(
                      color: Color(0xff07123c),
                      fontSize: 31,
                      height: 1.15,
                      fontWeight: FontWeight.w900)),
              const SizedBox(height: 8),
              const Text('나에게 어울리는 스타일로 더 특별한 하루를 만들어보세요.',
                  style: TextStyle(
                      color: Color(0xff74819f),
                      fontSize: 15,
                      height: 1.45,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 20),
              const _WeatherCard(),
              const SizedBox(height: 18),
              _OutfitSuggestionCard(
                seed: _dailySeed(now, personalColorProfile?.type ?? ''),
                skeletonProfile: skeletonProfile,
              ),
              const SizedBox(height: 16),
              _ColorCombinationCard(
                profile: personalColorProfile,
                seed: _dailySeed(now, personalColorProfile?.type ?? ''),
              ),
              const SizedBox(height: 16),
              const _QuoteCard(),
            ],
          ),
        ),
      ),
    );
  }
}

int _dailySeed(DateTime date, String profileType) {
  final day = DateTime(date.year, date.month, date.day)
      .difference(DateTime(2024, 1, 1))
      .inDays;
  final profileSeed =
      profileType.codeUnits.fold<int>(0, (sum, code) => sum + code);
  return day + profileSeed;
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader();
  @override
  Widget build(BuildContext context) => const Row(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('A-VATA',
              style: TextStyle(
                  color: Color(0xff07123c),
                  fontSize: 24,
                  letterSpacing: -1.2,
                  fontWeight: FontWeight.w900)),
          Text('MY STYLE, EVERYDAY',
              style: TextStyle(
                  color: Color(0xffa7b2c9),
                  fontSize: 10,
                  letterSpacing: .7,
                  fontWeight: FontWeight.w800)),
        ]),
        Spacer(),
      ]);
}

class _WeatherCard extends StatefulWidget {
  const _WeatherCard();

  @override
  State<_WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<_WeatherCard> {
  WeatherSnapshot? _weather;
  bool _loading = true;
  String? _error;
  Timer? _refreshTimer;

  @override
  void initState() {
    super.initState();
    _loadWeather();
    _refreshTimer = Timer.periodic(
        const Duration(minutes: 20), (_) => _loadWeather(refresh: true));
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    super.dispose();
  }

  Future<void> _loadWeather({bool refresh = false}) async {
    if (mounted)
      setState(() {
        _loading = true;
        _error = null;
      });
    try {
      final weather =
          await WeatherService.loadForCurrentLocation(refresh: refresh);
      if (mounted)
        setState(() {
          _weather = weather;
          _loading = false;
        });
    } catch (error) {
      if (mounted)
        setState(() {
          _error = error.toString();
          _loading = false;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    final condition = _weather?.condition ?? 'cloudy';
    final palette = _weatherPalette(condition);
    final now = DateTime.now();
    const weekdays = ['월', '화', '수', '목', '금', '토', '일'];
    final dateLabel =
        '오늘, ${now.month}월 ${now.day}일 (${weekdays[now.weekday - 1]})';
    final forecast = <WeatherHour>[
      if (_weather != null)
        WeatherHour(
            time: '지금',
            temperature: _weather!.temperature,
            condition: condition),
      ...?_weather?.hourly.take(3),
    ];
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: palette),
        boxShadow: [
          BoxShadow(
              color: palette.first.withValues(alpha: .22),
              blurRadius: 20,
              offset: const Offset(0, 9))
        ],
      ),
      child: Stack(children: [
        Positioned.fill(
            child: IgnorePointer(
                child: CustomPaint(
                    painter: _WeatherAtmospherePainter(condition)))),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            const Icon(Icons.location_on_rounded,
                color: Colors.white, size: 18),
            const SizedBox(width: 5),
            Expanded(
                child: Text(_weather?.location ?? '현재 위치',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w900))),
            if (_loading)
              const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: SizedBox(
                      width: 14,
                      height: 14,
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: Colors.white))),
            InkWell(
                onTap: () => _loadWeather(refresh: true),
                borderRadius: BorderRadius.circular(24),
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                        color: const Color(0xddeaf4ff),
                        borderRadius: BorderRadius.circular(99)),
                    child: Text(dateLabel,
                        style: const TextStyle(
                            color: Color(0xff18345f),
                            fontSize: 10,
                            fontWeight: FontWeight.w900)))),
          ]),
          const SizedBox(height: 20),
          Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Expanded(
                flex: 4,
                child: _CurrentWeatherBlock(weather: _weather, error: _error)),
            const SizedBox(width: 12),
            Expanded(flex: 6, child: _HourlyWeatherRow(hours: forecast)),
          ]),
          const SizedBox(height: 19),
          Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 11),
              decoration: BoxDecoration(
                  color: const Color(0xdff9fcff),
                  border: Border.all(color: Colors.white.withValues(alpha: .8)),
                  borderRadius: BorderRadius.circular(18)),
              child: Row(children: [
                CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.white,
                    child: Icon(_weatherIcon(condition),
                        color: palette.first, size: 23)),
                const SizedBox(width: 11),
                Expanded(
                    child: Text(
                        _weather?.advice ??
                            (_error == null
                                ? '현재 위치의 날씨를 확인하고 있어요.'
                                : '날씨를 불러오지 못했어요. 눌러서 다시 시도해보세요.'),
                        style: const TextStyle(
                            color: Color(0xff18345f),
                            fontSize: 11,
                            height: 1.4,
                            fontWeight: FontWeight.w700))),
              ])),
        ]),
      ]),
    );
  }
}

class _CurrentWeatherBlock extends StatelessWidget {
  final WeatherSnapshot? weather;
  final String? error;
  const _CurrentWeatherBlock({required this.weather, required this.error});

  @override
  Widget build(BuildContext context) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(weather == null ? '—°' : '${weather!.temperature}°',
            style: const TextStyle(
                color: Colors.white,
                fontSize: 58,
                height: .92,
                fontWeight: FontWeight.w300)),
        const SizedBox(height: 6),
        Text(weather?.description ?? (error == null ? '불러오는 중' : '연결 오류'),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w900)),
        const SizedBox(height: 5),
        Text(
            weather == null
                ? '최고 —°  |  최저 —°'
                : '최고 ${weather!.high}°  |  최저 ${weather!.low}°',
            maxLines: 1,
            style: const TextStyle(
                color: Colors.white, fontSize: 9, fontWeight: FontWeight.w700)),
      ]);
}

class _HourlyWeatherRow extends StatelessWidget {
  final List<WeatherHour> hours;
  const _HourlyWeatherRow({required this.hours});

  String _label(String time, int index) {
    if (time == '지금' || index == 0 && time.isEmpty) return '지금';
    final hour = int.tryParse(time.split(':').first) ?? 0;
    if (hour == DateTime.now().hour) return '지금';
    final period = hour < 12 ? '오전' : '오후';
    final shownHour = hour % 12 == 0 ? 12 : hour % 12;
    return '$period $shownHour시';
  }

  @override
  Widget build(BuildContext context) {
    if (hours.isEmpty) return const SizedBox(height: 104);
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(hours.length, (index) {
          final item = hours[index];
          return Flexible(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(_label(item.time, index),
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                    fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            Icon(_weatherIcon(item.condition), color: Colors.white, size: 25),
            const SizedBox(height: 5),
            Text('${item.temperature}°',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w900)),
          ]));
        }));
  }
}

List<Color> _weatherPalette(String condition) => switch (condition) {
      'clear' => const [Color(0xff269cf2), Color(0xff72c1fb)],
      'partly_cloudy' => const [Color(0xff359be9), Color(0xff90c7f5)],
      'rain' => const [Color(0xff477baF), Color(0xff91b2d7)],
      'snow' => const [Color(0xff5d83bd), Color(0xffa7c1e7)],
      _ => const [Color(0xff718fb9), Color(0xffaabbd3)],
    };

IconData _weatherIcon(String condition) => switch (condition) {
      'clear' => Icons.wb_sunny_rounded,
      'partly_cloudy' => Icons.wb_cloudy_rounded,
      'rain' => Icons.water_drop_rounded,
      'snow' => Icons.ac_unit_rounded,
      _ => Icons.cloud_rounded,
    };

class _WeatherAtmospherePainter extends CustomPainter {
  final String condition;
  const _WeatherAtmospherePainter(this.condition);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..isAntiAlias = true;
    if (condition == 'clear' || condition == 'partly_cloudy') {
      paint.shader = RadialGradient(colors: [
        Colors.white.withValues(alpha: .42),
        Colors.white.withValues(alpha: 0)
      ]).createShader(Rect.fromCircle(
          center: Offset(size.width * .74, size.height * .13),
          radius: size.width * .48));
      canvas.drawCircle(
          Offset(size.width * .74, size.height * .13), size.width * .48, paint);
      paint.shader = null;
    }
    final random =
        Random(condition.codeUnits.fold<int>(0, (sum, value) => sum + value));
    if (condition == 'rain') {
      paint
        ..color = Colors.white.withValues(alpha: .17)
        ..strokeWidth = 1.2;
      for (var i = 0; i < 64; i++) {
        final x = random.nextDouble() * size.width;
        final y = random.nextDouble() * size.height;
        canvas.drawLine(Offset(x, y), Offset(x - 7, y + 17), paint);
      }
    } else if (condition == 'snow') {
      paint.color = Colors.white.withValues(alpha: .38);
      for (var i = 0; i < 62; i++) {
        final x = random.nextDouble() * size.width;
        final y = random.nextDouble() * size.height;
        final radius = 1 + random.nextDouble() * 2.2;
        canvas.drawCircle(Offset(x, y), radius, paint);
      }
    } else if (condition == 'cloudy' || condition == 'partly_cloudy') {
      paint.color =
          Colors.white.withValues(alpha: condition == 'cloudy' ? .16 : .13);
      for (var i = 0; i < 6; i++) {
        final x = random.nextDouble() * size.width;
        final y = random.nextDouble() * size.height * .7;
        canvas.drawCircle(Offset(x, y), 28 + random.nextDouble() * 24, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _WeatherAtmospherePainter oldDelegate) =>
      condition != oldDelegate.condition;
}

class _OutfitSuggestionCard extends StatelessWidget {
  final int seed;
  final SkeletonProfile? skeletonProfile;

  const _OutfitSuggestionCard({required this.seed, this.skeletonProfile});

  static const _dailyOutfits = [
    [
      ('가디건', '부드럽고\n포근한 무드'),
      ('기본 티셔츠', '깔끔하고\n활용도 높은 아이템'),
      ('청바지', '데일리로 활용하기\n좋은 아이템')
    ],
    [
      ('셔츠', '단정하고\n가벼운 분위기'),
      ('니트 베스트', '차분한 레이어드\n포인트'),
      ('와이드 팬츠', '편안하고\n여유로운 실루엣')
    ],
    [
      ('블루종', '가볍게 걸치기\n좋은 아우터'),
      ('스트라이프 티', '산뜻한 데일리\n포인트'),
      ('코튼 팬츠', '편안한\n캐주얼 스타일')
    ],
    [
      ('트렌치 코트', '차분하고\n세련된 무드'),
      ('라운드 니트', '포근하고\n부드러운 느낌'),
      ('슬랙스', '깔끔한\n밸런스 완성')
    ],
    [
      ('데님 자켓', '편안하고\n활동적인 무드'),
      ('화이트 셔츠', '어디에나 잘 맞는\n기본 아이템'),
      ('면바지', '가볍고 편안한\n데일리 룩')
    ],
  ];

  @override
  Widget build(BuildContext context) {
    final outfit = _dailyOutfits[seed % _dailyOutfits.length];
    final skeletonNote = switch (skeletonProfile?.type) {
      '웨이브' => '부드러운 소재와 균형 잡힌 레이어드를 추천해요.',
      '내추럴' => '여유 있는 실루엣으로 편안한 분위기를 더해요.',
      '스트레이트' => '깔끔한 핏과 정돈된 라인으로 완성해요.',
      _ => '오늘 날씨에 어울리는 스타일을 추천해요.',
    };
    return _HomeCard(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('T O D A Y ’ S   O U T F I T',
          style: TextStyle(
              color: AppColors.muted,
              fontSize: 9,
              letterSpacing: 1.2,
              fontWeight: FontWeight.w900)),
      const SizedBox(height: 4),
      const Text('오늘의 코디 추천',
          style: TextStyle(
              color: Color(0xff07123c),
              fontSize: 22,
              fontWeight: FontWeight.w900)),
      const SizedBox(height: 5),
      Text(skeletonNote,
          style: const TextStyle(
              color: Color(0xff74819f),
              fontSize: 13,
              fontWeight: FontWeight.w600)),
      const SizedBox(height: 14),
      Row(children: [
        Expanded(child: _OutfitChip(outfit[0].$1, outfit[0].$2)),
        const _Plus(),
        Expanded(child: _OutfitChip(outfit[1].$1, outfit[1].$2)),
        const _Plus(),
        Expanded(child: _OutfitChip(outfit[2].$1, outfit[2].$2)),
      ]),
      const SizedBox(height: 10),
      Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
              color: AppColors.selectedBackground,
              borderRadius: BorderRadius.circular(12)),
          child: const Text('쌀쌀한 날씨에도 편안하고 따뜻한 데일리룩이에요.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.muted,
                  fontSize: 10,
                  fontWeight: FontWeight.w600))),
    ]));
  }
}

class _Plus extends StatelessWidget {
  const _Plus();
  @override
  Widget build(BuildContext context) => const Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Text('+',
          style: TextStyle(
              color: Color(0xff7182a3),
              fontSize: 23,
              fontWeight: FontWeight.w700)));
}

class _OutfitChip extends StatelessWidget {
  final String title;
  final String subtitle;
  const _OutfitChip(this.title, this.subtitle);
  @override
  Widget build(BuildContext context) => Container(
      height: 112,
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: const Color(0xfff5f7fb),
          borderRadius: BorderRadius.circular(16)),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Color(0xff0a1744),
                fontSize: 13,
                fontWeight: FontWeight.w900)),
        const SizedBox(height: 8),
        Text(subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Color(0xff71809f),
                fontSize: 10,
                height: 1.4,
                fontWeight: FontWeight.w600)),
      ]));
}

class _ColorCombinationCard extends StatelessWidget {
  final PersonalColorProfile? profile;
  final int seed;

  const _ColorCombinationCard({required this.profile, required this.seed});

  List<Color> _colorsForToday() {
    const seasonColors = {
      'spring': [
        0xffe9a08e,
        0xffffd3bc,
        0xffffdf9b,
        0xffe8e2d3,
        0xffb7cf9b,
        0xffb9ddd4,
        0xfff2b3a7,
        0xffd5e7fb
      ],
      'summer': [
        0xfff2c4d8,
        0xffd88db1,
        0xffcab5ed,
        0xffc7dcf5,
        0xff98add8,
        0xffb9ddd4,
        0xffded9ea,
        0xffa9c9de
      ],
      'autumn': [
        0xffc9774f,
        0xffe09a78,
        0xffe9c277,
        0xffe5d8bd,
        0xff9b9c5d,
        0xff74774d,
        0xffbf8d69,
        0xffd8c4a0
      ],
      'winter': [
        0xffc93b91,
        0xffc9a6e8,
        0xff566bd0,
        0xff273967,
        0xffeeeeef,
        0xffb9ddd4,
        0xff79509e,
        0xff869fe8
      ],
    };
    final type = (profile?.type ?? '').toLowerCase();
    final season = type.contains('spring') || type.contains('봄')
        ? 'spring'
        : type.contains('autumn') ||
                type.contains('fall') ||
                type.contains('가을')
            ? 'autumn'
            : type.contains('winter') || type.contains('겨울')
                ? 'winter'
                : 'summer';
    final candidates = <Color>[];
    for (final hex in profile?.bestHexColors ?? const <String>[]) {
      final normalized = hex.replaceAll('#', '').trim();
      if (normalized.length == 6) {
        final value = int.tryParse(normalized, radix: 16);
        if (value != null) candidates.add(Color(0xff000000 | value));
      }
    }
    candidates.addAll(seasonColors[season]!.map((value) => Color(value)));
    final random = Random(seed);
    candidates.shuffle(random);
    return candidates.take(5).toList();
  }

  @override
  Widget build(BuildContext context) {
    final colors = _colorsForToday();
    return _HomeCard(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('T O D A Y ’ S   C O L O R',
          style: TextStyle(
              color: AppColors.muted,
              fontSize: 9,
              letterSpacing: 1.2,
              fontWeight: FontWeight.w900)),
      const SizedBox(height: 4),
      const Text('오늘의 추천 컬러 조합',
          style: TextStyle(
              color: Color(0xff07123c),
              fontSize: 21,
              fontWeight: FontWeight.w900)),
      const SizedBox(height: 5),
      Text('${profile?.label ?? '나에게 어울리는'} 컬러로 완성한 오늘의 팔레트예요.',
          style: const TextStyle(
              color: Color(0xff74819f),
              fontSize: 13,
              height: 1.45,
              fontWeight: FontWeight.w600)),
      const SizedBox(height: 13),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: colors.map((color) => _ColorDot(color)).toList()),
      const SizedBox(height: 8),
      const Align(
          alignment: Alignment.center,
          child: Text('오늘의 컬러 조합',
              style: TextStyle(
                  color: AppColors.muted,
                  fontSize: 10,
                  fontWeight: FontWeight.w600))),
    ]));
  }
}

class _ColorDot extends StatelessWidget {
  final Color color;
  const _ColorDot(this.color);
  @override
  Widget build(BuildContext context) => Container(
      width: 43,
      height: 43,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle));
}

class _QuoteCard extends StatelessWidget {
  const _QuoteCard();
  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 17),
      decoration: BoxDecoration(
          color: const Color(0xfff3f8ff),
          borderRadius: BorderRadius.circular(19)),
      child: const Row(children: [
        Text('“',
            style: TextStyle(
                color: Color(0xffa8d1ff),
                fontSize: 47,
                height: .7,
                fontWeight: FontWeight.w900)),
        SizedBox(width: 12),
        Expanded(
            child: Text('좋은 하루는,\n나에게 어울리는 스타일부터.',
                style: TextStyle(
                    color: Color(0xff71809f),
                    fontSize: 13,
                    height: 1.45,
                    fontWeight: FontWeight.w700))),
        Text('A - V A T A',
            style: TextStyle(
                color: Color(0xff8b97b3),
                fontSize: 10,
                letterSpacing: 2,
                fontWeight: FontWeight.w900)),
      ]));
}

class _HomeCard extends StatelessWidget {
  final Widget child;
  const _HomeCard({required this.child});
  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.all(19),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(23),
          border: Border.all(color: const Color(0xffedf0f7))),
      child: child);
}
