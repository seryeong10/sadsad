import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'outfit_recommendation_service.dart';

class StyleClosetStore {
  StyleClosetStore._();

  static final ValueNotifier<int> revision = ValueNotifier<int>(0);
  static final List<OutfitItem> _likedItems = [];
  static final List<OutfitItem> _wardrobeItems = [];
  static final List<FittingRecord> _fittingRecords = [];
  static final List<SavedClosetLook> _savedClosetLooks = [];
  static const _wardrobeStorageKey = 'avata_wardrobe_items_v1';
  static const _likedStorageKey = 'avata_liked_products_v1';
  static const _looksStorageKey = 'avata_saved_closet_looks_v1';
  static bool _initialized = false;

  static Future<void> initialize() async {
    if (_initialized) return;
    final preferences = await SharedPreferences.getInstance();
    final saved = preferences.getStringList(_wardrobeStorageKey) ?? const [];
    for (final entry in saved) {
      try {
        final data = Map<String, dynamic>.from(
          (jsonDecode(entry) as Map).cast<String, dynamic>(),
        );
        _wardrobeItems.add(OutfitItem.localWardrobe(
          imageId: data['image_id'] as String?,
          imagePath: data['image'] as String? ?? '',
          category: data['category'] as String? ?? '상의',
          itemName: data['item'] as String? ?? '의류',
          color: data['color'] as String? ?? '',
          pattern: data['pattern'] as String? ?? '',
          styleTags: (data['style_tags'] as List<dynamic>? ?? [])
              .map((tag) => tag.toString())
              .toList(),
        ));
      } catch (error) {
        debugPrint('옷장 저장 항목을 읽지 못했습니다: $error');
      }
    }
    for (final raw
        in preferences.getStringList(_likedStorageKey) ?? const <String>[]) {
      try {
        _likedItems.add(OutfitItem.fromJson(
            Map<String, dynamic>.from(jsonDecode(raw) as Map),
            baseUrl: ''));
      } catch (error) {
        debugPrint('위시 상품을 읽지 못했습니다: $error');
      }
    }
    for (final raw
        in preferences.getStringList(_looksStorageKey) ?? const <String>[]) {
      try {
        final data = Map<String, dynamic>.from(jsonDecode(raw) as Map);
        _savedClosetLooks.add(SavedClosetLook(
            id: data['id'] as String,
            title: data['title'] as String,
            situation: data['situation'] as String,
            style: data['style'] as String,
            createdAt: DateTime.parse(data['created_at'] as String),
            items: (data['items'] as List)
                .map((item) => OutfitItem.fromJson(
                    Map<String, dynamic>.from(item as Map),
                    baseUrl: ''))
                .toList()));
      } catch (error) {
        debugPrint('저장한 코디를 읽지 못했습니다: $error');
      }
    }
    _initialized = true;
    revision.value++;
  }

  static List<OutfitItem> get likedItems => List.unmodifiable(_likedItems);
  static List<OutfitItem> get wardrobeItems =>
      List.unmodifiable(_wardrobeItems);
  static List<FittingRecord> get fittingRecords =>
      List.unmodifiable(_fittingRecords);
  static List<SavedClosetLook> get savedClosetLooks =>
      List.unmodifiable(_savedClosetLooks);

  static bool isClosetLookSaved(String id) =>
      _savedClosetLooks.any((look) => look.id == id);

  static Future<void> toggleClosetLook(SavedClosetLook look) async {
    final index = _savedClosetLooks.indexWhere((saved) => saved.id == look.id);
    if (index >= 0) {
      _savedClosetLooks.removeAt(index);
    } else {
      _savedClosetLooks.insert(0, look);
    }
    revision.value++;
    try {
      final preferences = await SharedPreferences.getInstance();
      await preferences.setStringList(
          _looksStorageKey,
          _savedClosetLooks
              .map((look) => jsonEncode({
                    'id': look.id,
                    'title': look.title,
                    'situation': look.situation,
                    'style': look.style,
                    'created_at': look.createdAt.toIso8601String(),
                    'items': look.items.map((item) => item.toJson()).toList(),
                  }))
              .toList());
    } catch (error) {
      debugPrint('코디를 저장하지 못했습니다: $error');
    }
  }

