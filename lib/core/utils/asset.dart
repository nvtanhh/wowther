import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class AssetUtils {
  static Future<Map<String, dynamic>> loadJson(String path) async {
    final content = await rootBundle.loadString(path);
    return jsonDecode(content) as Map<String, dynamic>;
  }

  ///Singleton factory
  static final _instance = AssetUtils._internal();

  factory AssetUtils() {
    return _instance;
  }

  AssetUtils._internal();
}
