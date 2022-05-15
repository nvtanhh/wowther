import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
