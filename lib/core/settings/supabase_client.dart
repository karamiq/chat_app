import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabaseClientProvider = StateProvider<SupabaseClient>((ref) {
  return throw Exception('Supabase is not initialized');
});
