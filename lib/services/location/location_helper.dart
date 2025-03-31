
  import 'package:geocoding/geocoding.dart';

Future<Placemark> convertToAddress(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      return placemarks.first;
    } catch (e) {
      throw Exception('Failed to convert coordinates to address: $e');
    }
  }