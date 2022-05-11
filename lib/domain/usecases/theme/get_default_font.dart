import 'package:injectable/injectable.dart';

import '../../repositories/theme_repository.dart';

@injectable
class GetStorageOrDefaultFont {
  final ThemeRepository _themeRepository;

  GetStorageOrDefaultFont(this._themeRepository);

  Future<String> call() async {
    return _themeRepository.getStorageOrDefaultFont();
  }
}
