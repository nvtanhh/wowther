import 'package:injectable/injectable.dart';

import '../../entities/theme_entity.dart';
import '../../repositories/theme_repository.dart';

@injectable
class GetStorageOrDefaultTheme {
  final ThemeRepository themeRepository;

  GetStorageOrDefaultTheme(this.themeRepository);

  Future<ThemeEntity> call() async {
    return themeRepository.getStorageOrDefaultTheme();
  }
}
