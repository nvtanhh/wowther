import 'package:flutter/material.dart';
import 'package:flutter_resources/core/params/no_params.dart';
import 'package:flutter_resources/presentation/shared_blocs/language/language_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helpers.mocks.dart';

void main() {
  late LanguageCubit languageCubit;
  late MockGetStoredOrDefaultLocale mockGetStoredOrDefaultLocale;
  late MockGetSupportedLocales mockGetSupportedLocales;
  late MockStoreLocale mockStoreLocale;

  setUp(() {
    mockGetSupportedLocales = MockGetSupportedLocales();
    mockGetStoredOrDefaultLocale = MockGetStoredOrDefaultLocale();
    mockStoreLocale = MockStoreLocale();
    languageCubit = LanguageCubit(
      mockGetStoredOrDefaultLocale,
      mockGetSupportedLocales,
      mockStoreLocale,
    );
  });

  const supportedLocales = [
    Locale('en', 'US'),
    Locale('pt', 'BR'),
  ];

  test(
    "should emit the init value when init called",
    () async {
      // arrange

      when(mockGetStoredOrDefaultLocale(NoParams()))
          .thenAnswer((_) => Future.value(supportedLocales.first));
      when(mockGetSupportedLocales(NoParams()))
          .thenAnswer((_) => Future.value(supportedLocales));

      // act
      await languageCubit.init();

      // assert
      expect(languageCubit.state.locale, supportedLocales.first);
      expect(languageCubit.state.supportedLocales, supportedLocales);
    },
  );

  test(
    "should emit new locale when changeLocale called && store the locale to repository",
    () async {
      // arrange

      // act
      languageCubit.changeLanguage(supportedLocales.last);

      // assert
      verify(mockStoreLocale(any)).called(1);
      expect(languageCubit.state.locale, supportedLocales.last);
    },
  );
}
