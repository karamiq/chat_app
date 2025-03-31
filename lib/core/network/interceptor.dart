import 'package:app/core/errors/exeptions.dart';
import 'package:app/data/models/authentication_model.dart';
import 'package:dio/dio.dart';

class DefaultIntercetor extends Interceptor {
  final AuthenticationModel? authenticationModel;

  DefaultIntercetor(this.authenticationModel);
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (authenticationModel != null) {
      options.headers['Authorization'] = 'Bearer ${authenticationModel!.token}';
    }
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    ErrorHandler().handleError(err);
    handler.reject(err);
    return super.onError(err, handler);
  }
}
