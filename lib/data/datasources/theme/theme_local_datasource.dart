import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/storage_constants.dart';
import '../../../domain/entities/app_theme_data.dart';
import '../../../domain/entities/enums/theme_dark_option.dart';
import '../../models/app_theme_data_model.dart';
import '../../models/theme_model.dart';

abstract class ThemeLocalDatasource {
  /// Gets the cached [AppThemeData] which was saved the last time if it was stored.
  /// Otherwise, returns the default [AppThemeData]
  ///
  /// Return [null] if no cached data is present.
  Future<AppThemeDataModel> getStoredOrDefaultAppThemeData();

  /// Save [AppThemeData] to the cache
  Future<void> storeAppThemeData(AppThemeData theme);

  Future<List<String>> getSupportedFonts();

  Future<List<ColorThemeModel>> getSupportedColorThemes();
}

@Injectable(as: ThemeLocalDatasource)
class ThemeLocalDataSourceImpl implements ThemeLocalDatasource {
  final SharedPreferences _preferencesStorage;
  ThemeLocalDataSourceImpl(this._preferencesStorage);

  @override
  Future<AppThemeDataModel> getStoredOrDefaultAppThemeData() async {
    final storedData = _preferencesStorage.getString(StorageConstants.theme);
    if (storedData != null) {
      return AppThemeDataModel.fromJson(
        jsonDecode(storedData) as Map<String, dynamic>,
      );
    }
    // return default theme
    final font = AppConstants.supportedFonts.first;
    final colorTheme =
        ColorThemeModel.fromJson(AppConstants.supportedColorThemes.first);
    return AppThemeDataModel(
      font: font,
      colorTheme: colorTheme,
      darkOption: DarkModeOption.dynamic,
    );
  }

  @override
  Future<void> storeAppThemeData(AppThemeData theme) async {
    _preferencesStorage.setString(
      StorageConstants.theme,
      jsonEncode(
        AppThemeDataModel.fromEntity(theme).toJson(),
      ),
    );
  }

  @override
  Future<List<ColorThemeModel>> getSupportedColorThemes() async {
    return AppConstants.supportedColorThemes
        .map((e) => ColorThemeModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<String>> getSupportedFonts() async {
    return AppConstants.supportedFonts;
  }
}
