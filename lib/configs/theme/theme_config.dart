import 'models.dart';

class ThemeConfiguration {
  static const List<String> supportedFonts = [
    "OpenSans",
    "ProximaNova",
    "Raleway",
    "Roboto",
    "Merriweather",
  ];

  static const List<Map<String, dynamic>> _supportedColorThemes = [
    {
      "name": "default",
      "primary": 'ffec6e4c',
      "secondary": "ffa54d35",
    },
    {
      "name": "green",
      "primary": 'ff82B541',
      "secondary": "ffff8a65",
    },
    {
      "name": "blue",
      "primary": 'ff077ef0',
      "secondary": "ff5B876C",
    },
  ];

  static List<ColorTheme> get supportedColorThemes {
    return _supportedColorThemes.map((e) => ColorTheme.fromJson(e)).toList();
  }

  static AppThemeData defaultAppTheme = AppThemeData(
    colorTheme: supportedColorThemes.first,
    font: supportedFonts.first,
    darkOption: DarkModeOption.dynamic,
  );
}
