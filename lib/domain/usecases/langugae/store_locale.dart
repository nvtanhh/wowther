import 'package:injectable/injectable.dart';

import '../../../core/params/language/store_language_code_params.dart';
import '../../../core/usecases/usecase.dart';
import '../../repositories/language_repository.dart';

@injectable
class StoreLocale implements UseCase<void, StoreLocaleParams> {
  final LanguageRepository _languageRepository;

  StoreLocale(this._languageRepository);

  @override
  Future<void> call(StoreLocaleParams params) async {
    return _languageRepository.storeLocale(params.locale);
  }
}
