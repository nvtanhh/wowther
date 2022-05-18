import 'package:flutter/material.dart';
import 'package:flutter_resources/core/params/params.index.dart';
import 'package:flutter_resources/domain/entities/theme_entity.dart';
import 'package:flutter_resources/domain/usecases/theme/get_supported_theme_colors.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helpers.mocks.dart';

void main() {
  late GetSupportedThemeColors usecase;
  late MockThemeRepository repository;
  setUp(() {
    repository = MockThemeRepository();
    usecase = GetSupportedThemeColors(repository);
  });

  const supportedColorTheme = [
    ColorTheme(
      name: 'default',
      primary: Color(0xff82B541),
      secondary: Color(0xff82B541),
    )
  ];
  test(
    "should return supported color theme from the repository",
    () async {
      // arrange
      when(repository.getSupportedThemeColors())
          .thenAnswer((_) => Future.value(supportedColorTheme));

      // act
      final result = await usecase(NoParams());

      // assert
      expect(result, supportedColorTheme);
    },
  );
}
