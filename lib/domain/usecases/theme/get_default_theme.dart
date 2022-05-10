import 'package:injectable/injectable.dart';

import '../../entities/theme_entity.dart';
import '../../repositories/theme_repository.dart';

@injectable
class GetDefaultTheme {
  final ThemeRepository themeRepository;

  GetDefaultTheme(this.themeRepository);

  Future<ThemeEntity> call() async {
    return themeRepository.getDefaultTheme();
  }
}
