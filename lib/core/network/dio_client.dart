import 'package:app/core/constants/docs.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/providers/authentication_provider.dart';
import 'interceptor.dart';
part 'dio_client.g.dart';

@riverpod
DioClient dioClient(Ref ref) => DioClient(baseUrl: baseUrl, ref: ref);

class DioClient {
  final String baseUrl;
  final Ref ref;
  //final InterceptorProvider interceptorProvider;

  late Dio _dio;

  Dio get dio => _dio;
  DioClient({required this.baseUrl, required this.ref}) {
    _initializeDio();
  }
  void _initializeDio() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        contentType: 'application/json; charset=utf-8',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    )..interceptors.add(DefaultIntercetor(ref.read(authenticationProvider)));

    // Add logging interceptor in debug mode
    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
        ),
      );
    }
  }
}

extension DioReference on Ref {
  Dio get dioClient => read(dioClientProvider).dio;
}
