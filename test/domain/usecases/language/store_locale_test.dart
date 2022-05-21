import 'package:flutter/material.dart';
import 'package:flutter_resources/core/params/language/store_language_code_params.dart';
import 'package:flutter_resources/domain/usecases/langugae/store_locale.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helpers.mocks.dart';

void main() {
  late StoreLocale usecase;
  late MockLanguageRepository repository;

  setUp(() {
    repository = MockLanguageRepository();
    usecase = StoreLocale(repository);
  });

  test(
    "should make sure the method storeLanguageCode is called",
    () async {
      // arrange
      when(repository.storeLocale(any)).thenAnswer((_) => Future.value());

      // act
      await usecase(StoreLocaleParams(const Locale('vi_VN')));

      // assert
      verify(repository.storeLocale(any)).called(1);
    },
  );
}
