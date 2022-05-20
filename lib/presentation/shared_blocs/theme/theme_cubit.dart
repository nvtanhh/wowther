import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/params/no_params.dart';
import '../../../core/params/theme/store_app_theme_data_params.dart';
import '../../../core/utils/utils.index.dart';
import '../../../domain/entities/app_theme_data.dart';
import '../../../domain/entities/enums/theme_dark_option.dart';
import '../../../domain/entities/theme_entity.dart';
import '../../../domain/usecases/theme/get_stored_theme_data.dart';
import '../../../domain/usecases/theme/get_supported_color_themes.dart';
import '../../../domain/usecases/theme/get_supported_fonts.dart';
import '../../../domain/usecases/theme/store_app_theme.dart';

part 'theme_state.dart';

@singleton
class ThemeCubit extends Cubit<ThemeState> {
  // usecases
  final GetSupportedFonts _getSupportedFonts;
  final GetSupportedColorThemes _getSupportedThemes;
  final GetStoredOrDefaultAppThemeData _getStoredAppThemeData;
  final StoreAppThemeData _storeTheme;

  ThemeCubit(
    this._getSupportedFonts,
    this._getSupportedThemes,
    this._getStoredAppThemeData,
    this._storeTheme,
  ) : super(const ThemeState()) {
    init();
  }

  Future<void> init() async {
    final supportedFonts = await _getSupportedFonts(NoParams());
    final supportedThemes = await _getSupportedThemes(NoParams());
    final appTheme = await _getStoredAppThemeData(NoParams());
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
        supportedFonts: supportedFonts,
        supportedThemes: supportedThemes,
      ),
    );
  }

  Future<void> onChangeTheme({
    ColorTheme? theme,
    String? font,
    DarkModeOption? darkOption,
  }) async {
    theme ??= state.theme!.colorTheme;
    font ??= state.theme!.font;
    darkOption ??= state.theme!.darkOption;

    final lightTheme = ThemeUtils.getThemeData(
      theme: theme,
      brightness: Brightness.light,
      font: font,
    );
    final darkTheme = ThemeUtils.getThemeData(
      theme: theme,
      brightness: Brightness.dark,
      font: font,
    );

    final newTheme = AppThemeData(
      colorTheme: theme,
      font: font,
      darkOption: darkOption,
    );

    _storeTheme(StoreAppThemeDataParams(theme: newTheme));

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
