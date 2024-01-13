import 'package:dio/dio.dart';

class ApiException implements Exception {
  int? code;
  String? message;
  Response<dynamic>? response;

  ApiException(this.code, this.message, {this.response}) {
    if (code != 400) {
      return;
    }
    if (message == 'Failed to authenticate.') {
      message = 'نام کاربری یا رمز عبور اشتباه است';
    }
  }
}
