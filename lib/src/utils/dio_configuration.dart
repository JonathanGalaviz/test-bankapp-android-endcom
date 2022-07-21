import 'package:dio/dio.dart';
import 'package:test_bankapp_android_endcom/src/utils/enviroment.dart';

class DioConfiguration {
  Dio createDio() {
    return addInterceptors(Dio(BaseOptions(
        connectTimeout: 50000,
        receiveTimeout: 50000,
        baseUrl: Environment().baseUrlApi)));
  }

  Dio addInterceptors(Dio dio) {
    return dio
      ..interceptors.add(InterceptorsWrapper(
          onRequest: (options, handler) => requestInterceptor(options, handler),
          onError: (DioError error, handler) async {
            print('valorrr ${error.response?.statusCode}');
            print('valorrr ${error.response?.data}');
            print('valorrr response ${error.response}');
            return handler.next(error);
          }));
  }

  dynamic requestInterceptor(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // options.headers.addAll({"Content-Type": "application/json"});
    // options.headers.addAll({"Accept": "application/json"});
    // options.headers.addAll({"X-Requested-With": "XMLHttpRequest"});
    return handler.next(options);
  }
}
