import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final String _token;

  AuthInterceptor(this._token);

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (_token != null && _token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $_token';
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Handle any response related logic here if needed
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // Handle token expiration or other errors here
    return super.onError(err, handler);
  }
}