import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'api_config.dart';

class WeatherHour {
  final String time;
  final int temperature;
  final String condition;

  const WeatherHour(
      {required this.time, required this.temperature, required this.condition});

  factory WeatherHour.fromJson(Map<String, dynamic> json) => WeatherHour(
        time: json['time'] as String? ?? '',
        temperature: (json['temperature'] as num?)?.round() ?? 0,
        condition: json['condition'] as String? ?? 'cloudy',
      );
}

class WeatherSnapshot {
  final String location;
  final int temperature;
  final int feelsLike;
  final String description;
  final String condition;
  final int high;
  final int low;
  final List<WeatherHour> hourly;
  final String advice;

  const WeatherSnapshot({
    required this.location,
    required this.temperature,
    required this.feelsLike,
    required this.description,
    required this.condition,
    required this.high,
    required this.low,
    required this.hourly,
    required this.advice,
  });

  factory WeatherSnapshot.fromJson(Map<String, dynamic> json) =>
      WeatherSnapshot(
        location: json['location'] as String? ?? '현재 위치',
        temperature: (json['temperature'] as num?)?.round() ?? 0,
        feelsLike: (json['feels_like'] as num?)?.round() ?? 0,
        description: json['description'] as String? ?? '날씨 정보',
        condition: json['condition'] as String? ?? 'cloudy',
        high: (json['high'] as num?)?.round() ?? 0,
        low: (json['low'] as num?)?.round() ?? 0,
        hourly: (json['hourly'] as List<dynamic>? ?? const [])
            .whereType<Map<String, dynamic>>()
            .map(WeatherHour.fromJson)
            .toList(),
        advice: json['advice'] as String? ?? '오늘 날씨에 맞는 옷차림을 준비해보세요.',
      );
}

class WeatherService {
  static WeatherSnapshot? _cached;
  static DateTime? _cachedAt;

  static Future<WeatherSnapshot> loadForCurrentLocation(
      {bool refresh = false}) async {
    if (const bool.fromEnvironment('MOCK_DEMO_MODE')) {
      return const WeatherSnapshot(
        location: '서울 · 시연용 날씨', temperature: 18, feelsLike: 17,
        description: '맑음', condition: 'clear', high: 21, low: 12,
        hourly: [
          WeatherHour(time: '09:00', temperature: 16, condition: 'clear'),
          WeatherHour(time: '12:00', temperature: 20, condition: 'clear'),
          WeatherHour(time: '15:00', temperature: 21, condition: 'clear'),
          WeatherHour(time: '18:00', temperature: 17, condition: 'cloudy'),
        ],
        advice: '일교차에 대비해 가벼운 가디건을 챙겨보세요.',
      );
    }
    if (!refresh &&
        _cached != null &&
        _cachedAt != null &&
        DateTime.now().difference(_cachedAt!) < const Duration(minutes: 20)) {
      return _cached!;
    }

    var latitude = 37.5665;
    var longitude = 126.9780;
    try {
      final position = await (() async {
        if (!await Geolocator.isLocationServiceEnabled()) return null;
        var permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
        }
        if (permission == LocationPermission.denied ||
            permission == LocationPermission.deniedForever) {
          return null;
        }
        return Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low,
          timeLimit: const Duration(seconds: 6),
        );
      })()
          .timeout(const Duration(seconds: 8));
      if (position != null) {
        latitude = position.latitude;
        longitude = position.longitude;
      }
    } catch (_) {
      // Fall back to Seoul when location access is unavailable or declined.
    }

    final uri = ApiConfig.uri('api/weather').replace(queryParameters: {
      'lat': latitude.toStringAsFixed(5),
      'lon': longitude.toStringAsFixed(5),
    });
    final response = await http.get(uri, headers: await ApiConfig.headers()).timeout(const Duration(seconds: 15));
    if (response.statusCode != 200) {
      throw Exception('날씨 정보를 불러오지 못했어요. (${response.statusCode})');
    }
    final snapshot = WeatherSnapshot.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>);
    _cached = snapshot;
    _cachedAt = DateTime.now();
    return snapshot;
  }
}
