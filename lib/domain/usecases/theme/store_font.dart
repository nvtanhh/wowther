import 'package:injectable/injectable.dart';

import '../../repositories/theme_repository.dart';

@injectable
class StoreFont {
  final ThemeRepository _themeRepository;

  StoreFont(this._themeRepository);

  Future<void> call(String font) async {
    return _themeRepository.storeFont(font);
  }
}
