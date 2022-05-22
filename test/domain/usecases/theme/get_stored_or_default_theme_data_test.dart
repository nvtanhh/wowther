import 'package:flutter/material.dart';
import 'package:flutter_resources/core/params/no_params.dart';
import 'package:flutter_resources/domain/entities/app_theme_data.dart';
import 'package:flutter_resources/domain/entities/enums/theme_dark_option.dart';
import 'package:flutter_resources/domain/entities/color_theme.dart';
import 'package:flutter_resources/domain/usecases/theme/get_stored_theme_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helpers.mocks.dart';

void main() {
  late GetStoredOrDefaultAppThemeData usecase;
  late MockThemeRepository repository;

  setUp(() {
    repository = MockThemeRepository();
    usecase = GetStoredOrDefaultAppThemeData(repository);
  });

  const themeData = AppThemeData(
    colorTheme: ColorTheme(
      name: 'Dark',
      primary: Colors.black,
      secondary: Colors.white,
    ),
    font: 'Open Sans',
    darkOption: DarkModeOption.dynamic,
  );

  test(
    "should return the stored or defalut appTheme data from local repository",
    () async {
      // arrange
      when(repository.getStoredOrDefaultAppThemeData())
          .thenAnswer((_) => Future.value(themeData));

      // act
      final result = await usecase(NoParams());

      // assert
      expect(result, themeData);
    },
  );
}
