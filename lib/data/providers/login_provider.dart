// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import '../../core/constants/preferences.dart';
// import '../../core/settings/shared_preference.dart';

// part 'login_provider.g.dart';

// @riverpod
// class Login extends _$Login {
//   @override
//   Future<bool> build() async {
//     // Return the initial state based on preferences (or default to false)
//     return false; // Default state is false (not logged in)
//   }

//   Future<void> login() async {
//     state = AsyncValue.data(true); // Change state to true when logged in
//   }

//   Future<void> logout() async {
//     state = AsyncValue.data(false); // Change state to false when logged out
//     // Call _clear to remove any relevant data or preferences
//     // _clear();
//   }

//   bool get isLoading => state is AsyncLoading; // Check if loading
// }
