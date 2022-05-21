import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/params/language/store_language_code_params.dart';
import '../../../core/params/no_params.dart';
import '../../../domain/usecases/langugae/get_stored_or_default_locale.dart';
import '../../../domain/usecases/langugae/get_supported_locales.dart';
import '../../../domain/usecases/langugae/store_locale.dart';

part 'language_state.dart';

@singleton
class LanguageCubit extends Cubit<LanguageState> {
  final GetStoredOrDefaultLocale _getStoredOrDefaultLocale;
  final GetSupportedLocales _getSupportedLocales;
  final StoreLocale _storeLocale;

  LanguageCubit(
    this._getStoredOrDefaultLocale,
    this._getSupportedLocales,
    this._storeLocale,
  ) : super(LanguageState.initial());

  Future<void> init() async {
    final locale = await _getStoredOrDefaultLocale(NoParams());
    final supportedLocales = await _getSupportedLocales(NoParams());
    emit(state.copyWith(locale: locale, supportedLocales: supportedLocales));
  }

  void changeLanguage(Locale locale) {
    emit(state.copyWith(locale: locale));
    _storeLocale(StoreLocaleParams(locale));
  }

  Locale? localeResolutionCallback(
    Locale? deviceLocale,
    Iterable<Locale> supportedLocales,
  ) {
    // if no deviceLocale -> use english
    if (deviceLocale == null) {
      return state.locale;
    }
    // initialize locale from device
    if (state.supportedLocales.contains(deviceLocale)) {
      final matchedLocale = supportedLocales.firstWhere(
        (Locale locale) => locale.languageCode == deviceLocale.languageCode,
      );
      emit(state.copyWith(locale: matchedLocale));
    }
    return state.locale;
  }
}
