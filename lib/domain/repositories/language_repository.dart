import 'dart:ui';

abstract class LanguageRepository {
  Future<Locale> getStoredOrDefaultLocale();
  Future<List<Locale>> getSupportedLocales();
  // Future<String?> getStoredLanguageCode();
  Future<void> storeLocale(Locale locale);
}
