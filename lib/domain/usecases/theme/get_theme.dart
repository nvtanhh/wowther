import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../entities/theme_entity.dart';
import '../../repositories/theme_repository.dart';

@injectable
class GetTheme {
  final ThemeRepository themeRepository;

  GetTheme(this.themeRepository);

  Future<ThemeData> call({
    required ThemeEntity theme,
    required Brightness brightness,
    String? font,
  }) async {
    return themeRepository.getTheme(
      theme: theme,
      brightness: brightness,
      font: font,
    );
  }
}
