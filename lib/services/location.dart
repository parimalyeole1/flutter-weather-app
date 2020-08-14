import 'package:geolocator/geolocator.dart';

class Location {
  Future<Position> getCurrentLocation() async {
    return Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
  }
}
