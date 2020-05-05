import 'package:dio/dio.dart';
import 'package:megahackapp/app/models/category_model.dart';
import 'package:megahackapp/app/models/company_model.dart';
import 'package:megahackapp/app/models/publication_model.dart';
import 'package:megahackapp/app/shared/custom_dio/custom_dio.dart';

class CreateBusinessRepository{
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

  Future<Company> getCompany(id) async {
    var response = await _dio.client.get('/api/user/$id/company');
    try {

      Company publication = Company.fromJson(response.data['resultado']);
      return publication;
    } on DioError catch (e) {
      if (e?.response?.data != null) {
        throw e.response.data;
      } else {
        throw ('Falha ao comunicar com o servidor.');
      }
    }
  }

  Future<String> createBusiness(name, description, uidUser, site,cnpj,cep,cat,contact,address,aNumber,city,state) async {
    var body = {
    "name": "$name",
    "description": "$description",
    "site": "$site",
    "CNPJ": "$cnpj",
    "CEP": "$cep",
    "uid_category": "$cat",
    "url_logo": "",
    "fone_contact": "$contact",
    "adm_uid_user": "$uidUser",
    "adress": "$address",
    "adress_number": "$aNumber",
    "adress_complement": null,
    "city": "$city",
    "state": "$state",
    };
    var response = await _dio.client.put('/api/company/add', data: body);
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