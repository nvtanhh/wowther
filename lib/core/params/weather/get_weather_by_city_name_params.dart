import 'package:equatable/equatable.dart';

class GetWeatherByCityNameParams extends Equatable {
  final String cityName;

  const GetWeatherByCityNameParams(this.cityName);

  @override
  List<Object?> get props => [cityName];
}
