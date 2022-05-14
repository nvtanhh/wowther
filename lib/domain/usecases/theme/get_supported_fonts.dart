import 'package:injectable/injectable.dart';

import '../../repositories/theme_repository.dart';

@injectable
class GetSupportedFonts {
  final ThemeRepository _themeRepository;

  GetSupportedFonts(this._themeRepository);

  Future<List<String>> call() async {
    return _themeRepository.getSupportedFonts();
  }
}