  static bool isLiked(String imageId) {
    return _likedItems.any((item) => item.imageId == imageId);
  }

  static Future<void> toggleLiked(OutfitItem item) async {
    final index = _likedItems.indexWhere(
      (savedItem) => savedItem.imageId == item.imageId,
    );
    if (index >= 0) {
      _likedItems.removeAt(index);
    } else {
      _likedItems.insert(0, item);
    }
    revision.value++;
    try {
      final preferences = await SharedPreferences.getInstance();
      await preferences.setStringList(_likedStorageKey,
          _likedItems.map((item) => jsonEncode(item.toJson())).toList());
    } catch (error) {
      debugPrint('위시 상품을 저장하지 못했습니다: $error');
    }
  }

  static Future<void> addWardrobeItem(OutfitItem item) async {
    final previous = List<OutfitItem>.of(_wardrobeItems);
    _wardrobeItems.removeWhere(
      (savedItem) => savedItem.imageUrl == item.imageUrl,
    );
    _wardrobeItems.insert(0, item);
    revision.value++;
    try {
      await _persistWardrobe();
    } catch (_) {
      _wardrobeItems
        ..clear()
        ..addAll(previous);
      revision.value++;
      rethrow;
    }
  }

  static Future<void> replaceWardrobeItem(
    String oldImageId,
    OutfitItem replacement,
  ) async {
    final previous = List<OutfitItem>.of(_wardrobeItems);
    final index =
        _wardrobeItems.indexWhere((item) => item.imageId == oldImageId);
    if (index < 0) {
      _wardrobeItems.insert(0, replacement);
    } else {
      _wardrobeItems[index] = replacement;
    }
    revision.value++;
    try {
      await _persistWardrobe();
    } catch (_) {
      _wardrobeItems
        ..clear()
        ..addAll(previous);
      revision.value++;
      rethrow;
    }
  }

  static Future<void> removeWardrobeItem(String imageId) async {
    final previous = List<OutfitItem>.of(_wardrobeItems);
    final previousLength = _wardrobeItems.length;
    _wardrobeItems.removeWhere((item) => item.imageId == imageId);
    if (previousLength == _wardrobeItems.length) return;
    revision.value++;
    try {
      await _persistWardrobe();
    } catch (_) {
      _wardrobeItems
        ..clear()
        ..addAll(previous);
      revision.value++;
      rethrow;
    }
  }

  static Future<void> clearWardrobe() async {
    if (_wardrobeItems.isEmpty) return;
    final previous = List<OutfitItem>.of(_wardrobeItems);
    _wardrobeItems.clear();
    revision.value++;
    try {
      await _persistWardrobe();
    } catch (_) {
      _wardrobeItems.addAll(previous);
      revision.value++;
      rethrow;
    }
  }

  static Future<void> _persistWardrobe() async {
    final preferences = await SharedPreferences.getInstance();
    final entries = _wardrobeItems
        .map((item) => jsonEncode({
              'image_id': item.imageId,
              'image': item.imageUrl,
              'category': item.category,
              'item': item.title,
              'color': item.color,
              'pattern': item.print,
              'style_tags': item.moodTags
                  .split('|')
                  .where((tag) => tag.isNotEmpty)
                  .toList(),
            }))
        .toList(growable: false);
    final stored =
        await preferences.setStringList(_wardrobeStorageKey, entries);
    if (!stored) throw StateError('옷장 항목을 기기에 저장하지 못했습니다.');
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

class SavedClosetLook {
  final String id;
  final String title;
  final String situation;
  final String style;
  final List<OutfitItem> items;
  final DateTime createdAt;

  SavedClosetLook({
    required this.id,
    required this.title,
    required this.situation,
    required this.style,
    required List<OutfitItem> items,
    DateTime? createdAt,
  })  : items = List.unmodifiable(items),
        createdAt = createdAt ?? DateTime.now();
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
