import 'dart:ui';

abstract class LanguageRepository {
  Future<Locale> getDefaultLocale();
  Future<List<Locale>> getSupportedLocales();
  Future<String?> getStoredLanguageCode();
  Future<void> storeLanguageCode(String languageCode);
}
