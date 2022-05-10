import 'package:flutter/material.dart';

import '../entities/theme_entity.dart';

abstract class ThemeRepository {
  Future<String> getDefaultFontFamily();

  Future<List<String>> getSupportedFonts();

  Future<ThemeEntity> getDefaultTheme();

  Future<List<ThemeEntity>> getSupportedTheme();

  Future<ThemeData> getTheme({
    required ThemeEntity theme,
    required Brightness brightness,
    String? font,
  });
}
