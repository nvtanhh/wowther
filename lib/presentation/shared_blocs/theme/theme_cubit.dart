import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../configs/configs.index.dart';

part 'theme_state.dart';

@singleton
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState());

  Future<void> init() async {
    final appTheme = ThemeConfiguration.defaultAppTheme;
    final lightTheme = ThemeUtils.getThemeData(
      theme: appTheme.colorTheme,
      brightness: Brightness.light,
      font: appTheme.font,
    );
    final darkTheme = ThemeUtils.getThemeData(
      theme: appTheme.colorTheme,
      brightness: Brightness.dark,
      font: appTheme.font,
    );
    emit(
      state.copyWith(
        theme: appTheme,
        lightTheme: _getThemeByDarkOption(
          appTheme.darkOption,
          lightTheme: lightTheme,
          darkTheme: darkTheme,
        ),
        darkTheme: _getThemeByDarkOption(
          appTheme.darkOption,
          lightTheme: lightTheme,
          darkTheme: darkTheme,
          isDarkTheme: true,
        ),
        supportedFonts: ThemeConfiguration.supportedFonts,
        supportedThemes: ThemeConfiguration.supportedColorThemes,
      ),
    );
  }

  Future<void> onChangeTheme({
    ColorTheme? colorTheme,
    String? font,
    DarkModeOption? darkOption,
  }) async {
    colorTheme ??= state.theme!.colorTheme;
    font ??= state.theme!.font;
    darkOption ??= state.theme!.darkOption;

    final lightTheme = ThemeUtils.getThemeData(
      theme: colorTheme,
      brightness: Brightness.light,
      font: font,
    );
    final darkTheme = ThemeUtils.getThemeData(
      theme: colorTheme,
      brightness: Brightness.dark,
      font: font,
    );

    final newTheme = AppThemeData(
      colorTheme: colorTheme,
      font: font,
      darkOption: darkOption,
    );

    emit(
      state.copyWith(
        theme: newTheme,
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
