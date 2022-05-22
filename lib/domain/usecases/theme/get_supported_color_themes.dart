import 'package:injectable/injectable.dart';

import '../../../core/params/no_params.dart';
import '../../../core/usecases/usecase.dart';
import '../../entities/color_theme.dart';
import '../../repositories/theme_repository.dart';

@injectable
class GetSupportedColorThemes implements UseCase<List<ColorTheme>, NoParams> {
  final ThemeRepository _themeRepository;

  GetSupportedColorThemes(this._themeRepository);

  @override
  Future<List<ColorTheme>> call(NoParams noParams) async {
    return _themeRepository.getSupportedColorThemes();
  }
}
