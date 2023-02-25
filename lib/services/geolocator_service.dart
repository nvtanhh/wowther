import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../configs/injector/injection.dart';

@singleton
class GeolocatorService {
  final defaultPosition = Position(
    latitude: 10.762622,
    longitude: 106.660172,
    timestamp: DateTime.fromMillisecondsSinceEpoch(500),
    altitude: 5.0,
    accuracy: 0.0,
    heading: 0.0,
    speed: 0.0,
    speedAccuracy: 0.0,
  );
  Future<Position> getCurrentPosition() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Future.error(
          'Location permissions are permanently denied, we cannot request permissions.',
        );
      }

      return await Geolocator.getCurrentPosition();
    } catch (e) {
      locator<Logger>().e(e.toString());
      return defaultPosition;
    }
  }
}
