import 'package:geocoding/geocoding.dart';

class LocationService {
  double? latitude;
  double? longitude;
  Placemark? placemarks;
  LocationService({
    required this.latitude,
    required this.longitude,
    required this.placemarks,
  });
}
