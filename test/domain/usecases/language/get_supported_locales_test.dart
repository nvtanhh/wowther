import 'package:flutter/material.dart';
import 'package:flutter_resources/core/params/no_params.dart';
import 'package:flutter_resources/domain/usecases/language/get_supported_locales.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helpers.mocks.dart';

void main() {
  late GetSupportedLocales usecase;
  late MockLanguageRepository repository;

  setUp(() {
    repository = MockLanguageRepository();
    usecase = GetSupportedLocales(repository);
  });

  const supportedLocales = [
    Locale('vi', 'VN'),
    Locale('en', 'US'),
  ];
  test(
    "should return the supported locales",
    () async {
      // arrange
      when(repository.getSupportedLocales())
          .thenAnswer((_) => Future.value(supportedLocales));

      // act
      final result = await usecase(NoParams());

      // assert
      expect(result, supportedLocales);
    },
  );
}
