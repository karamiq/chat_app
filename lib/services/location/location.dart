import 'package:app/services/location/location_model.dart';
import 'package:location/location.dart';
import '../location/location_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location.g.dart'; // This will generate the code for the provider

@riverpod
class LocationNotifier extends _$LocationNotifier {
  // Constructor remains the same

  @override
  LocationService? build() {
    _loadSavedLocation();
    return null;
  }

  Future<void> _loadSavedLocation() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final latitude = prefs.getDouble('latitude');
      final longitude = prefs.getDouble('longitude');

      if (latitude != null && longitude != null) {
        final placemarks = await convertToAddress(latitude, longitude);
        LocationService(
          latitude: latitude,
          longitude: longitude,
          placemarks: placemarks,
        );
      }
    } catch (e) {
      null;
    }
  }

  // Get current location and update state
  Future<void> getCurrentLocation() async {
    final location = Location();

    try {
      if (!await _checkAndRequestService(location)) return;
      if (!await _checkAndRequestPermission(location)) return;

      final locationData = await location.getLocation();
      final latitude = locationData.latitude!;
      final longitude = locationData.longitude!;
      final placemarks = await convertToAddress(latitude, longitude);

      // Save location in SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setDouble('latitude', latitude);
      await prefs.setDouble('longitude', longitude);

      LocationService(
        latitude: latitude,
        longitude: longitude,
        placemarks: placemarks,
      );
    } catch (e) {
      null;
    }
  }

  // Check and request location service
  Future<bool> _checkAndRequestService(Location location) async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
    }
    if (!serviceEnabled) {
      null;
    }
    return serviceEnabled;
  }

  // Check and request location permission
  Future<bool> _checkAndRequestPermission(Location location) async {
    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
    }
    if (permissionGranted != PermissionStatus.granted) {
      null;
    }
    return permissionGranted == PermissionStatus.granted;
  }
}
