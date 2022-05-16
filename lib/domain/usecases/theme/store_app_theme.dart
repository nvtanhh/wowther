import 'package:injectable/injectable.dart';

import '../../entities/app_theme_data.dart';
import '../../repositories/theme_repository.dart';

@injectable
class StoreAppThemeData {
  final ThemeRepository _themeRepository;

  StoreAppThemeData(this._themeRepository);

  Future<void> call(AppThemeDataEntity theme) async {
    return _themeRepository.storeAppThemeData(theme);
  }
}
