import 'package:injectable/injectable.dart';

import '../../repositories/theme_repository.dart';

@injectable
class GetStorageOrDefaultFont {
  final ThemeRepository themeRepository;

  GetStorageOrDefaultFont(this.themeRepository);

  Future<String> call() async {
    return themeRepository.getStorageOrDefaultFont();
  }
}
