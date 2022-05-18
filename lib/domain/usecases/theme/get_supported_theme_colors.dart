import 'package:injectable/injectable.dart';

import '../../../core/params/no_params.dart';
import '../../../core/usecases/usecase.dart';
import '../../entities/theme_entity.dart';
import '../../repositories/theme_repository.dart';

@injectable
class GetSupportedThemeColors implements UseCase<List<ColorTheme>, NoParams> {
  final ThemeRepository _themeRepository;

  GetSupportedThemeColors(this._themeRepository);

  @override
  Future<List<ColorTheme>> call(NoParams noParams) async {
    return _themeRepository.getSupportedThemeColors();
  }
}
