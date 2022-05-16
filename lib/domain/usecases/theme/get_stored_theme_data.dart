import 'package:injectable/injectable.dart';

import '../../entities/app_theme_data.dart';
import '../../repositories/theme_repository.dart';

@injectable
class GetStoredAppThemeData {
  final ThemeRepository _themeRepository;

  GetStoredAppThemeData(this._themeRepository);

  Future<AppThemeDataEntity> call() async {
    return _themeRepository.getStoredAppThemeData();
  }
}
