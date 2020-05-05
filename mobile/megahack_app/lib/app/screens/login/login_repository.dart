import 'package:dio/dio.dart';
import 'package:megahackapp/app/models/user_model.dart';
import 'package:megahackapp/app/shared/custom_dio/custom_dio.dart';

class LoginRepository{
  final _dio = CustomDio();

  Future<String> loginUser(param, password) async {
    var response = await _dio.client.get('/api/user/login/$param/$password');
    try {
      for(var json in (response.data['resultado'] as List) ){
        if(response.data["status"] == "sucesso"){
          User user = User.fromJson(json);
          user.save();
        }
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