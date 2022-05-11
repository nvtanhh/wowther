import 'package:flutter/material.dart';

import '../entities/enums/theme_dark_option.dart';
import '../entities/theme_entity.dart';

abstract class ThemeRepository {
  Future<String> getStorageOrDefaultFont();
  Future<List<String>> getSupportedFonts();
  void storeFont(String font);

  Future<ThemeColorEntity> getStorageOrDefaultThemeColor();
  Future<List<ThemeColorEntity>> getSupportedThemeColors();
  void storeThemeColor(ThemeColorEntity theme);

  Future<DarkModeOption> getDarkModeOption();
  void storeDarkModeOption(DarkModeOption darkModeOption);

  Future<ThemeData> getThemeData({
    required ThemeColorEntity theme,
    required Brightness brightness,
    String? font,
  });
}
