import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String cityName;
  final String country;
  final String main;
  final String description;
  final String iconCode;
  final double temperature;
  final double tempFeelLike;
  final int pressure;
  final int humidity;
  final double windSpeed;

  const Weather({
    required this.cityName,
    required this.country,
    required this.main,
    required this.description,
    required this.iconCode,
    required this.temperature,
    required this.tempFeelLike,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
  });

  @override
  List<Object?> get props => [
        cityName,
        main,
        description,
        iconCode,
        temperature,
        pressure,
        humidity,
        windSpeed,
      ];
}
