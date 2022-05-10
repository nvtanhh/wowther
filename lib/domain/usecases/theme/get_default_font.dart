import 'package:injectable/injectable.dart';

import '../../repositories/theme_repository.dart';

@injectable
class GetDefaultFont {
  final ThemeRepository themeRepository;

  GetDefaultFont(this.themeRepository);

  Future<String> call() async {
    return themeRepository.getDefaultFont();
  }
}
