import 'package:aviz/Features/Home/data/datasource/home_datasource.dart';
import 'package:aviz/Features/Home/data/repository/home_repository.dart';
import 'package:aviz/NetworkUtil/dio_provider.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

var locator = GetIt.instance;

Future<void> getInInit() async {
  locator.registerSingleton<Dio>(DioProvider.createDio());

  locator.registerFactory<IHomeDatasource>(
      () => HomeRemoteDatasource(locator.get()));
      
  locator.registerFactory<IHomeRepository>(() => HomeRepository(locator.get()));
}
