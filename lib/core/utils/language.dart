import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageUtils {
  static String getGlobalLanguageName(String code, BuildContext context) {
    switch (code) {
      case 'en':
        return AppLocalizations.of(context)!.language_english;
      case 'vi':
        return AppLocalizations.of(context)!.language_vietnamese;
      default:
        return 'Unknown language';
    }
  }
}
