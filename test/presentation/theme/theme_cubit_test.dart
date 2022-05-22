import 'package:flutter/material.dart';
import 'package:flutter_resources/core/params/no_params.dart';
import 'package:flutter_resources/domain/entities/app_theme_data.dart';
import 'package:flutter_resources/domain/entities/enums/theme_dark_option.dart';
import 'package:flutter_resources/domain/entities/color_theme.dart';
import 'package:flutter_resources/presentation/shared_blocs/theme/theme_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helpers.mocks.dart';

void main() {
  late ThemeCubit themeCubit;
  late MockGetSupportedFonts mockGetSupportedFonts;
  late MockGetSupportedColorThemes mockGetSupportedColorThemes;
  late MockGetStoredOrDefaultAppThemeData mockGetStoredOrDefaultAppThemeData;
  late MockStoreAppThemeData mockStoreAppThemeData;

  setUp(() {
    mockGetSupportedFonts = MockGetSupportedFonts();
    mockGetSupportedColorThemes = MockGetSupportedColorThemes();
    mockGetStoredOrDefaultAppThemeData = MockGetStoredOrDefaultAppThemeData();
    mockStoreAppThemeData = MockStoreAppThemeData();
    themeCubit = ThemeCubit(
      mockGetSupportedFonts,
      mockGetSupportedColorThemes,
      mockGetStoredOrDefaultAppThemeData,
      mockStoreAppThemeData,
    );
  });

  const supportedColorThemes = [
    ColorTheme(
      name: 'Dark',
      primary: Colors.black,
      secondary: Colors.white,
    ),
  ];

  final supportedFonts = [
    'Open Sans',
    'Roboto',
    'Montserrat',
  ];

  final themeData = AppThemeData(
    colorTheme: supportedColorThemes.first,
    font: 'Open Sans',
    darkOption: DarkModeOption.dynamic,
  );

  test(
    "should init stored or default value when init",
    () async {
      // arrange
      when(mockGetSupportedFonts(NoParams()))
          .thenAnswer((_) => Future.value(supportedFonts));
      when(mockGetSupportedColorThemes(NoParams()))
          .thenAnswer((_) => Future.value(supportedColorThemes));
      when(mockGetStoredOrDefaultAppThemeData(NoParams()))
          .thenAnswer((_) => Future.value(themeData));

      // act
      await themeCubit.init();

      // expect
      expect(themeCubit.state.supportedFonts, supportedFonts);
      expect(themeCubit.state.supportedColorThemes, supportedColorThemes);
      expect(themeCubit.state.theme, themeData);
    },
  );

  test(
    "should emit a new state when change theme && should store theme to repository",
    () async {
      // arrange

      // act
      await themeCubit.onChangeTheme(
        colorTheme: themeData.colorTheme,
        font: themeData.font,
        darkOption: themeData.darkOption,
      );

      // expect
      verify(mockStoreAppThemeData.call(any)).called(1);
      expect(themeCubit.state.theme, themeData);
    },
  );
}
