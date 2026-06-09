import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:http/http.dart' as http;

import 'outfit_recommendation_service.dart';

class GarmentImageInput {
  final String dataUri;
  final int width;
  final int height;
  final bool isRemote;
  final String? sourceUrl;

  const GarmentImageInput({
    required this.dataUri,
    required this.width,
    required this.height,
    required this.isRemote,
    this.sourceUrl,
  });
}

class VirtualTryOnService {
  static const String _baseUrl = 'http://54.180.152.237:8000';

  static Future<String> tryOn({
    required String personImage,
    required OutfitItem item,
    String? garmentImageOverride,
  }) async {
    final garmentImage =
        garmentImageOverride ?? (await garmentImageInput(item)).dataUri;
    final response = await http.post(
      Uri.parse('$_baseUrl/virtual-try-on'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'person_image': personImage,
        'garment_image': garmentImage,
        'item_type': item.itemType.isNotEmpty ? item.itemType : item.category,
        'preserve_pose': true,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('피팅 실패: ${utf8.decode(response.bodyBytes)}');
    }

    final data =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    return data['image_url'] as String? ?? '';
  }

  static Future<GarmentImageInput> garmentImageInput(OutfitItem item) async {
    final imageUrl = item.imageUrl;
    final isRemote =
        imageUrl.startsWith('http://') || imageUrl.startsWith('https://');

    if (imageUrl.startsWith('data:image/')) {
      final bytes = base64Decode(imageUrl.split(',').last);
      final size = await _imageSize(bytes);
      return GarmentImageInput(
        dataUri: imageUrl,
        width: size.width,
        height: size.height,
        isRemote: false,
      );
    }

    final bytes = isRemote
        ? await _downloadRemoteImage(imageUrl)
        : await File(imageUrl).readAsBytes();
    final extension = imageUrl.toLowerCase().contains('.jpg') ||
            imageUrl.toLowerCase().contains('.jpeg')
        ? 'jpeg'
        : 'png';
    final size = await _imageSize(bytes);
    return GarmentImageInput(
      dataUri: 'data:image/$extension;base64,${base64Encode(bytes)}',
      width: size.width,
      height: size.height,
      isRemote: isRemote,
      sourceUrl: isRemote ? imageUrl : null,
    );
  }

  static bool shouldReviewGarmentImage({
    required OutfitItem item,
    required GarmentImageInput input,
  }) {
    final text = [
      item.title,
      item.category,
      item.itemType,
      item.detail,
      item.sourceQuery,
    ].join(' ').toLowerCase();
    final riskyWords = [
      '세트',
      '상하의',
      '투피스',
      '코디',
      '착용',
      '모델',
      '1+1',
      '옵션',
      '컬러',
      '색상',
      '기획',
      '일자',
      '와이드',
      '슬랙스',
    ];
    final riskySlotWords = [
      '하의',
      '바지',
      '팬츠',
      '스커트',
      '치마',
      '원피스',
      '드레스',
      '아우터',
      '자켓',
      '재킷',
      '코트',
    ];
    final tallImage = input.height > input.width * 1.25;
    final wideImage = input.width > input.height * 1.7;
    final hasRiskyWord = riskyWords.any(text.contains);
    final isRiskySlot = riskySlotWords.any(text.contains);
    final needsManualCropBySlot = input.isRemote && isRiskySlot;

    return hasRiskyWord ||
        wideImage ||
        needsManualCropBySlot ||
        (input.isRemote && isRiskySlot && tallImage);
  }

  static Future<String> cropDataUri({
    required String dataUri,
    required double left,
    required double top,
    required double width,
    required double height,
  }) async {
    final bytes = base64Decode(dataUri.split(',').last);
    final codec = await ui.instantiateImageCodec(bytes);
    final frame = await codec.getNextFrame();
    final source = frame.image;
    final sourceRect = ui.Rect.fromLTWH(
      left.clamp(0, source.width.toDouble() - 1),
      top.clamp(0, source.height.toDouble() - 1),
      width.clamp(1, source.width.toDouble()),
      height.clamp(1, source.height.toDouble()),
    );
    final recorder = ui.PictureRecorder();
    final canvas = ui.Canvas(recorder);
    final targetRect =
        ui.Rect.fromLTWH(0, 0, sourceRect.width, sourceRect.height);
    canvas.drawColor(const ui.Color(0xffffffff), ui.BlendMode.src);
    canvas.drawImageRect(source, sourceRect, targetRect, ui.Paint());
    final picture = recorder.endRecording();
    final cropped = await picture.toImage(
      sourceRect.width.round(),
      sourceRect.height.round(),
    );
    final pngBytes = await cropped.toByteData(format: ui.ImageByteFormat.png);
    return 'data:image/png;base64,${base64Encode(pngBytes!.buffer.asUint8List())}';
  }

  static Future<({int width, int height})> _imageSize(Uint8List bytes) async {
    final codec = await ui.instantiateImageCodec(bytes);
    final frame = await codec.getNextFrame();
    return (width: frame.image.width, height: frame.image.height);
  }

  static Future<Uint8List> _downloadRemoteImage(String imageUrl) async {
    final response = await http.get(
      Uri.parse(imageUrl),
      headers: const {
        'Accept':
            'image/avif,image/webp,image/apng,image/svg+xml,image/*,*/*;q=0.8',
        'Referer': 'https://shopping.naver.com/',
        'User-Agent':
            'Mozilla/5.0 (Linux; Android 13) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0 Mobile Safari/537.36',
      },
    );
    if (response.statusCode >= 400 || response.bodyBytes.isEmpty) {
      throw Exception('상품 이미지를 불러오지 못했어요.');
    }
    return response.bodyBytes;
  }
}
