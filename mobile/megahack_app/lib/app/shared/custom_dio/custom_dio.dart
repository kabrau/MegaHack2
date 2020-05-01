import 'package:dio/dio.dart';
import 'package:megahackapp/app/shared/constants.dart';
import 'package:megahackapp/app/shared/custom_dio/interceptor.dart';

class CustomDio {
  final Dio client;
  CustomDio(this.client){
    client.options.baseUrl = APP_URL;
    client.interceptors.add(AuthInterceptor());
    client.options.connectTimeout = 5000;

  }
}