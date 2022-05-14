import 'dart:ui';

import 'package:injectable/injectable.dart';

import '../../repositories/language_repository.dart';

@injectable
class GetSupportedLocales {
  final LanguageRepository _languageRepository;

  GetSupportedLocales(this._languageRepository);

  Future<List<Locale>> call() async {
    return _languageRepository.getSupportedLocales();
  }
}
