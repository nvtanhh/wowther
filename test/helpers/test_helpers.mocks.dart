// Mocks generated by Mockito 5.2.0 from annotations
// in flutter_resources/test/helpers/test_helpers.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;
import 'dart:ui' as _i3;

import 'package:flutter_resources/domain/entities/app_theme_data.dart' as _i2;
import 'package:flutter_resources/domain/entities/theme_entity.dart' as _i6;
import 'package:flutter_resources/domain/repositories/language_repository.dart'
    as _i7;
import 'package:flutter_resources/domain/repositories/theme_repository.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeAppThemeData_0 extends _i1.Fake implements _i2.AppThemeData {}

class _FakeLocale_1 extends _i1.Fake implements _i3.Locale {}

/// A class which mocks [ThemeRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockThemeRepository extends _i1.Mock implements _i4.ThemeRepository {
  MockThemeRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<List<String>> getSupportedFonts() =>
      (super.noSuchMethod(Invocation.method(#getSupportedFonts, []),
              returnValue: Future<List<String>>.value(<String>[]))
          as _i5.Future<List<String>>);
  @override
  _i5.Future<List<_i6.ColorTheme>> getSupportedThemeColors() =>
      (super.noSuchMethod(Invocation.method(#getSupportedThemeColors, []),
              returnValue:
                  Future<List<_i6.ColorTheme>>.value(<_i6.ColorTheme>[]))
          as _i5.Future<List<_i6.ColorTheme>>);
  @override
  _i5.Future<_i2.AppThemeData> getStoredOrDefaultAppThemeData() => (super
          .noSuchMethod(Invocation.method(#getStoredOrDefaultAppThemeData, []),
              returnValue:
                  Future<_i2.AppThemeData>.value(_FakeAppThemeData_0()))
      as _i5.Future<_i2.AppThemeData>);
  @override
  _i5.Future<void> storeAppThemeData(_i2.AppThemeData? appThemeData) =>
      (super.noSuchMethod(Invocation.method(#storeAppThemeData, [appThemeData]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
}

/// A class which mocks [LanguageRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockLanguageRepository extends _i1.Mock
    implements _i7.LanguageRepository {
  MockLanguageRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.Locale> getDefaultLocale() =>
      (super.noSuchMethod(Invocation.method(#getDefaultLocale, []),
              returnValue: Future<_i3.Locale>.value(_FakeLocale_1()))
          as _i5.Future<_i3.Locale>);
  @override
  _i5.Future<List<_i3.Locale>> getSupportedLocales() =>
      (super.noSuchMethod(Invocation.method(#getSupportedLocales, []),
              returnValue: Future<List<_i3.Locale>>.value(<_i3.Locale>[]))
          as _i5.Future<List<_i3.Locale>>);
  @override
  _i5.Future<String?> getStoredLanguageCode() =>
      (super.noSuchMethod(Invocation.method(#getStoredLanguageCode, []),
          returnValue: Future<String?>.value()) as _i5.Future<String?>);
  @override
  _i5.Future<void> storeLanguageCode(String? languageCode) =>
      (super.noSuchMethod(Invocation.method(#storeLanguageCode, [languageCode]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
}
