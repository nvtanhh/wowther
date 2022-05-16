import 'package:injectable/injectable.dart';

import '../../domain/entities/app_theme_data.dart';
import '../../domain/entities/enums/theme_dark_option.dart';
import '../../domain/repositories/theme_repository.dart';
import '../datasources/local/theme_local_datasource.dart';
import '../models/app_theme_data_model.dart';
import '../models/theme_model.dart';

@Injectable(as: ThemeRepository)
class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeLocalDataSource _localDatasource;

  ThemeRepositoryImpl(this._localDatasource);

  @override
  Future<List<String>> getSupportedFonts() async {
    return _localDatasource.supportedFonts;
  }

  @override
  Future<List<ThemeColorModel>> getSupportedThemeColors() async {
    return _localDatasource.supportedThemes
        .map((item) => ThemeColorModel.fromJson(item))
        .toList();
  }

  @override
  Future<AppThemeDataModel> getStoredAppThemeData() async {
    final storedTheme = await _localDatasource.getStoredAppThemeData();
    return storedTheme ?? _getDefaultAppThemeData();
  }

  AppThemeDataModel _getDefaultAppThemeData() {
    return AppThemeDataModel(
      colorTheme: ThemeColorModel.fromJson(_localDatasource.defaultColorTheme),
      font: _localDatasource.defaultFont,
      darkOption: DarkModeOption.dynamic,
    );
  }

  @override
  void storeAppThemeData(AppThemeDataEntity theme) {
    _localDatasource.storeAppThemeData(theme);
  }
}
