import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final String jwtToken;

  AuthInterceptor(this.jwtToken);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (jwtToken != null && jwtToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $jwtToken';
    }
    super.onRequest(options, handler);
  }
}