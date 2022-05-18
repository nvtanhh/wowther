import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class UtilAsset {
  static Future<Map<String, dynamic>> loadJson(String path) async {
    final content = await rootBundle.loadString(path);
    return jsonDecode(content) as Map<String, dynamic>;
  }

  ///Singleton factory
  static final _instance = UtilAsset._internal();

  factory UtilAsset() {
    return _instance;
  }

  UtilAsset._internal();
}
