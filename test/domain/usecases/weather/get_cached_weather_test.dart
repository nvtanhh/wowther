import 'package:flutter_resources/core/params/no_params.dart';
import 'package:flutter_resources/domain/entities/weather.dart';
import 'package:flutter_resources/domain/usecases/weather/get_cached_weather.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helpers.mocks.dart';

void main() {
  late MockWeatherRepository mockWeatherRepository;
  late GetCachedWeather usecase;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    usecase = GetCachedWeather(mockWeatherRepository);
  });

  group('get cached weather', () {
    const weather = Weather(
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
    test('should return a weather from cached if it saved previously',
        () async {
      // arrange
      when(mockWeatherRepository.getCachedWeather())
          .thenAnswer((_) => Future.value(weather));

      // act
      final result = await usecase(NoParams());

      // assert
      expect(result, weather);
    });

    test('should return null if it not stored', () async {
      // arrange
      when(mockWeatherRepository.getCachedWeather())
          .thenAnswer((_) => Future.value());

      // act
      final result = await usecase(NoParams());

      // assert
      expect(result, null);
    });
  });
}
