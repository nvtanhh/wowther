import 'package:flutter_resources/data/models/weather_model.dart';
import 'package:flutter_resources/data/repositories/weather_repository_impl.dart';
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

  group('getStoredWeather', () {
    test(
      "should return a cached weather if it stored previously",
      () async {
        // arrange
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

  group('getWeatherByCityName', () {
    test(
      'should return a weather from remote datasource && should store it locally',
      () async {
        // arrange

        when(mockRemoteDatasource.getWeatherByCityName(any))
            .thenAnswer((_) => Future.value(weather));

        // act
        final result = await repository.getWeatherByCityName('London');

        // assert
        expect(result, weather);
        verify(mockLocalDataSource.cacheWeather(any)).called(1);
      },
    );
  });

  group('getWeatherByLocation', () {
    test(
      'should return a weather from remote datasource && should store it locally',
      () async {
        // arrange

        when(mockRemoteDatasource.getWeatherByLocation(any, any))
            .thenAnswer((_) => Future.value(weather));

        // act
        final result =
            await repository.getWeatherByLocation(51.5285582, -0.2416811);

        // assert
        expect(result, weather);
        verify(mockLocalDataSource.cacheWeather(any)).called(1);
      },
    );
  });
}
