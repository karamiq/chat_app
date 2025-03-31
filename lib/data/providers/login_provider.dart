import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
part 'login_provider.g.dart';

/// Define your API endpoint
const String apiUrl = "https://jsonplaceholder.typicode.com/posts";

/// StateNotifier to handle API requests
class PostsNotifier
    extends StateNotifier<AsyncValue<List<Map<String, dynamic>>>> {
  PostsNotifier() : super(const AsyncValue.loading());

  /// Fetch posts from API
  Future<void> fetchPosts() async {
    try {
      state = const AsyncValue.loading(); // Set loading state
      final response = await Dio().get(apiUrl);
      state = AsyncValue.data(List<Map<String, dynamic>>.from(response.data));
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace); // Handle error
    }
  }
}

/// Provider for the StateNotifier
final postsProvider = StateNotifierProvider<
  PostsNotifier,
  AsyncValue<List<Map<String, dynamic>>>
>((ref) => PostsNotifier());
