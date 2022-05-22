import 'package:flutter/material.dart';
import 'package:flutter_resources/core/params/no_params.dart';
import 'package:flutter_resources/domain/entities/color_theme.dart';
import 'package:flutter_resources/domain/usecases/theme/get_supported_color_themes.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helpers.mocks.dart';

void main() {
  late GetSupportedColorThemes usecase;
  late MockThemeRepository repository;

  setUp(() {
    repository = MockThemeRepository();
    usecase = GetSupportedColorThemes(repository);
  });

  const colorThemes = [
    ColorTheme(
      name: 'Dark',
      primary: Colors.black,
      secondary: Colors.white,
    ),
    ColorTheme(
      name: 'Light',
      primary: Colors.white,
      secondary: Colors.black,
    ),
  ];

  test(
    "should return supported color themes from the repository",
    () async {
      // arrange
      when(repository.getSupportedColorThemes())
          .thenAnswer((_) => Future.value(colorThemes));

      // act
      final result = await usecase.call(NoParams());

      // assert
      expect(result, colorThemes);
    },
  );
}
