import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = StateProvider<SharedPreferences>(
    (ref) => throw Exception('SharedPreferences is not initialized'));
