import 'package:flutter_resources/core/params/no_params.dart';
import 'package:flutter_resources/domain/usecases/langugae/get_stored_language_code.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helpers.mocks.dart';

void main() {
  late GetStoredLanguageCode usecase;
  late MockLanguageRepository repository;

  setUp(() {
    repository = MockLanguageRepository();
    usecase = GetStoredLanguageCode(repository);
  });

  const storedLanguageCode = 'vi';

  test(
    "should return the stored language code",
    () async {
      // arrange
      when(repository.getStoredLanguageCode())
          .thenAnswer((_) => Future.value(storedLanguageCode));

      // act
      final result = await usecase(NoParams());

      // assert
      expect(result, storedLanguageCode);
    },
  );
}
