import 'package:flutter/material.dart';
import 'package:flutter_resources/domain/entities/theme_entity.dart';
import 'package:flutter_resources/domain/repositories/theme_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ThemeUseCase {
  final ThemeRepository _themeRepository;

  ThemeUseCase(this._themeRepository);

  Future<String> getDefaultFontFamily() {
    return _themeRepository.getDefaultFontFamily();
  }

  Future<List<String>> getSupportedFonts() {
    return _themeRepository.getSupportedFonts();
  }

  Future<ThemeEntity> getDefaultTheme() {
    return _themeRepository.getDefaultTheme();
  }

  Future<List<ThemeEntity>> getSupportedThemes() {
    return _themeRepository.getSupportedTheme();
  }

  Future<ThemeData> getTheme({
    required ThemeEntity theme,
    required Brightness brightness,
    String? font,
  }) {
    return _themeRepository.getTheme(
      theme: theme,
      brightness: brightness,
      font: font,
    );
  }
}
