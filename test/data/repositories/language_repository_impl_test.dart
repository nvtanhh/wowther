import 'package:flutter/material.dart';
import 'package:flutter_resources/data/repositories/language_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helpers.mocks.dart';

void main() {
  late LanguageRepositoryImpl repository;
  late MockLanguageLocalDatasource mockLocalDataSource;

  setUp(() {
    mockLocalDataSource = MockLanguageLocalDatasource();
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

  group('getStoredOrDefaultLocale', () {
    test(
      "should return the stored if it was stored",
      () async {
        const Locale locale = Locale('vi', 'VN');
        // arrange
        when(mockLocalDataSource.getStoredLanguageCode())
            .thenAnswer((_) => Future.value(locale.languageCode));
        when(mockLocalDataSource.getSupportedLocales()).thenAnswer(
          (_) => Future.value([locale, const Locale('en', 'US')]),
        );

        // act
        final result = await repository.getStoredOrDefaultLocale();

        // assert
        expect(result, locale);
      },
    );

    test(
      "should return the default locale if it was not stored. The default locale is the first one in the list of supported locales",
      () async {
        const Locale defaultLocale = Locale('en', 'US');
        // arrange
        when(mockLocalDataSource.getStoredLanguageCode())
            .thenAnswer((_) => Future.value());
        when(mockLocalDataSource.getSupportedLocales()).thenAnswer(
          (_) => Future.value([
            defaultLocale,
            const Locale('vi', 'VN'),
          ]),
        );

        // act
        final result = await repository.getStoredOrDefaultLocale();

        // assert
        expect(result, defaultLocale);
      },
    );
  });

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
