import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/enums/theme_dark_option.dart';
import '../../../domain/entities/theme_entity.dart';
import '../../../domain/repositories/theme_repository.dart';

part 'theme_state.dart';

@lazySingleton
class ThemeCubit extends Cubit<ThemeState> {
  final ThemeRepository _themeRepository;
  ThemeCubit(this._themeRepository) : super(const ThemeState()) {
    init();
  }

  Future<void> init() async {
    final supportedFonts = await _themeRepository.getSupportedFonts();
    final supportedThemes = await _themeRepository.getSupportedTheme();
    final defaultFont = await _themeRepository.getDefaultFontFamily();
    final defaultTheme = await _themeRepository.getDefaultTheme();
    final lightTheme = await _themeRepository.getTheme(
      theme: defaultTheme,
      brightness: Brightness.light,
      font: defaultFont,
    );
    final darkTheme = await _themeRepository.getTheme(
      theme: defaultTheme,
      brightness: Brightness.dark,
      font: defaultFont,
    );
    emit(
      state.copyWith(
        theme: defaultTheme,
        font: defaultFont,
        lightTheme: lightTheme,
        darkTheme: darkTheme,
        darkOption: DarkOption.dynamic,
        supportedFonts: supportedFonts,
        supportedThemes: supportedThemes,
      ),
    );
  }

  Future<void> onChangeTheme({
    ThemeEntity? theme,
    String? font,
    DarkOption? darkOption,
  }) async {
    theme ??= state.theme!;
    font ??= state.font!;
    darkOption ??= state.darkOption!;

    final lightTheme = await _themeRepository.getTheme(
      theme: theme,
      brightness: Brightness.light,
      font: font,
    );
    final darkTheme = await _themeRepository.getTheme(
      theme: theme,
      brightness: Brightness.dark,
      font: font,
    );

    // ///Preference save
    // UtilPreferences.setString(Preferences.darkOption, darkOption.name);

    // UtilPreferences.setString(
    //   Preferences.theme,
    //   jsonEncode(themeState.theme.toJson()),
    // );

    // ///Preference save
    // if (themeState.font != null) {
    //   UtilPreferences.setString(Preferences.font, themeState.font!);
    // }

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
  DarkOption darkOption, {
  required ThemeData lightTheme,
  required ThemeData darkTheme,
  bool isDarkTheme = false,
}) {
  switch (darkOption) {
    case DarkOption.dynamic:
      return isDarkTheme ? darkTheme : lightTheme;
    case DarkOption.on:
      return darkTheme;
    case DarkOption.off:
      return lightTheme;
  }
}
