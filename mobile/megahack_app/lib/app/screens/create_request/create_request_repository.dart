import 'package:dio/dio.dart';
import 'package:megahackapp/app/models/category_model.dart';
import 'package:megahackapp/app/shared/custom_dio/custom_dio.dart';

class CreateRequestRepository{
  final _dio = CustomDio();

  Future<List<Category>> getCategory() async {
    var response = await _dio.client.get('/api/category/list');
    List<Category> list = [];
    try {
      for(var json in (response.data['resultado'] as List) ){
        Category publication = Category.fromJson(json);
        list.add(publication);
      }
      print(list);
      return list;
    } on DioError catch (e) {
      if (e?.response?.data != null) {
        throw e.response.data;
      } else {
        throw ('Falha ao comunicar com o servidor.');
      }
    }
  }
  Future<String> createPublication(description, uidUser, urlAvatar, nameUser, category) async {
    var body =  {
      "description": "$description",
      "url_image": "",
      "uid_category": "$category",
      "request": 1,
      "uid_user": "$uidUser",
      "url_avatar": "$urlAvatar",
      "name_user": "$nameUser"
    };
    var response = await _dio.client.put('/api/publication/add', data: body);
    try {
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