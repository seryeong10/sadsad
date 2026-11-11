import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:a_vata/services/style_closet_store.dart';
import 'package:a_vata/services/outfit_recommendation_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test(
      'owned garments, wish products and saved looks remain separate and persist',
      () async {
    SharedPreferences.setMockInitialValues({});
    await StyleClosetStore.initialize();
    expect(StyleClosetStore.wardrobeItems, isEmpty);
    final top = OutfitItem.localWardrobe(
        imageId: 'my-top',
        imagePath: 'data:image/png;base64,AA==',
        category: '상의',
        itemName: '내 상의');
    final bottom = OutfitItem.localWardrobe(
        imageId: 'my-bottom',
        imagePath: 'data:image/png;base64,AQ==',
        category: '하의',
        itemName: '내 하의');
    final product = OutfitItem.fromJson({
      'image_id': 'shop-top',
      'image_url': 'https://example.com/top.png',
      'title': '위시 상품',
      'category': '상의',
      'item_type': '상의',
      'link': 'https://example.com/product'
    }, baseUrl: '');
    await StyleClosetStore.addWardrobeItem(top);
    await StyleClosetStore.addWardrobeItem(bottom);
    await StyleClosetStore.toggleLiked(product);
    await StyleClosetStore.toggleClosetLook(SavedClosetLook(
        id: 'saved-look',
        title: '저장 코디',
        situation: '데일리',
        style: '캐주얼',
        items: [top, bottom]));
    expect(StyleClosetStore.wardrobeItems.map((i) => i.imageId),
        ['my-bottom', 'my-top']);
    expect(StyleClosetStore.likedItems.single.imageId, 'shop-top');
    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getStringList('avata_wardrobe_items_v1')!.length, 2);
    final liked =
        jsonDecode(prefs.getStringList('avata_liked_products_v1')!.single)
            as Map<String, dynamic>;
    expect(OutfitItem.fromJson(liked, baseUrl: '').link, product.link);
    final look =
        jsonDecode(prefs.getStringList('avata_saved_closet_looks_v1')!.single)
            as Map;
    expect((look['items'] as List).map((i) => i['image_id']),
        ['my-top', 'my-bottom']);
    expect(
        OutfitItem.fromJson(top.toJson(), baseUrl: '').imageUrl, top.imageUrl);
  });
}
