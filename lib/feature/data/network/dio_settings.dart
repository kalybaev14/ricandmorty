import 'package:dio/dio.dart';

class Diosettings {
  Diosettings() {
    setUp();
  }
  Dio dio = Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/'));

  void setUp() {
    final interceptors = dio.interceptors;
    interceptors.clear();

    final logInterceptor = LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    );

    interceptors.addAll([logInterceptor]);
  }
}
