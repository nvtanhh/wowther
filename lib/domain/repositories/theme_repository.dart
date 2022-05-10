import 'package:flutter/material.dart';

import '../entities/theme_entity.dart';

abstract class ThemeRepository {
  Future<String> getStorageOrDefaultFont();

  Future<List<String>> getSupportedFonts();

  Future<ThemeEntity> getStorageOrDefaultTheme();

  Future<List<ThemeEntity>> getSupportedThemes();

  Future<ThemeData> getTheme({
    required ThemeEntity theme,
    required Brightness brightness,
    String? font,
  });
}
