import 'package:equatable/equatable.dart';

class GetWeatherByLocationParams extends Equatable {
  final double lat;
  final double long;
  final String? language;

  const GetWeatherByLocationParams(this.lat, this.long, {this.language});

  @override
  List<Object?> get props => [lat, long, language];
}
