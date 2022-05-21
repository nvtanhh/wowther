import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_resources/core/constants/storage_constants.dart';
import 'package:flutter_resources/data/datasources/theme/theme_local_datasource.dart';
import 'package:flutter_resources/data/models/app_theme_data_model.dart';
import 'package:flutter_resources/data/models/theme_model.dart';
import 'package:flutter_resources/domain/entities/enums/theme_dark_option.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/fixture_reader.dart';
import '../../helpers/test_helpers.mocks.dart';

void main() {
  late MockSharedPreferences mockSharedPreferences;
  late ThemeLocalDataSourceImpl dataSource;
  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = ThemeLocalDataSourceImpl(mockSharedPreferences);
  });

  test(
    "should store theme",
    () async {
      // arrange
      const theme = AppThemeDataModel(
        colorTheme: ColorThemeModel(
          name: 'orange',
          primary: Color(0xffff9800),
          secondary: Color(0xffff9800),
        ),
        font: 'Open Sans',
        darkOption: DarkModeOption.dynamic,
      );

      when(
        mockSharedPreferences.setString(any, any),
      ).thenAnswer((_) async => true);

      // act
      await dataSource.storeAppThemeData(theme);

      // assert
      verify(
        await mockSharedPreferences.setString(
          StorageConstants.theme,
          jsonEncode(theme.toJson()),
        ),
      );
    },
  );

  test(
    'should return stored app theme data if it was stored',
    // arrange
    () async {
      final theme = AppThemeDataModel.fromJson(
        jsonDecode(fixture('theme/app_theme.json')) as Map<String, dynamic>,
      );
      when(
        mockSharedPreferences.getString(StorageConstants.theme),
      ).thenReturn(fixture('theme/app_theme.json'));

      // act
      final result = await dataSource.getStoredOrDefaultAppThemeData();

      // assert
      expect(result, theme);
    },
  );
}
