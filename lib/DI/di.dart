import 'package:aviz/NetworkUtil/dio_provider.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

var locator = GetIt.instance;

Future<void> getInInit() async {
  locator.registerSingleton<Dio>(DioProvider.createDio());
}
