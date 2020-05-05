import 'package:dio/dio.dart';
import 'package:megahackapp/app/models/publication_model.dart';
import 'package:megahackapp/app/shared/custom_dio/custom_dio.dart';

class MyPublicationRepository{
  final _dio = CustomDio();

  Future<List<Publication>> getFeed(String id) async {
    var response = await _dio.client.get('/api/user/$id/feed');
    List<Publication> list = [];
    try {
      for(var json in (response.data['resultado'] as List) ){
        Publication publication = Publication.fromJson(json);
        print(publication.urlImage);
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
  Future<List<Publication>> getRequest(String id) async {
    var response = await _dio.client.get('/api/user/${id}/request');
    List<Publication> list = [];
    try {
      for(var json in (response.data['resultado'] as List) ){
        Publication publication = Publication.fromJson(json);
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

  Future<String> deletePublication(String id) async {
    var response = await _dio.client.delete('/api/publication/delete/$id');
    try {
      return response.data["status"];
    } on DioError catch (e) {
      if (e?.response?.data != null) {
        throw e.response.data;
      } else {
        throw ('Falha ao comunicar com o servidor.');
      }
    }
  }
}