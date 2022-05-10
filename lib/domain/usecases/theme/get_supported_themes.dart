import 'package:injectable/injectable.dart';

import '../../entities/theme_entity.dart';
import '../../repositories/theme_repository.dart';

@injectable
class GetSupportedThemes {
  final ThemeRepository themeRepository;

  GetSupportedThemes(this.themeRepository);

  Future<List<ThemeEntity>> call() async {
    return themeRepository.getSupportedThemes();
  }
}
