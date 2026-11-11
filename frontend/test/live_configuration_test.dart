import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:a_vata/services/auth_store.dart';
import 'package:a_vata/services/outfit_recommendation_service.dart';

void main() {
  test('live auth never accepts a saved local session without Firebase', () async {
    SharedPreferences.setMockInitialValues({'avata_active_user': 'old-local'});
    expect(await AuthStore.isSignedIn(), isFalse);
    final result = await AuthStore.login(id: 'old-local', password: 'password');
    expect(result.isSuccess, isFalse);
    expect(result.message, contains('Firebase'));
  });

  test('restored inline clothing images keep their data URI', () {
    const image = 'data:image/png;base64,aGVsbG8=';
    final item = OutfitItem.fromJson({'image_url': image}, baseUrl: '/backend');
    expect(item.imageUrl, image);
  });
}
