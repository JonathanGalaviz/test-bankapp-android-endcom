import 'package:dio/dio.dart';
import 'package:test_bankapp_android_endcom/src/utils/dio_configuration.dart';

class BankService {
  Dio dio = DioConfiguration().createDio();

  Future<Response> getAccount() async {
    try {
      Response response = await dio.get('cuenta');
      return response;
    } on DioError catch (e) {
      return e.response!;
    }
  }

  Future<Response> getBalance() async {
    try {
      Response response = await dio.get('saldos');

      return response;
    } on DioError catch (e) {
      return e.response!;
    }
  }

  Future<Response> getCards() async {
    try {
      Response response = await dio.get('tarjetas');

      return response;
    } on DioError catch (e) {
      return e.response!;
    }
  }

  Future<Response> getMovements() async {
    try {
      Response response = await dio.get('movimientos');
      return response;
    } on DioError catch (e) {
      return e.response!;
    }
  }
}
