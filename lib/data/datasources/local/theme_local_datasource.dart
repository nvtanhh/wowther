import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/entities/theme_entity.dart';
import '../../../injector/injection.dart';
import '../../models/theme_model.dart';

@injectable
class ThemeLocalDataSource {
  final String defaultFont = 'ProximaNova';

  final List<String> supportedFonts = [
    "OpenSans",
    "ProximaNova",
    "Raleway",
    "Roboto",
    "Merriweather",
  ];

  final List<Map<String, dynamic>> supportedThemes = [
    {
      "name": "default",
      "primary": 'ff82B541',
      "secondary": "ffff8a65",
    },
    {
      "name": "orange",
      "primary": 'fff4a261',
      "secondary": "ff2A9D8F",
    },
    {
      "name": "blue",
      "primary": 'ff077ef0',
      "secondary": "ff5B876C",
    },
    {
      "name": "summer",
      "primary": 'ff53ac7d',
      "secondary": "ff832400",
    },
  ];

  String? getStorageFont() {
    return locator<SharedPreferences>().getString('font');
  }

  void storeFont(String font) {
    locator<SharedPreferences>().setString('font', font);
  }

  ThemeModel? getStorageTheme() {
    final data = locator<SharedPreferences>().getString('theme');
    return data != null
        ? ThemeModel.fromJson(json.decode(data) as Map<String, dynamic>)
        : null;
  }

  void storeTheme(ThemeEntity theme) {
    locator<SharedPreferences>()
        .setString('theme', (theme as ThemeModel).toJson().toString());
  }
}
