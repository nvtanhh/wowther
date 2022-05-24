import 'package:flutter_resources/data/datasources/language/language_local_datasource.dart';
import 'package:flutter_resources/data/datasources/theme/theme_local_datasource.dart';
import 'package:flutter_resources/data/datasources/weather/weather_local_datasource.dart';
import 'package:flutter_resources/data/datasources/weather/weather_remote_datasource.dart';
import 'package:flutter_resources/data/repositories/language_repository_impl.dart';
import 'package:flutter_resources/data/repositories/theme_repository_impl.dart';
import 'package:flutter_resources/domain/repositories/language_repository.dart';
import 'package:flutter_resources/domain/repositories/theme_repository.dart';
import 'package:flutter_resources/domain/repositories/weather_repository.dart';
import 'package:flutter_resources/domain/usecases/langugae/get_stored_or_default_locale.dart';
import 'package:flutter_resources/domain/usecases/langugae/get_supported_locales.dart';
import 'package:flutter_resources/domain/usecases/langugae/store_locale.dart';
import 'package:flutter_resources/domain/usecases/theme/get_stored_theme_data.dart';
import 'package:flutter_resources/domain/usecases/theme/get_supported_color_themes.dart';
import 'package:flutter_resources/domain/usecases/theme/get_supported_fonts.dart';
import 'package:flutter_resources/domain/usecases/theme/store_app_theme.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateMocks([
  // Shared preferences
  SharedPreferences,
  // Theme
  ThemeRepository,
  ThemeLocalDatasource,
  GetSupportedFonts,
  GetSupportedColorThemes,
  GetStoredOrDefaultAppThemeData,
  StoreAppThemeData,
  // Language
  LanguageRepository,
  LanguageLocalDatasource,
  GetStoredOrDefaultLocale,
  GetSupportedLocales,
  StoreLocale,
  // Weather
  WeatherRepository,
  WeatherRemoteDatasource,
  WeatherLocalDatasource,
])
void main() {}
