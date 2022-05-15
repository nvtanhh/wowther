import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/enums/theme_dark_option.dart';
import '../../../domain/entities/theme_entity.dart';
import '../../../domain/usecases/theme/get_dark_mode_option.dart';
import '../../../domain/usecases/theme/get_default_font.dart';
import '../../../domain/usecases/theme/get_default_theme_color.dart';
import '../../../domain/usecases/theme/get_supported_fonts.dart';
import '../../../domain/usecases/theme/get_supported_theme_colors.dart';
import '../../../domain/usecases/theme/get_theme_data.dart';
import '../../../domain/usecases/theme/store_dark_mode_option.dart';
import '../../../domain/usecases/theme/store_font.dart';
import '../../../domain/usecases/theme/store_theme_color.dart';

part 'theme_state.dart';

@singleton
class ThemeCubit extends Cubit<ThemeState> {
  // usecases
  final GetStorageOrDefaultFont _getStorageOrDefaultFont;
  final GetSupportedFonts _getSupportedFonts;
  final GetStorageOrDefaultThemeColor _getStorageOrDefaultTheme;
  final GetSupportedThemeColors _getSupportedThemes;
  final GetThemeData _getThemeData;
  final GetDarkModeOption _getDarkModeOption;
  final StoreThemeColor _storeThemeColor;
  final StoreFont _storeFont;
  final StoreDarkModeOption _storeDarkModeOption;

  ThemeCubit(
    this._getStorageOrDefaultFont,
    this._getSupportedFonts,
    this._getStorageOrDefaultTheme,
    this._getSupportedThemes,
    this._getThemeData,
    this._getDarkModeOption,
    this._storeThemeColor,
    this._storeFont,
    this._storeDarkModeOption,
  ) : super(const ThemeState()) {
    init();
  }

  Future<void> init() async {
    final supportedFonts = await _getSupportedFonts.call();
    final supportedThemes = await _getSupportedThemes.call();
    final defaultFont = await _getStorageOrDefaultFont.call();
    final defaultTheme = await _getStorageOrDefaultTheme.call();
    final darkModeOption = await _getDarkModeOption.call();
    final lightTheme = await _getThemeData.call(
      theme: defaultTheme,
      brightness: Brightness.light,
      font: defaultFont,
    );
    final darkTheme = await _getThemeData.call(
      theme: defaultTheme,
      brightness: Brightness.dark,
      font: defaultFont,
    );
    emit(
      state.copyWith(
        theme: defaultTheme,
        font: defaultFont,
        lightTheme: _getThemeByDarkOption(
          darkModeOption,
          lightTheme: lightTheme,
          darkTheme: darkTheme,
        ),
        darkTheme: _getThemeByDarkOption(
          darkModeOption,
          lightTheme: lightTheme,
          darkTheme: darkTheme,
          isDarkTheme: true,
        ),
        darkOption: darkModeOption,
        supportedFonts: supportedFonts,
        supportedThemes: supportedThemes,
      ),
    );
  }

  Future<void> onChangeTheme({
    ThemeColorEntity? theme,
    String? font,
    DarkModeOption? darkOption,
  }) async {
    theme ??= state.theme!;
    font ??= state.font!;
    darkOption ??= state.darkOption!;

    final lightTheme = await _getThemeData.call(
      theme: theme,
      brightness: Brightness.light,
      font: font,
    );
    final darkTheme = await _getThemeData.call(
      theme: theme,
      brightness: Brightness.dark,
      font: font,
    );

    if (font != state.font) {
      _storeFont.call(font);
    }
    if (theme != state.theme) {
      _storeThemeColor.call(theme);
    }
    if (darkOption != state.darkOption) {
      _storeDarkModeOption.call(darkOption);
    }

    emit(
      state.copyWith(
        theme: theme,
        lightTheme: _getThemeByDarkOption(
          darkOption,
          lightTheme: lightTheme,
          darkTheme: darkTheme,
        ),
        darkTheme: _getThemeByDarkOption(
          darkOption,
          lightTheme: lightTheme,
          darkTheme: darkTheme,
          isDarkTheme: true,
        ),
        font: font,
        darkOption: darkOption,
      ),
    );
  }
}

ThemeData _getThemeByDarkOption(
  DarkModeOption darkOption, {
  required ThemeData lightTheme,
  required ThemeData darkTheme,
  bool isDarkTheme = false,
}) {
  switch (darkOption) {
    case DarkModeOption.dynamic:
      return isDarkTheme ? darkTheme : lightTheme;
    case DarkModeOption.on:
      return darkTheme;
    case DarkModeOption.off:
      return lightTheme;
  }
}
