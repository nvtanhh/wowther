import 'dart:convert';

import 'package:flutter_resources/data/models/weather_model.dart';
import 'package:flutter_resources/domain/entities/weather.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  const weather = WeatherModel(
    cityName: 'Mountain View',
    country: 'VN',
    main: 'Clear',
    description: 'clear sky',
    iconCode: '01d',
    temperature: 282.55,
    tempFeelLike: 281.86,
    humidity: 100,
    pressure: 1023,
    windSpeed: 1.5,
  );

  test(
    'should be a subclass of Weather',
    () {
      expect(weather, isA<Weather>());
    },
  );

  group('Serializable', () {
    test(
      "should return a valid WeatherModel when fromJson",
      () {
        // arrange
        final json =
            jsonDecode(fixture('weather.json')) as Map<String, dynamic>;

        // act
        final result = WeatherModel.fromJson(json);

        // assert
        expect(result, weather);
      },
    );
    test(
      "should return the JSON map",
      () {
        // act
        final result = weather.toJson();

        final expectedJson = {
          'name': 'Mountain View',
          'weather': {
            'main': 'Clear',
            'description': 'clear sky',
            'icon': '01d',
          },
          'main': {
            'temp': 282.55,
            'feels_like': 281.86,
            'pressure': 1023,
            'humidity': 100,
          },
          "wind": {
            "speed": 1.5,
          },
        };

        // assert
        expect(result, expectedJson);
      },
    );

    test(
      "should integrable between fromJson and toJson",
      () {
        // arrange
        final json =
            jsonDecode(fixture('weather.json')) as Map<String, dynamic>;

        // act
        final result = WeatherModel.fromJson(json);
        final expectedJson = result.toJson();

        // assert
        expect(json, expectedJson);
      },
    );
  });
}
