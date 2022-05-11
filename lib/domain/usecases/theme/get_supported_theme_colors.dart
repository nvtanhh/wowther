import 'package:injectable/injectable.dart';

import '../../entities/theme_entity.dart';
import '../../repositories/theme_repository.dart';

@injectable
class GetSupportedThemeColors {
  final ThemeRepository _themeRepository;

  GetSupportedThemeColors(this._themeRepository);

  Future<List<ThemeColorEntity>> call() async {
    return _themeRepository.getSupportedThemeColors();
  }
}
