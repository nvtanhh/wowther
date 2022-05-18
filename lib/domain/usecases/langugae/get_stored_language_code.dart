import 'package:injectable/injectable.dart';

import '../../../core/params/no_params.dart';
import '../../../core/usecases/usecase.dart';
import '../../repositories/language_repository.dart';

@injectable
class GetStoredLanguageCode implements UseCase<String?, NoParams> {
  final LanguageRepository _languageRepository;

  GetStoredLanguageCode(this._languageRepository);

  @override
  Future<String?> call(NoParams params) async {
    return _languageRepository.getStoredLanguageCode();
  }
}
