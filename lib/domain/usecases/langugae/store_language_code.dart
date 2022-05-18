import 'package:injectable/injectable.dart';

import '../../../core/params/language/store_language_code_params.dart';
import '../../../core/usecases/usecase.dart';
import '../../repositories/language_repository.dart';

@injectable
class StoreLanguageCode implements UseCase<void, StoreLanguageCodeParams> {
  final LanguageRepository _languageRepository;

  StoreLanguageCode(this._languageRepository);

  @override
  Future<void> call(StoreLanguageCodeParams params) async {
    return _languageRepository.storeLanguageCode(params.languageCode);
  }
}
