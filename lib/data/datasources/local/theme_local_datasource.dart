import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/constants/constants.index.dart';
import '../../../common/utils/utils.index.dart';
import '../../../domain/entities/enums/theme_dark_option.dart';
import '../../../domain/entities/theme_entity.dart';
import '../../../injector/injection.dart';
import '../../models/theme_model.dart';

@injectable
class ThemeLocalDataSource {
  final SharedPreferences _preferencesStorage;
  ThemeLocalDataSource(this._preferencesStorage);

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

  String? getStoredFont() {
    return _preferencesStorage.getString(StorageConstants.font);
  }

  void storeFont(String font) {
    _preferencesStorage.setString(StorageConstants.font, font);
  }

  ThemeColorModel? getStoredTheme() {
    try {
      final data = _preferencesStorage.getString(StorageConstants.themeColor);
      return data != null
          ? ThemeColorModel.fromJson(jsonDecode(data) as Map<String, dynamic>)
          : null;
    } catch (e) {
      locator<Logger>().logError(e.toString());
      _preferencesStorage.remove(StorageConstants.themeColor);
      return null;
    }
  }

  void storeThemeColor(ThemeColorEntity theme) {
    _preferencesStorage.setString(
      StorageConstants.themeColor,
      jsonEncode((theme as ThemeColorModel).toJson()),
    );
  }

  Future<DarkModeOption?> getStoredDarkModeOption() async {
    try {
      final data =
          _preferencesStorage.getString(StorageConstants.darkModeOption);
      if (data == null) return null;
      return DarkModeOption.values.firstWhere((item) => item.name == data);
    } catch (e) {
      locator<Logger>().logError(e.toString());
      _preferencesStorage.remove(StorageConstants.darkModeOption);
      return null;
    }
  }

  void storeDarkModeOption(DarkModeOption darkModeOption) {
    _preferencesStorage.setString(
      StorageConstants.darkModeOption,
      darkModeOption.name,
    );
  }
}
