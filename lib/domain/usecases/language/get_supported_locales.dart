import 'dart:ui';

import 'package:injectable/injectable.dart';

import '../../../core/params/no_params.dart';
import '../../../core/usecases/usecase.dart';
import '../../repositories/language_repository.dart';

@injectable
class GetSupportedLocales implements UseCase<List<Locale>, NoParams> {
  final LanguageRepository _languageRepository;

  GetSupportedLocales(this._languageRepository);

  @override
  Future<List<Locale>> call(NoParams params) async {
    return _languageRepository.getSupportedLocales();
  }
}
