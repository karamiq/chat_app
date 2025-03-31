import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// A StateProvider for SharedPreferences
final sharedPreferencesProvider = StateProvider<SharedPreferences>((ref) {
  // Return nulel initially since SharedPreferences isn't initialized yet.
  return throw Exception('SharedPreferences is not initialized');
});
