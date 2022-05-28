import 'package:flutter/material.dart';

class AppConstants {
  // Language
  static const List<Locale> supportedLocales = [
    Locale('en', 'US'),
    Locale('vi', 'VN'),
  ];

  // Theme

  static const List<String> supportedFonts = [
    "OpenSans",
    "ProximaNova",
    "Raleway",
    "Roboto",
    "Merriweather",
  ];

  static const List<Map<String, dynamic>> supportedColorThemes = [
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
}
