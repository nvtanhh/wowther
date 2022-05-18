import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../../../config/injector/injection.dart';
import '../../../core/params/language/store_language_code_params.dart';
import '../../../core/params/no_params.dart';
import '../../../domain/usecases/langugae/get_default_locale.dart';
import '../../../domain/usecases/langugae/get_stored_language_code.dart';
import '../../../domain/usecases/langugae/get_supported_locales.dart';
import '../../../domain/usecases/langugae/store_language_code.dart';

@singleton
class LanguageCubit extends Cubit<Locale?> {
  final GetDefaultLocale _getDefaultLocale;
  final GetSupportedLocales _getSupportedLocales;
  final GetStoredLanguageCode _getStoredLanguageCode;
  final StoreLanguageCode _storeLanguageCode;

  LanguageCubit(
    this._getDefaultLocale,
    this._getSupportedLocales,
    this._getStoredLanguageCode,
    this._storeLanguageCode,
  ) : super(null) {
    _init();
  }

  Locale? _defaultLocale;
  List<Locale>? _supportedLocales;

  Locale get defaultLocale => _defaultLocale ?? const Locale('en', 'US');
  List<Locale> get supportedLocales =>
      _supportedLocales ?? const [Locale('en', 'US')];

  List<String> get supportedLanguages =>
      supportedLocales.map((locale) => locale.languageCode).toList();

  Future<void> _init() async {
    _defaultLocale = await _getDefaultLocale(NoParams());
    emit(defaultLocale);
    final storedLanguageCode = await _getStoredLanguageCode(NoParams());
    _supportedLocales = await _getSupportedLocales(NoParams());
    if (storedLanguageCode != null) {
      final storedLocale = supportedLocales.firstWhere(
        (locale) => locale.languageCode == storedLanguageCode,
        orElse: () => defaultLocale,
      );
      emit(storedLocale);
    }
  }

  void changeLanguage(Locale locale) {
    emit(locale);
    _storeLanguageCode(StoreLanguageCodeParams(locale.languageCode));
  }

  Locale? localeResolutionCallback(
    Locale? deviceLocale,
    Iterable<Locale> supportedLocales,
  ) {
    // if no deviceLocale -> use english
    if (deviceLocale == null) {
      emit(defaultLocale);
      return state;
    }
    // initialize locale from device
    if (supportedLanguages.contains(deviceLocale.languageCode) &&
        state == null) {
      final supportedMatchedLocale = supportedLocales.firstWhere(
        (Locale locale) => locale.languageCode == deviceLocale.languageCode,
      );
      emit(supportedMatchedLocale);
    } else if (state == null) {
      locator<Logger>().i(
        'Locale ${deviceLocale.languageCode} not supported, defaulting to en',
      );
      emit(defaultLocale);
    }
    return state;
  }
}
