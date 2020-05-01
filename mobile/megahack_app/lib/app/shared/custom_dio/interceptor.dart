import 'dart:convert';

import 'package:dio/dio.dart';

class AuthInterceptor extends InterceptorsWrapper{

  @override
  onRequest(RequestOptions options) async{
//    var token = await SharedPrefs.getString('token');
//    if (token != null && token.isNotEmpty) {
//      options.headers.addAll({"Authorization": token});
//    }
//    print("REQUEST[${options.method}] => PATH: ${options.path}");
    return super.onRequest(options);
  }

  @override
  onResponse(Response response) async{
    print("RESPONSE[${response.statusCode}] => PATH: ${response.request.path}");
    return super.onResponse(response);
  }

  @override
  onError(DioError err) async {
//    print(
//        "RESPONSE[${err.response.statusCode}] => PATH: ${err.response.request.path} => MESSAGE: ${err.response.data}");
//    print(err.response.headers);
//    if (err.response.statusCode == 403 || err.response.statusCode == 401) {
//      SharedPrefs.remove('user');
//      SharedPrefs.remove('token');
//      SharedPrefs.setBool('isLogged', false);
//      Modular.to.pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
//    }
    return super.onError(err);
  }
}