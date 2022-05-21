import 'package:injectable/injectable.dart';

import '../../domain/entities/app_theme_data.dart';
import '../../domain/entities/theme_entity.dart';
import '../../domain/repositories/theme_repository.dart';
import '../datasources/theme/theme_local_datasource.dart';

@Injectable(as: ThemeRepository)
class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeLocalDataSource _localDatasource;

  ThemeRepositoryImpl(this._localDatasource);

  @override
  Future<List<String>> getSupportedFonts() async {
    return _localDatasource.getSupportedFonts();
  }

  @override
  Future<List<ColorTheme>> getSupportedColorThemes() async {
    return _localDatasource.getSupportedColorThemes();
  }

  @override
  Future<AppThemeData> getStoredOrDefaultAppThemeData() async {
    return _localDatasource.getStoredOrDefaultAppThemeData();
  }

  @override
  Future<void> storeAppThemeData(AppThemeData theme) async {
    _localDatasource.storeAppThemeData(theme);
  }
}
