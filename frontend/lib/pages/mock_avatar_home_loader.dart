import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'avatar_home_page.dart';

class MockAvatarHomeLoader extends StatelessWidget {
  const MockAvatarHomeLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _loadMockAvatar(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return AvatarHomePage(
          gender: 'female',
          avatarImageData: snapshot.data!,
        );
      },
    );
  }

  Future<String> _loadMockAvatar() async {
    final bytes = await rootBundle.load('assets/avatars/female_base.png');
    final encoded = base64Encode(bytes.buffer.asUint8List());
    return 'data:image/png;base64,$encoded';
  }
}
