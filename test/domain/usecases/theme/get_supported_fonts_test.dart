import 'package:flutter_resources/core/params/params.index.dart';
import 'package:flutter_resources/domain/usecases/theme/get_supported_fonts.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helpers.mocks.dart';

void main() {
  late GetSupportedFonts usecase;
  late MockThemeRepository repository;
  setUp(() {
    repository = MockThemeRepository();
    usecase = GetSupportedFonts(repository);
  });
  final supportedFonts = ['Open Sans', 'Roboto'];
  test(
    "should return supported fonts from the repository",
    () async {
      // arrange
      when(repository.getSupportedFonts())
          .thenAnswer((_) => Future.value(supportedFonts));

      // act
      final result = await usecase.call(NoParams());

      // assert
      expect(result, supportedFonts);
    },
  );
}
