import 'dart:ui';

abstract class LanguageRepository {
  Future<Locale> getStoredOrDefaultLocale();
  Future<List<Locale>> getSupportedLocales();
  Future<void> storeLocale(Locale locale);
}
