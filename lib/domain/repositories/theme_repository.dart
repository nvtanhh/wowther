import '../entities/app_theme_data.dart';
import '../entities/color_theme.dart';

abstract class ThemeRepository {
  Future<List<String>> getSupportedFonts();
  Future<List<ColorTheme>> getSupportedColorThemes();

  Future<AppThemeData> getStoredOrDefaultAppThemeData();
  Future<void> storeAppThemeData(AppThemeData appThemeData);
}
