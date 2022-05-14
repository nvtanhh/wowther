import 'dart:ui';

import 'package:injectable/injectable.dart';

import '../../repositories/language_repository.dart';

@injectable
class GetDefaultLocale {
  final LanguageRepository _languageRepository;

  GetDefaultLocale(this._languageRepository);

  Future<Locale> call() async {
    return _languageRepository.getDefaultLocale();
  }
}
