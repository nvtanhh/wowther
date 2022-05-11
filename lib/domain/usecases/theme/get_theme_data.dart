import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../entities/theme_entity.dart';
import '../../repositories/theme_repository.dart';

@injectable
class GetThemeData {
  final ThemeRepository _themeRepository;

  GetThemeData(this._themeRepository);

  Future<ThemeData> call({
    required ThemeColorEntity theme,
    required Brightness brightness,
    String? font,
  }) async {
    return _themeRepository.getThemeData(
      theme: theme,
      brightness: brightness,
      font: font,
    );
  }
}
