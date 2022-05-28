import 'package:flutter_resources/core/params/weather/get_weather_by_city_name_params.dart';
import 'package:flutter_resources/domain/entities/weather.dart';
import 'package:flutter_resources/domain/usecases/weather/get_weather_by_city_name.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helpers.mocks.dart';

void main() {
  late MockWeatherRepository mockWeatherRepository;
  late GetWeatherByCityName usecase;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    usecase = GetWeatherByCityName(mockWeatherRepository);
  });

  test('should return a weather', () async {
    // arrange
    const weather = Weather(
      cityName: 'London',
      country: 'VN',
      main: 'Clouds',
      description: 'scattered clouds',
      iconCode: '03d',
      temperature: 10,
      tempFeelLike: 10,
      humidity: 50,
      pressure: 1030,
      windSpeed: 4,
    );
    when(mockWeatherRepository.getWeatherByCityName(any))
        .thenAnswer((_) => Future.value(weather));

    // act
    final result = await usecase(const GetWeatherByCityNameParams('London'));

    // assert
    expect(result, weather);
  });
}
