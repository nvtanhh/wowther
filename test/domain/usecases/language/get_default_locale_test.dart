import 'package:flutter/material.dart';
import 'package:flutter_resources/core/params/no_params.dart';
import 'package:flutter_resources/domain/usecases/langugae/get_default_locale.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helpers.mocks.dart';

void main() {
  late GetDefaultLocale usecase;
  late MockLanguageRepository repository;

  setUp(() {
    repository = MockLanguageRepository();
    usecase = GetDefaultLocale(repository);
  });

  const defaultLocale = Locale('vi', 'VN');

  test(
    "should return the default locale from local repository",
    () async {
      // arrange
      when(repository.getDefaultLocale())
          .thenAnswer((_) => Future.value(defaultLocale));

      // act
      final result = await usecase(NoParams());

      // assert
      expect(result, defaultLocale);
    },
  );
}
