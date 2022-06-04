import 'package:flutter/material.dart';
import 'package:flutter_resources/core/params/no_params.dart';
import 'package:flutter_resources/domain/usecases/language/get_stored_or_default_locale.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helpers.mocks.dart';

void main() {
  late GetStoredOrDefaultLocale usecase;
  late MockLanguageRepository repository;

  setUp(() {
    repository = MockLanguageRepository();
    usecase = GetStoredOrDefaultLocale(repository);
  });

  const defaultLocale = Locale('vi', 'VN');

  test(
    "should return stored or default locale from repository",
    () async {
      // arrange
      when(repository.getStoredOrDefaultLocale())
          .thenAnswer((_) => Future.value(defaultLocale));

      // act
      final result = await usecase(NoParams());

      // assert
      expect(result, defaultLocale);
    },
  );
}
