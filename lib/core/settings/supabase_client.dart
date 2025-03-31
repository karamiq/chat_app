import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// A StateProvider for SharedPreferences
final supabaseClientProvider = StateProvider<SupabaseClient>((ref) {
  // Return nulel initially since SharedPreferences isn't initialized yet.
  return throw Exception('SharedPreferences is not initialized');
});
