import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/injector/injection.dart';
import '../../../core/constants/constants.index.dart';
import '../../../domain/entities/app_theme_data.dart';
import '../../models/app_theme_data_model.dart';

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

  Map<String, dynamic> defaultColorTheme = {
    "name": "default",
    "primary": 'ff82B541',
    "secondary": "ffff8a65",
  };

  Future<AppThemeDataModel?> getStoredAppThemeData() async {
    try {
      final data = _preferencesStorage.getString(StorageConstants.theme);
      return data != null
          ? AppThemeDataModel.fromJson(jsonDecode(data) as Map<String, dynamic>)
          : null;
    } catch (e) {
      locator<Logger>().e(e.toString());
      _preferencesStorage.remove(StorageConstants.theme);
      return null;
    }
  }

  void storeAppThemeData(AppThemeData theme) {
    _preferencesStorage.setString(
      StorageConstants.theme,
      jsonEncode(
        AppThemeDataModel.fromEntity(theme).toJson(),
      ),
    );
  }
}
