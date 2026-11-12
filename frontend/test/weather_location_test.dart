import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:a_vata/services/weather_service.dart';

class BrowserLocation extends GeolocatorPlatform {
  int queries = 0;
  int fixes = 0;
  bool denied = false;
  LocationSettings? settings;
  @override
  Future<LocationPermission> checkPermission() async {
    queries++;
    throw UnsupportedError('Permissions API unavailable');
  }
  @override
  Future<bool> isLocationServiceEnabled() async => false;
  @override
  Future<Position> getCurrentPosition({LocationSettings? locationSettings}) async {
    fixes++;
    settings = locationSettings;
    if (denied) throw PermissionDeniedException('blocked');
    return Position(latitude: 37.56, longitude: 126.97,
      timestamp: DateTime.now(), accuracy: 100, altitude: 0,
      altitudeAccuracy: 0, heading: 0, headingAccuracy: 0,
      speed: 0, speedAccuracy: 0);
  }
}

void main() {
  late GeolocatorPlatform original;
  late BrowserLocation platform;
  setUp(() {
    original = GeolocatorPlatform.instance;
    platform = BrowserLocation();
    GeolocatorPlatform.instance = platform;
  });
  tearDown(() => GeolocatorPlatform.instance = original);
  test('web obtains actual position without requiring Permissions API', () async {
    final position = await resolveWeatherPosition(isWeb: true);
    expect(position.latitude, 37.56);
    expect(platform.queries, 0);
    expect(platform.fixes, 1);
    expect(platform.settings?.accuracy, LocationAccuracy.medium);
  });
  test('web permission denial stays a denial, never a guessed location', () async {
    platform.denied = true;
    await expectLater(resolveWeatherPosition(isWeb: true),
      throwsA(isA<PermissionDeniedException>()));
    expect(platform.fixes, 1);
  });
  test('native disabled location service does not request a fix', () async {
    await expectLater(resolveWeatherPosition(isWeb: false),
      throwsA(isA<LocationServiceDisabledException>()));
    expect(platform.fixes, 0);
  });
}
