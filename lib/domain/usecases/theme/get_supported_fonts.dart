import 'package:injectable/injectable.dart';

import '../../../core/params/no_params.dart';
import '../../../core/usecases/usecase.dart';
import '../../repositories/theme_repository.dart';

@injectable
class GetSupportedFonts implements UseCase<List<String>, NoParams> {
  final ThemeRepository _themeRepository;

  GetSupportedFonts(this._themeRepository);

  @override
  Future<List<String>> call(NoParams noParams) async {
    return _themeRepository.getSupportedFonts();
  }
}
