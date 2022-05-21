import 'package:flutter/material.dart';
import 'package:flutter_resources/data/repositories/language_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helpers.mocks.dart';

void main() {
  late LanguageRepositoryImpl repository;
  late MockLanguageLocalDataSource mockLocalDataSource;

  setUp(() {
    mockLocalDataSource = MockLanguageLocalDataSource();
    repository = LanguageRepositoryImpl(mockLocalDataSource);
  });

  test('should return supported languages', () async {
    const List<Locale> supportedLocales = [
      Locale('en', 'US'),
      Locale('vi', 'VN'),
    ];
    // arrange
    when(repository.getSupportedLocales())
        .thenAnswer((_) => Future.value(supportedLocales));

    // act
    final result = await repository.getSupportedLocales();

    // assert
    expect(result, supportedLocales);
  });

  test(
    "should return the stored or default locale",
    () async {
      const Locale locale = Locale('vi', 'VN');
      // arrange
      when(mockLocalDataSource.getStoredOrDefaultLocale())
          .thenAnswer((_) => Future.value(locale));

      // act
      final result = await repository.getStoredOrDefaultLocale();

      // assert
      expect(result, locale);
    },
  );

  test(
    "should store the language code",
    () async {
      const Locale locale = Locale('vi', 'VN');
      // arrange
      when(mockLocalDataSource.storeLocale(any))
          .thenAnswer((_) => Future.value());

      // act
      await repository.storeLocale(locale);

      // assert
      verify(mockLocalDataSource.storeLocale(any)).called(1);
    },
  );
}
