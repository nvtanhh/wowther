import 'package:injectable/injectable.dart';

import '../../repositories/theme_repository.dart';

@injectable
class GetSupportedFonts {
  final ThemeRepository themeRepository;

  GetSupportedFonts(this.themeRepository);

  Future<List<String>> call() async {
    return themeRepository.getSupportedFonts();
  }
}
