import 'package:injectable/injectable.dart';

import '../../entities/enums/theme_dark_option.dart';
import '../../repositories/theme_repository.dart';

@injectable
class StoreDarkModeOption {
  final ThemeRepository _themeRepository;

  StoreDarkModeOption(this._themeRepository);

  Future<void> call(DarkModeOption option) async {
    return _themeRepository.storeDarkModeOption(option);
  }
}
