import 'package:app/core/network/network.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_client.g.dart';

@riverpod
AuthClient authClient(Ref ref) => AuthClient(ref.dioClient);

@RestApi()
abstract class AuthClient {
  factory AuthClient(Dio dio, {String baseUrl}) = _AuthClient;

  @POST("/login")
  Future<ApiResponse> login(@Body() dynamic request);

  @POST("/register")
  Future<ApiResponse> register(@Body() dynamic request);
}
