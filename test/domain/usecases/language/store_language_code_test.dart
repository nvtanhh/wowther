import 'package:flutter/material.dart';
import 'package:flutter_resources/core/params/language/store_language_code_params.dart';
import 'package:flutter_resources/core/params/no_params.dart';
import 'package:flutter_resources/domain/usecases/langugae/get_supported_locales.dart';
import 'package:flutter_resources/domain/usecases/langugae/store_language_code.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helpers.mocks.dart';

void main() {
  late StoreLanguageCode usecase;
  late MockLanguageRepository repository;

  setUp(() {
    repository = MockLanguageRepository();
    usecase = StoreLanguageCode(repository);
  });

  test(
    "should make sure the method storeLanguageCode is called",
    () async {
      // arrange
      when(repository.storeLanguageCode(any)).thenAnswer((_) => Future.value());

      // act
      await usecase(StoreLanguageCodeParams('vi'));

      // assert
      verify(repository.storeLanguageCode(any)).called(1);
    },
  );
}
