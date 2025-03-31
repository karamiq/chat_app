import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'login_provider.g.dart';

@riverpod
class LoginNotifier extends _$LoginNotifier {
  @override
  AsyncValue<void> build() {
    // Initial state is data (i.e. idle)
    return const AsyncData(null);
  }

  /// Call this method to perform the login request.
  Future<void> login(String email, String password) async {
    // Set the state to loading so the UI can show a spinner.
    state = const AsyncLoading();
    try {
      // Replace with your actual API endpoint.
      final response = await Dio().post(
        'https://example.com/api/login',
        data: {'email': email, 'password': password},
      );

      // If needed, process the response (e.g. save token, update user state, etc.)

      // Set state to data when finished.
      state = const AsyncData(null);
    } catch (e, st) {
      // Set the error state if something goes wrong.
      state = AsyncError(e, st);
    }
  }
}
