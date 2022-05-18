import '../entities/app_theme_data.dart';
import '../entities/theme_entity.dart';

abstract class ThemeRepository {
  Future<List<String>> getSupportedFonts();
  Future<List<ColorTheme>> getSupportedThemeColors();

  Future<AppThemeData> getStoredOrDefaultAppThemeData();
  Future<void> storeAppThemeData(AppThemeData appThemeData);
}
