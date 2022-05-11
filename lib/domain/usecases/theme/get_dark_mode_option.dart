import 'package:injectable/injectable.dart';

import '../../entities/enums/theme_dark_option.dart';
import '../../repositories/theme_repository.dart';

@injectable
class GetDarkModeOption {
  final ThemeRepository _themeRepository;

  GetDarkModeOption(this._themeRepository);

  Future<DarkModeOption> call() async {
    return _themeRepository.getDarkModeOption();
  }
}
