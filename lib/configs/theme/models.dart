import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/utils/utils.index.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppThemeData extends Equatable {
  final ColorTheme colorTheme;
  final String font;
  final DarkModeOption darkOption;

  const AppThemeData({
    required this.colorTheme,
    required this.font,
    required this.darkOption,
  });

  factory AppThemeData.fromJson(Map<String, dynamic> json) {
    return AppThemeData(
      colorTheme:
          ColorTheme.fromJson(json['colorTheme'] as Map<String, dynamic>),
      font: json['font'] as String,
      darkOption: DarkModeOption.values.firstWhere(
        (element) => element.name == json['darkOption'] as String,
      ),
    );
  }

  @override
  List<Object?> get props => [colorTheme, font, darkOption];
}

class ColorTheme extends Equatable {
  final String name;
  final Color primary;
  final Color secondary;

  const ColorTheme({
    required this.name,
    required this.primary,
    required this.secondary,
  });

  factory ColorTheme.fromJson(Map<String, dynamic> json) {
    return ColorTheme(
      name: (json['name'] ?? '') as String,
      primary: UtilColor.getColorFromHex(json['primary'] as String),
      secondary: UtilColor.getColorFromHex(json['secondary'] as String),
    );
  }

  @override
  List<Object?> get props => [name, primary, secondary];
}

enum DarkModeOption { dynamic, on, off }

extension DarkModeOptionExtension on DarkModeOption {
  String toTranslationString(BuildContext context) {
    switch (this) {
      case DarkModeOption.dynamic:
        return AppLocalizations.of(context)!.settings__theme_dark_mode_dynamic;
      case DarkModeOption.on:
        return AppLocalizations.of(context)!.settings__theme_dark_mode_on;
      case DarkModeOption.off:
        return AppLocalizations.of(context)!.settings__theme_dark_mode_off;
      default:
        return 'Unknown option';
    }
  }
}
