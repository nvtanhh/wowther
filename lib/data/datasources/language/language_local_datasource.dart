import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/storage_constants.dart';

abstract class LanguageLocalDataSource {
  /// return supported languages
  Future<List<Locale>> getSupportedLocales();

  /// Gets the cached [Locale] which was saved the last time if it was stored.
  /// Otherwise, returns the default [Locale]
  Future<String?> getStoredLanguageCode();

  /// Save [Locale.languageCode] to the cache
  Future<void> storeLocale(Locale locale);
}

@Injectable(as: LanguageLocalDataSource)
class LanguageLocalDataSourceImpl implements LanguageLocalDataSource {
  final SharedPreferences _sharedPreferences;
  LanguageLocalDataSourceImpl(this._sharedPreferences);

  @override
  Future<String?> getStoredLanguageCode() async {
    return _sharedPreferences.getString(StorageConstants.language);
  }

  @override
  Future<void> storeLocale(Locale locale) {
    return _sharedPreferences.setString(
      StorageConstants.language,
      locale.languageCode,
    );
  }

  @override
  Future<List<Locale>> getSupportedLocales() async {
    return AppConstants.supportedLocales;
  }
}
