import 'package:flutter/material.dart';
import 'package:flutter_resources/data/models/app_theme_data_model.dart';
import 'package:flutter_resources/data/models/theme_model.dart';
import 'package:flutter_resources/data/repositories/theme_repository_impl.dart';
import 'package:flutter_resources/domain/entities/app_theme_data.dart';
import 'package:flutter_resources/domain/entities/enums/theme_dark_option.dart';
import 'package:flutter_resources/domain/entities/color_theme.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helpers.mocks.dart';

void main() {
  late ThemeRepositoryImpl repository;
  late MockThemeLocalDataSource mockLocalDataSource;

  setUp(() {
    mockLocalDataSource = MockThemeLocalDataSource();
    repository = ThemeRepositoryImpl(mockLocalDataSource);
  });

  test('should return supported fonts', () async {
    final fonts = ['Open Sans', 'Roboto'];
    // arrange
    when(repository.getSupportedFonts()).thenAnswer((_) => Future.value(fonts));

    // act
    final result = await repository.getSupportedFonts();

    // assert
    expect(result, equals(fonts));
  });

  test('should return supported color themes', () async {
    const colorThemeModels = [
      ColorThemeModel(
        name: 'Red',
        primary: Colors.red,
        secondary: Colors.redAccent,
      ),
      ColorThemeModel(
        name: 'Blue',
        primary: Colors.blue,
        secondary: Colors.blueAccent,
      ),
    ];

    const List<ColorTheme> colorThemes = colorThemeModels;
    // arrange
    when(mockLocalDataSource.getSupportedColorThemes())
        .thenAnswer((_) => Future.value(colorThemeModels));

    // act
    final result = await repository.getSupportedColorThemes();

    // assert
    expect(result, colorThemes);
  });

  test(
    "should return the stored app theme data when there's stored data",
    () async {
      const AppThemeDataModel appThemeDataModel = AppThemeDataModel(
        colorTheme: ColorThemeModel(
          name: 'Red',
          primary: Colors.red,
          secondary: Colors.redAccent,
        ),
        font: 'Open Sans',
        darkOption: DarkModeOption.dynamic,
      );
      const AppThemeData appThemeData = appThemeDataModel;
      // arrange
      when(mockLocalDataSource.getStoredOrDefaultAppThemeData())
          .thenAnswer((_) => Future.value(appThemeDataModel));

      // act
      final result = await repository.getStoredOrDefaultAppThemeData();

      // assert
      expect(result, appThemeData);
    },
  );
}
