import 'dart:ui';

import 'package:injectable/injectable.dart';

import '../../domain/repositories/language_repository.dart';
import '../datasources/language/language_local_datasource.dart';

@Injectable(as: LanguageRepository)
class LanguageRepositoryImpl extends LanguageRepository {
  final LanguageLocalDataSource _localDatasource;

  LanguageRepositoryImpl(this._localDatasource);

  @override
  Future<Locale> getStoredOrDefaultLocale() async {
    final storedLanguageCode = await _localDatasource.getStoredLanguageCode();
    final supportedLocales = await _localDatasource.getSupportedLocales();
    if (storedLanguageCode != null) {
      return supportedLocales.firstWhere(
        (locale) => locale.languageCode == storedLanguageCode,
        orElse: () => supportedLocales.first,
      );
    }
    return (await _localDatasource.getSupportedLocales()).first;
  }

  @override
  Future<List<Locale>> getSupportedLocales() async {
    return _localDatasource.getSupportedLocales();
  }

  @override
  Future<void> storeLocale(Locale locale) async {
    return _localDatasource.storeLocale(locale);
  }
}
