import 'package:dio/dio.dart';

class DioModel {
  DioModel() {
    _dio = Dio(BaseOptions(
      connectTimeout: const Duration(milliseconds: 30000),
      receiveTimeout: const Duration(milliseconds: 30000),
      contentType: "application/json",
    ))
      ..interceptors.addAll([DioInterceptor()]);
  }

  late Dio _dio;

  Dio get dio => _dio;
}

class DioInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Content-Type'] = 'application/json';

    return super.onRequest(options, handler);
  }
}
