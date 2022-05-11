import 'package:injectable/injectable.dart';

import '../../entities/theme_entity.dart';
import '../../repositories/theme_repository.dart';

@injectable
class GetStorageOrDefaultThemeColor {
  final ThemeRepository _themeRepository;

  GetStorageOrDefaultThemeColor(this._themeRepository);

  Future<ThemeColorEntity> call() async {
    return _themeRepository.getStorageOrDefaultThemeColor();
  }
}
