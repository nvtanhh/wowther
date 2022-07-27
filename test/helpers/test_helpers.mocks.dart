// Mocks generated by Mockito 5.2.0 from annotations
// in flutter_resources/test/helpers/test_helpers.dart.
// Do not manually edit this file.

import 'dart:async' as _i9;
import 'dart:convert' as _i11;
import 'dart:typed_data' as _i12;

import 'package:flutter_resources/core/params/no_params.dart' as _i17;
import 'package:flutter_resources/core/params/weather/get_weather_by_city_name_params.dart'
    as _i19;
import 'package:flutter_resources/core/params/weather/get_weather_by_location_params.dart'
    as _i21;
import 'package:flutter_resources/data/datasources/weather/weather_local_datasource.dart'
    as _i15;
import 'package:flutter_resources/data/datasources/weather/weather_remote_datasource.dart'
    as _i14;
import 'package:flutter_resources/data/models/weather_model.dart' as _i5;
import 'package:flutter_resources/domain/entities/weather.dart' as _i4;
import 'package:flutter_resources/domain/repositories/weather_repository.dart'
    as _i6;
import 'package:flutter_resources/domain/usecases/weather/get_cached_weather.dart'
    as _i16;
import 'package:flutter_resources/domain/usecases/weather/get_weather_by_city_name.dart'
    as _i18;
import 'package:flutter_resources/domain/usecases/weather/get_weather_by_location.dart'
    as _i20;
import 'package:flutter_resources/services/geolocator_service.dart' as _i22;
import 'package:geolocator/geolocator.dart' as _i7;
import 'package:http/http.dart' as _i10;
import 'package:http/src/base_request.dart' as _i13;
import 'package:http/src/response.dart' as _i2;
import 'package:http/src/streamed_response.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeResponse_0 extends _i1.Fake implements _i2.Response {}

class _FakeStreamedResponse_1 extends _i1.Fake implements _i3.StreamedResponse {
}

class _FakeWeather_2 extends _i1.Fake implements _i4.Weather {}

class _FakeWeatherModel_3 extends _i1.Fake implements _i5.WeatherModel {}

class _FakeWeatherRepository_4 extends _i1.Fake
    implements _i6.WeatherRepository {}

class _FakePosition_5 extends _i1.Fake implements _i7.Position {}

