import 'dart:ui';

import 'package:injectable/injectable.dart';

import '../../../core/params/no_params.dart';
import '../../../core/usecases/usecase.dart';
import '../../repositories/language_repository.dart';

@injectable
class GetStoredOrDefaultLocale implements UseCase<Locale, NoParams> {
  final LanguageRepository _languageRepository;

  GetStoredOrDefaultLocale(this._languageRepository);

  @override
  Future<Locale> call(NoParams params) async {
    return _languageRepository.getStoredOrDefaultLocale();
  }
}
