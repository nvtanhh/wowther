import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/constants/constants.index.dart';

@injectable
class LanguageLocalDataSource {
  final SharedPreferences _sharedPreferences;
  LanguageLocalDataSource(this._sharedPreferences);

  final supportedLocales = const [
    Locale('en', 'US'),
    Locale('vi', 'VN'),
  ];

  Locale get defaultLocale => supportedLocales[0];

  Future<String?> getStoredLanguageCode() async {
    return _sharedPreferences.getString(StorageConstants.language);
  }

  Future<void> storeLanguageCode(String languageCode) {
    return _sharedPreferences.setString(
      StorageConstants.language,
      languageCode,
    );
  }
}
