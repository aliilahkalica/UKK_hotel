import 'package:dio/dio.dart';

class DioClient {
  static final DioClient _singleton = DioClient._internal();
  late Dio dio;

  factory DioClient() {
    return _singleton;
  }

  DioClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://192.168.0.110:3000',
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print('Request: ${options.method} ${options.path}');
        return handler.next(options); // Continue with the request
      },
      onResponse: (response, handler) {
        print('Response: ${response.statusCode}');
        return handler.next(response); // Continue with the response
      },
      onError: (DioError e, handler) {
        print('Error: ${e.message}');
        return handler.next(e); // Handle error
      },
    ));
  }
}
