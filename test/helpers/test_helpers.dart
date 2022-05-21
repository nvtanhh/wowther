import 'package:flutter_resources/data/datasources/language/language_local_datasource.dart';
import 'package:flutter_resources/data/datasources/theme/theme_local_datasource.dart';
import 'package:flutter_resources/data/repositories/language_repository_impl.dart';
import 'package:flutter_resources/data/repositories/theme_repository_impl.dart';
import 'package:flutter_resources/domain/repositories/language_repository.dart';
import 'package:flutter_resources/domain/repositories/theme_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateMocks([
  // Shared preferences
  SharedPreferences,
  // Theme
  ThemeRepository,
  ThemeRepositoryImpl,
  ThemeLocalDataSource,
  // Language
  LanguageRepository,
  LanguageRepositoryImpl,
  LanguageLocalDataSource,
])
void main() {}
