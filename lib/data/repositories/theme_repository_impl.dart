import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/enums/theme_dark_option.dart';
import '../../domain/entities/theme_entity.dart';
import '../../domain/repositories/theme_repository.dart';
import '../datasources/local/theme_local_datasource.dart';
import '../models/theme_model.dart';

@Injectable(as: ThemeRepository)
class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeLocalDataSource _localDatasource;

  ThemeRepositoryImpl(this._localDatasource);

  @override
  Future<String> getStorageOrDefaultFont() async {
    final storageFont = _localDatasource.getStoredFont();
    return storageFont ?? _localDatasource.defaultFont;
  }

  @override
  Future<List<String>> getSupportedFonts() async {
    return _localDatasource.supportedFonts;
  }

  @override
  void storeFont(String font) {
    _localDatasource.storeFont(font);
  }

  @override
  Future<ThemeColorModel> getStorageOrDefaultThemeColor() async {
    final storageTheme = _localDatasource.getStoredTheme();
    final data = _localDatasource.supportedThemes.first;
    return storageTheme ?? ThemeColorModel.fromJson(data);
  }

  @override
  Future<List<ThemeColorModel>> getSupportedThemeColors() async {
    return _localDatasource.supportedThemes
        .map((item) => ThemeColorModel.fromJson(item))
        .toList();
  }

  @override
  void storeThemeColor(ThemeColorEntity theme) {
    _localDatasource.storeThemeColor(theme);
  }

  @override
  Future<DarkModeOption> getDarkModeOption() async {
    return (await _localDatasource.getStoredDarkModeOption()) ??
        DarkModeOption.dynamic;
  }

  @override
  void storeDarkModeOption(DarkModeOption darkModeOption) {
    _localDatasource.storeDarkModeOption(darkModeOption);
  }

  @override
  Future<ThemeData> getThemeData({
    required ThemeColorEntity theme,
    required Brightness brightness,
    String? font,
  }) async {
    ColorScheme? colorScheme;
    switch (brightness) {
      case Brightness.light:
        colorScheme = ColorScheme.light(
          primary: theme.primary,
          secondary: theme.secondary,
          background: const Color(0xfffcfcfc),
          error: Colors.red,
        );
        break;
      case Brightness.dark:
        colorScheme = ColorScheme.dark(
          primary: theme.primary,
          secondary: theme.secondary,
          background: const Color(0xff010101),
          error: Colors.red,
        );
        break;
      default:
    }

    final isDark = colorScheme!.brightness == Brightness.dark;
    final appBarColor = isDark ? colorScheme.surface : colorScheme.background;
    final indicatorColor = isDark ? colorScheme.onSurface : colorScheme.primary;

    return ThemeData(
      brightness: colorScheme.brightness,
      primaryColor: colorScheme.primary,
      appBarTheme: AppBarTheme(
        backgroundColor: appBarColor,
        foregroundColor: isDark ? Colors.white : Colors.black,
      ),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      bottomAppBarColor: colorScheme.surface,
      cardColor: colorScheme.surface,
      dividerColor: colorScheme.onSurface.withOpacity(0.12),
      backgroundColor: colorScheme.background,
      dialogBackgroundColor: colorScheme.background,
      errorColor: colorScheme.error,
      indicatorColor: indicatorColor,
      applyElevationOverlayColor: isDark,
      colorScheme: colorScheme,

      ///Custom
      fontFamily: font,
      dialogTheme: DialogTheme(
        backgroundColor: colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.surface,
        shape: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: colorScheme.primary,
        showUnselectedLabels: true,
      ),
      dividerTheme: const DividerThemeData(
        thickness: 0.8,
        space: 0,
      ),
    );
  }
}
