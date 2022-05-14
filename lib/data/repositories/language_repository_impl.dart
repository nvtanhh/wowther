import 'dart:ui';

import 'package:injectable/injectable.dart';

import '../../domain/repositories/language_repository.dart';
import '../datasources/local/language_local_datasource.dart';

@Injectable(as: LanguageRepository)
class LanguageRepositoryImpl extends LanguageRepository {
  final LanguageLocalDataSource _localDatasource;

  LanguageRepositoryImpl(this._localDatasource);

  @override
  Future<Locale> getDefaultLocale() async {
    return _localDatasource.defaultLocale;
  }

  @override
  Future<List<Locale>> getSupportedLocales() async {
    return _localDatasource.supportedLocales;
  }

  @override
  Future<String?> getStoredLanguageCode() async {
    return _localDatasource.getStoredLanguageCode();
  }

  @override
  Future<void> storeLanguageCode(String languageCode) async {
    return _localDatasource.storeLanguageCode(languageCode);
  }
}
