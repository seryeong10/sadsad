import 'package:flutter/foundation.dart';

import 'outfit_recommendation_service.dart';

class StyleClosetStore {
  StyleClosetStore._();

  static final ValueNotifier<int> revision = ValueNotifier<int>(0);
  static final List<OutfitItem> _likedItems = [];
  static final List<OutfitItem> _wardrobeItems = [];
  static final List<FittingRecord> _fittingRecords = [];

  static List<OutfitItem> get likedItems => List.unmodifiable(_likedItems);
  static List<OutfitItem> get wardrobeItems =>
      List.unmodifiable(_wardrobeItems);
  static List<FittingRecord> get fittingRecords =>
      List.unmodifiable(_fittingRecords);

  static bool isLiked(String imageId) {
    return _likedItems.any((item) => item.imageId == imageId);
  }

  static void toggleLiked(OutfitItem item) {
    final index = _likedItems.indexWhere(
      (savedItem) => savedItem.imageId == item.imageId,
    );
    if (index >= 0) {
      _likedItems.removeAt(index);
    } else {
      _likedItems.insert(0, item);
    }
    revision.value++;
  }

  static void addWardrobeItem(OutfitItem item) {
    _wardrobeItems.removeWhere(
      (savedItem) => savedItem.imageUrl == item.imageUrl,
    );
    _wardrobeItems.insert(0, item);
    revision.value++;
  }

  static void addFittingRecord({
    required String avatarImageData,
    required List<OutfitItem> items,
  }) {
    _fittingRecords.insert(
      0,
      FittingRecord(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        avatarImageData: avatarImageData,
        items: List.unmodifiable(items),
        createdAt: DateTime.now(),
      ),
    );
    revision.value++;
  }
}

class FittingRecord {
  final String id;
  final String avatarImageData;
  final List<OutfitItem> items;
  final DateTime createdAt;

  const FittingRecord({
    required this.id,
    required this.avatarImageData,
    required this.items,
    required this.createdAt,
  });
}
