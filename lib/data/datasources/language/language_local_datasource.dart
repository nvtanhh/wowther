import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/storage_constants.dart';

abstract class LanguageLocalDataSource {
  /// Gets the cached [Locale] which was saved the last time if it was stored.
  /// Otherwise, returns the default [Locale]
  Future<Locale> getStoredOrDefaultLocale();

  /// Save [Locale.languageCode] to the cache
  Future<void> storeLocale(Locale locale);

  /// return supported languages
  Future<List<Locale>> getSupportedLocales();
}

@Injectable(as: LanguageLocalDataSource)
class LanguageLocalDataSourceImpl implements LanguageLocalDataSource {
  final SharedPreferences _sharedPreferences;
  LanguageLocalDataSourceImpl(this._sharedPreferences);

  @override
  Future<Locale> getStoredOrDefaultLocale() async {
    // final _sharedPreferences.getString(StorageConstants.language);
    throw UnimplementedError();
  }

  @override
  Future<void> storeLocale(Locale locale) {
    return _sharedPreferences.setString(
      StorageConstants.language,
      locale.languageCode,
    );
  }

  @override
  Future<List<Locale>> getSupportedLocales() {
    // TODO: implement getSupportedLocales
    throw UnimplementedError();
  }
}
