import 'package:dio/dio.dart';
import 'package:megahackapp/app/models/category_model.dart';
import 'package:megahackapp/app/models/category_model.dart';
import 'package:megahackapp/app/models/comments_model.dart';
import 'package:megahackapp/app/shared/custom_dio/custom_dio.dart';

class LoadPublicationRepository{
  final _dio = CustomDio();

  Future<List<Comment>> getComments(id) async {
    var response = await _dio.client.get('/api/comment/$id');
    List<Comment> list = [];
    try {
      for(var json in (response.data['resultado'] as List) ){
        Comment comment = Comment.fromJson(json);
        list.add(comment);
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

  Future<String> createComment(uidPublic, uidUser, userName, avatarUrl, description) async{
    var body ={
    "uid_publication": "$uidPublic",
    "uid_user": "$uidUser",
    "user_name": "$userName",
    "avatar_url": "$avatarUrl",
    "description": "$description",
  };
    var response = await _dio.client.put('/api/comment/add', data: body);
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