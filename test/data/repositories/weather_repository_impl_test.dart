import 'package:flutter_resources/data/models/weather_model.dart';
import 'package:flutter_resources/data/repositories/weather_repository_impl.dart';
import 'package:flutter_resources/domain/entities/weather.dart';
import 'package:flutter_resources/domain/repositories/weather_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helpers.mocks.dart';

void main() {
  late WeatherRepositoryImpl repository;
  late MockWeatherRemoteDatasource mockRemoteDatasource;
  late MockWeatherLocalDatasource mockLocalDataSource;

  setUp(() {
    mockRemoteDatasource = MockWeatherRemoteDatasource();
    mockLocalDataSource = MockWeatherLocalDatasource();
    repository =
        WeatherRepositoryImpl(mockRemoteDatasource, mockLocalDataSource);
  });

  group('getStoredWeather', () {
    test(
      "should return a cached weather if it stored previously",
      () async {
        // arrange
        const weather = WeatherModel(
          cityName: 'London',
          main: 'Clouds',
          description: 'scattered clouds',
          iconCode: '03d',
          temperature: 10,
          tempFeelLike: 10,
          humidity: 50,
          pressure: 1030,
          windSpeed: 4,
        );
        when(mockLocalDataSource.getWeather())
            .thenAnswer((_) => Future.value(weather));

        // act
        final result = await repository.getCachedWeather();

        // assert
        expect(result, weather);
      },
    );

    test(
      "should return null if it not stored",
      () async {
        // arrange
        when(mockLocalDataSource.getWeather())
            .thenAnswer((_) => Future.value());

        // act
        final result = await repository.getCachedWeather();

        // assert
        expect(result, null);
      },
    );
  });

  test(
    'should return a weather from remote datasource',
    () async {
      // arrange
      const weather = WeatherModel(
        cityName: 'London',
        main: 'Clouds',
        description: 'scattered clouds',
        iconCode: '03d',
        temperature: 10,
        tempFeelLike: 10,
        humidity: 50,
        pressure: 1030,
        windSpeed: 4,
      );
      when(mockRemoteDatasource.getWeather(any))
          .thenAnswer((_) => Future.value(weather));

      // act
      final result = await repository.getWeather('London');

      // assert
      expect(result, weather);
    },
  );
}
