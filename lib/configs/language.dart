import 'dart:ui';

class LanguageConfiguration {
  static const List<Locale> supportedLocales = [
    Locale('en', 'US'),
    Locale('vi', 'VN'),
  ];

  static Locale get defaultLocale => supportedLocales.first;
}
