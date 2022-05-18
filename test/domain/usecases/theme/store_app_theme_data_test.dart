import 'package:flutter/material.dart';
import 'package:flutter_resources/core/params/theme/store_app_theme_data_params.dart';
import 'package:flutter_resources/domain/entities/app_theme_data.dart';
import 'package:flutter_resources/domain/entities/enums/theme_dark_option.dart';
import 'package:flutter_resources/domain/entities/theme_entity.dart';
import 'package:flutter_resources/domain/usecases/theme/store_app_theme.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helpers.mocks.dart';

void main() {
  late StoreAppThemeData usecase;
  late MockThemeRepository repository;

  setUp(() {
    repository = MockThemeRepository();
    usecase = StoreAppThemeData(repository);
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
    "should store the app theme data to local storage",
    () async {
      // arrange
      when(
        repository.storeAppThemeData(any),
      ).thenAnswer((_) => Future.value(themeData));

      // act
      final result =
          await usecase.call(StoreAppThemeDataParams(theme: themeData));

      // assert
      expect(result, supportedFonts);
    },
  );
}
