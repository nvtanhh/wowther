import 'package:flutter/material.dart';
import 'package:flutter_resources/core/constants/storage_constants.dart';
import 'package:flutter_resources/data/datasources/language/language_local_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helpers.mocks.dart';

void main() {
  late MockSharedPreferences mockSharedPreferences;
  late LanguageLocalDataSourceImpl dataSource;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = LanguageLocalDataSourceImpl(mockSharedPreferences);
  });

  test(
    "should store locale",
    () async {
      // arrange
      const locale = Locale('en');

      when(
        mockSharedPreferences.setString(
          StorageConstants.language,
          locale.languageCode,
        ),
      ).thenAnswer((_) async => true);

      // act
      await dataSource.storeLocale(locale);

      // assert
      verify(
        await mockSharedPreferences.setString(
          StorageConstants.language,
          locale.languageCode,
        ),
      );
    },
  );

  test(
    "should get stored language code",
    () async {
      // arrange
      const locale = Locale('en');
      when(mockSharedPreferences.getString(any))
          .thenReturn(locale.languageCode);

      // act
      final result = await dataSource.getStoredLanguageCode();

      // assert
      expect(result, locale.languageCode);
    },
  );
}
