import 'package:injectable/injectable.dart';

import '../../entities/theme_entity.dart';
import '../../repositories/theme_repository.dart';

@injectable
class StoreThemeColor {
  final ThemeRepository _themeRepository;

  StoreThemeColor(this._themeRepository);

  Future<void> call(ThemeColorEntity theme) async {
    return _themeRepository.storeThemeColor(theme);
  }
}
