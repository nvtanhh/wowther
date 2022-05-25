import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

@singleton
class GeolocatorService {
  Future<Position> getCurrentPosition() async {
    return Geolocator.getCurrentPosition();
  }
}
