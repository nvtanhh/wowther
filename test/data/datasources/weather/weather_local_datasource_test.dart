import 'dart:convert';

import 'package:flutter_resources/core/constants/storage_constants.dart';
import 'package:flutter_resources/data/datasources/weather/weather_local_datasource.dart';
import 'package:flutter_resources/data/models/weather_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixture_reader.dart';
import '../../../helpers/test_helpers.mocks.dart';

void main() {
  late MockSharedPreferences sharedPreferences;
  late WeatherLocalDatasourceImpl datasource;

  setUp(() {
    sharedPreferences = MockSharedPreferences();
    datasource = WeatherLocalDatasourceImpl(sharedPreferences);
  });

  group('getWeather', () {
    final weatherModel = WeatherModel.fromJson(
        jsonDecode(fixture('weather.json')) as Map<String, dynamic>);
    test(
      "should return a cached weather if it stored previously",
      () async {
        // arrange
        when(sharedPreferences.getString(any))
            .thenReturn(fixture('weather.json'));

        // act
        final result = await datasource.getWeather();

        // assert
        expect(result, weatherModel);
      },
    );

    test(
      "should return null if it not stored",
      () async {
        // arrange
        when(sharedPreferences.getString(any)).thenReturn(null);

        // act
        final result = await datasource.getWeather();

        // assert
        expect(result, null);
      },
    );
  });

  group('should call SharedPreferences to cache the data', () {
    final weatherModel = WeatherModel.fromJson(
        jsonDecode(fixture('weather.json')) as Map<String, dynamic>);
    test(
      "should call SharedPreferences to cache the data",
      () async {
        // arrange
        when(sharedPreferences.setString(any, any))
            .thenAnswer((_) => Future.value(true));

        // act
        await datasource.cacheWeather(weatherModel);

        // assert
        verify(
          sharedPreferences.setString(
            StorageConstants.weather,
            jsonEncode(
              WeatherModel.fromEntity(weatherModel).toJson(),
            ),
          ),
        );
      },
    );
  });
}