/// A class which mocks [SharedPreferences].
///
/// See the documentation for Mockito's code generation for more information.
class MockSharedPreferences extends _i1.Mock implements _i8.SharedPreferences {
  MockSharedPreferences() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Set<String> getKeys() => (super.noSuchMethod(Invocation.method(#getKeys, []),
      returnValue: <String>{}) as Set<String>);
  @override
  Object? get(String? key) =>
      (super.noSuchMethod(Invocation.method(#get, [key])) as Object?);
  @override
  bool? getBool(String? key) =>
      (super.noSuchMethod(Invocation.method(#getBool, [key])) as bool?);
  @override
  int? getInt(String? key) =>
      (super.noSuchMethod(Invocation.method(#getInt, [key])) as int?);
  @override
  double? getDouble(String? key) =>
      (super.noSuchMethod(Invocation.method(#getDouble, [key])) as double?);
  @override
  String? getString(String? key) =>
      (super.noSuchMethod(Invocation.method(#getString, [key])) as String?);
  @override
  bool containsKey(String? key) =>
      (super.noSuchMethod(Invocation.method(#containsKey, [key]),
          returnValue: false) as bool);
  @override
  List<String>? getStringList(String? key) =>
      (super.noSuchMethod(Invocation.method(#getStringList, [key]))
          as List<String>?);
  @override
  _i9.Future<bool> setBool(String? key, bool? value) =>
      (super.noSuchMethod(Invocation.method(#setBool, [key, value]),
          returnValue: Future<bool>.value(false)) as _i9.Future<bool>);
  @override
  _i9.Future<bool> setInt(String? key, int? value) =>
      (super.noSuchMethod(Invocation.method(#setInt, [key, value]),
          returnValue: Future<bool>.value(false)) as _i9.Future<bool>);
  @override
  _i9.Future<bool> setDouble(String? key, double? value) =>
      (super.noSuchMethod(Invocation.method(#setDouble, [key, value]),
          returnValue: Future<bool>.value(false)) as _i9.Future<bool>);
  @override
  _i9.Future<bool> setString(String? key, String? value) =>
      (super.noSuchMethod(Invocation.method(#setString, [key, value]),
          returnValue: Future<bool>.value(false)) as _i9.Future<bool>);
  @override
  _i9.Future<bool> setStringList(String? key, List<String>? value) =>
      (super.noSuchMethod(Invocation.method(#setStringList, [key, value]),
          returnValue: Future<bool>.value(false)) as _i9.Future<bool>);
  @override
  _i9.Future<bool> remove(String? key) =>
      (super.noSuchMethod(Invocation.method(#remove, [key]),
          returnValue: Future<bool>.value(false)) as _i9.Future<bool>);
  @override
  _i9.Future<bool> commit() =>
      (super.noSuchMethod(Invocation.method(#commit, []),
          returnValue: Future<bool>.value(false)) as _i9.Future<bool>);
  @override
  _i9.Future<bool> clear() => (super.noSuchMethod(Invocation.method(#clear, []),
      returnValue: Future<bool>.value(false)) as _i9.Future<bool>);
  @override
  _i9.Future<void> reload() =>
      (super.noSuchMethod(Invocation.method(#reload, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockClient extends _i1.Mock implements _i10.Client {
  MockClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<_i2.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_0()))
          as _i9.Future<_i2.Response>);
  @override
  _i9.Future<_i2.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_0()))
          as _i9.Future<_i2.Response>);
  @override
  _i9.Future<_i2.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i11.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_0()))
          as _i9.Future<_i2.Response>);
  @override
  _i9.Future<_i2.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i11.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_0()))
          as _i9.Future<_i2.Response>);
  @override
  _i9.Future<_i2.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i11.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_0()))
          as _i9.Future<_i2.Response>);
  @override
  _i9.Future<_i2.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i11.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_0()))
          as _i9.Future<_i2.Response>);
  @override
  _i9.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i9.Future<String>);
  @override
  _i9.Future<_i12.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: Future<_i12.Uint8List>.value(_i12.Uint8List(0)))
          as _i9.Future<_i12.Uint8List>);
  @override
  _i9.Future<_i3.StreamedResponse> send(_i13.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue:
                  Future<_i3.StreamedResponse>.value(_FakeStreamedResponse_1()))
          as _i9.Future<_i3.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
}

/// A class which mocks [WeatherRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockWeatherRepository extends _i1.Mock implements _i6.WeatherRepository {
  MockWeatherRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<_i4.Weather?> getCachedWeather() => (super.noSuchMethod(
      Invocation.method(#getCachedWeather, []),
      returnValue: Future<_i4.Weather?>.value()) as _i9.Future<_i4.Weather?>);
  @override
  _i9.Future<_i4.Weather> getWeatherByCityName(String? cityName,
          {String? language}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #getWeatherByCityName, [cityName], {#language: language}),
              returnValue: Future<_i4.Weather>.value(_FakeWeather_2()))
          as _i9.Future<_i4.Weather>);
  @override
  _i9.Future<_i4.Weather> getWeatherByLocation(double? lat, double? lon,
          {String? language}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #getWeatherByLocation, [lat, lon], {#language: language}),
              returnValue: Future<_i4.Weather>.value(_FakeWeather_2()))
          as _i9.Future<_i4.Weather>);
}

/// A class which mocks [WeatherRemoteDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockWeatherRemoteDatasource extends _i1.Mock
    implements _i14.WeatherRemoteDatasource {
  MockWeatherRemoteDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<_i5.WeatherModel> getWeatherByCityName(String? cityName,
          {String? language}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #getWeatherByCityName, [cityName], {#language: language}),
              returnValue:
                  Future<_i5.WeatherModel>.value(_FakeWeatherModel_3()))
          as _i9.Future<_i5.WeatherModel>);
  @override
  _i9.Future<_i5.WeatherModel> getWeatherByLocation(double? lat, double? lon,
          {String? language}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #getWeatherByLocation, [lat, lon], {#language: language}),
              returnValue:
                  Future<_i5.WeatherModel>.value(_FakeWeatherModel_3()))
          as _i9.Future<_i5.WeatherModel>);
}

/// A class which mocks [WeatherLocalDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockWeatherLocalDatasource extends _i1.Mock
    implements _i15.WeatherLocalDatasource {
  MockWeatherLocalDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<_i5.WeatherModel?> getWeather() =>
      (super.noSuchMethod(Invocation.method(#getWeather, []),
              returnValue: Future<_i5.WeatherModel?>.value())
          as _i9.Future<_i5.WeatherModel?>);
  @override
  _i9.Future<void> cacheWeather(_i5.WeatherModel? weather) =>
      (super.noSuchMethod(Invocation.method(#cacheWeather, [weather]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
}

/// A class which mocks [GetCachedWeather].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetCachedWeather extends _i1.Mock implements _i16.GetCachedWeather {
  MockGetCachedWeather() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.WeatherRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeWeatherRepository_4()) as _i6.WeatherRepository);
  @override
  _i9.Future<_i4.Weather?> call(_i17.NoParams? params) => (super.noSuchMethod(
      Invocation.method(#call, [params]),
      returnValue: Future<_i4.Weather?>.value()) as _i9.Future<_i4.Weather?>);
}

/// A class which mocks [GetWeatherByCityName].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWeatherByCityName extends _i1.Mock
    implements _i18.GetWeatherByCityName {
  MockGetWeatherByCityName() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.WeatherRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeWeatherRepository_4()) as _i6.WeatherRepository);
  @override
  _i9.Future<_i4.Weather> call(_i19.GetWeatherByCityNameParams? params) =>
      (super.noSuchMethod(Invocation.method(#call, [params]),
              returnValue: Future<_i4.Weather>.value(_FakeWeather_2()))
          as _i9.Future<_i4.Weather>);
}

/// A class which mocks [GetWeatherByLocation].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWeatherByLocation extends _i1.Mock
    implements _i20.GetWeatherByLocation {
  MockGetWeatherByLocation() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.WeatherRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeWeatherRepository_4()) as _i6.WeatherRepository);
  @override
  _i9.Future<_i4.Weather> call(_i21.GetWeatherByLocationParams? params) =>
      (super.noSuchMethod(Invocation.method(#call, [params]),
              returnValue: Future<_i4.Weather>.value(_FakeWeather_2()))
          as _i9.Future<_i4.Weather>);
}

/// A class which mocks [GeolocatorService].
///
/// See the documentation for Mockito's code generation for more information.
class MockGeolocatorService extends _i1.Mock implements _i22.GeolocatorService {
  MockGeolocatorService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Position get defaultPosition =>
      (super.noSuchMethod(Invocation.getter(#defaultPosition),
          returnValue: _FakePosition_5()) as _i7.Position);
  @override
  _i9.Future<_i7.Position> getCurrentPosition() =>
      (super.noSuchMethod(Invocation.method(#getCurrentPosition, []),
              returnValue: Future<_i7.Position>.value(_FakePosition_5()))
          as _i9.Future<_i7.Position>);
}
