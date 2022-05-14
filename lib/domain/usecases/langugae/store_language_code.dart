import 'package:injectable/injectable.dart';

import '../../repositories/language_repository.dart';

@injectable
class StoreLanguageCode {
  final LanguageRepository _languageRepository;

  StoreLanguageCode(this._languageRepository);

  Future<void> call(String languageCode) async {
    return _languageRepository.storeLanguageCode(languageCode);
  }
}
