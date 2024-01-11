import 'package:aviz/Constants/string_constants.dart';
import 'package:dio/dio.dart';

class DioProvider {
  static Dio createDio() {
    return Dio(BaseOptions(baseUrl: StringConstants.baseUrl));
  }
}
