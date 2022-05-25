import 'package:equatable/equatable.dart';

class GetWeatherByLocationParams extends Equatable {
  final double lat;
  final double long;

  const GetWeatherByLocationParams(this.lat, this.long);

  @override
  List<Object?> get props => [lat, long];
}
