import 'package:equatable/equatable.dart';

class GetWeatherByCityNameParams extends Equatable {
  final String cityName;
  final String? language;

  const GetWeatherByCityNameParams(this.cityName, {this.language});

  @override
  List<Object?> get props => [cityName, language];
}
