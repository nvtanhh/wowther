import 'dart:ui';

import 'package:injectable/injectable.dart';

import '../../../core/params/no_params.dart';
import '../../../core/usecases/usecase.dart';
import '../../repositories/language_repository.dart';

@injectable
class GetDefaultLocale implements UseCase<Locale, NoParams> {
  final LanguageRepository _languageRepository;

  GetDefaultLocale(this._languageRepository);

  @override
  Future<Locale> call(NoParams params) async {
    return _languageRepository.getDefaultLocale();
  }
}
