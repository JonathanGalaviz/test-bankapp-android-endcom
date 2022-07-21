class Environment {
  String host = '192.168.100.148:5529';
  String baseUrl = 'http://bankapp.endcom.mx/';
  String baseUrlApi = 'http://bankapp.endcom.mx/api/bankappTest/';

  static final Environment _config = Environment._internal();

  factory Environment() {
    return _config;
  }

  static Environment get config => _config;

  Environment._internal();
}
