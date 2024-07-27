import 'package:dio/dio.dart';

class DioModel {
  Future<Dio> getDIO({
    Map<String, dynamic> headers = const {},
    int connectTimeout = 30000,
    int receiveTimeout = 30000,
  }) async {
    final dio = Dio(BaseOptions(
      connectTimeout: const Duration(milliseconds: 30000),
      receiveTimeout: const Duration(milliseconds: 30000),
      contentType: "application/json",
    ))
      ..interceptors.addAll([DioInterceptor()]);

    return dio;
  }
}

class DioInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Content-Type'] = 'application/json';

    return super.onRequest(options, handler);
  }
}
