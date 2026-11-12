import 'dart:convert';
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'api_config.dart';

Future<Position> resolveWeatherPosition({bool isWeb = kIsWeb}) async {
  if (isWeb) {
    // Let the browser request permission itself. Permissions.query is not
    // consistently available, and requestPermission does a second location fix.
    return Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.medium,
      timeLimit: const Duration(seconds: 25),
    );
  }
  if (!await Geolocator.isLocationServiceEnabled()) {
    throw const LocationServiceDisabledException();
  }
  var permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  }
  if (permission == LocationPermission.denied ||
      permission == LocationPermission.deniedForever) {
    throw PermissionDeniedException('위치 권한이 거절됐습니다.');
  }
  return Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.medium,
    timeLimit: const Duration(seconds: 25),
  );
}

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
        DateTime.now().difference(_cachedAt!) < const Duration(minutes: 5)) {
      return _cached!;
    }

    late Position position;
    try {
      position = await resolveWeatherPosition().timeout(const Duration(seconds: 30));
    } on PermissionDeniedException {
      throw Exception('위치 권한이 차단됐어요. 주소창의 사이트 설정에서 위치를 허용하고, PC는 Windows 위치 서비스도 켜주세요.');
    } on LocationServiceDisabledException {
      throw Exception('기기의 위치 서비스가 꺼져 있어요. 위치 서비스를 켠 뒤 날씨 새로고침을 눌러주세요.');
    } on TimeoutException {
      throw Exception('현재 위치 확인 시간이 초과됐어요. Wi-Fi 연결과 기기의 위치 서비스를 확인한 뒤 다시 시도해주세요.');
    } on PositionUpdateException {
      throw Exception('브라우저가 현재 위치를 찾지 못했어요. PC의 위치 서비스와 네트워크 연결을 확인해주세요.');
    } catch (_) {
      throw Exception('현재 위치를 확인하지 못했어요. 사이트 위치 권한과 기기의 위치 서비스를 확인해주세요.');
    }

    final uri = ApiConfig.uri('api/weather').replace(queryParameters: {
      'lat': position.latitude.toStringAsFixed(2),
      'lon': position.longitude.toStringAsFixed(2),
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
