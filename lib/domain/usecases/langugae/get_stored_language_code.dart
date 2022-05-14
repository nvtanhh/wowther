import 'package:injectable/injectable.dart';

import '../../repositories/language_repository.dart';

@injectable
class GetStoredLanguageCode {
  final LanguageRepository _languageRepository;

  GetStoredLanguageCode(this._languageRepository);

  Future<String?> call() async {
    return _languageRepository.getStoredLanguageCode();
  }
}
