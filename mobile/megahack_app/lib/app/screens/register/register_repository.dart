import 'package:dio/dio.dart';
import 'package:megahackapp/app/models/user_model.dart';
import 'package:megahackapp/app/shared/custom_dio/custom_dio.dart';

class RegisterRepository{
  final _dio = CustomDio();

  Future<String> loginUser(param, password) async {
    var response = await _dio.client.get('/api/user/login/$param/$password');
    try {
      if(response.data["status"] == "sucesso"){
        User user = User.fromJson(response.data["resultado"]);
        user.save();
      }
      return response.data["status"];
    } on DioError catch (e) {
      if (e?.response?.data != null) {
        print(e.response.data);
        throw e.response.data;
      } else {
        throw ('Falha ao comunicar com o servidor.');
      }
    }
  }

  Future<String> registerUser(name,nickname,email,password) async {
    Map<String,dynamic> body = {
        "name": name,
        "nickname": nickname,
        "email": email,
        "password": password,
        "url_avatar": "",
    };
    var response = await _dio.client.put('/api/user/add/', data: body);
    try {
      if(response.data["status"] == "sucesso"){
        loginUser(nickname,password);
      }
      return response.data["status"];
    } on DioError catch (e) {
      if (e?.response?.data != null) {
        print(e.response.data);
        throw e.response.data;
      } else {
        throw ('Falha ao comunicar com o servidor.');
      }
    }
  }
}