import 'package:dio/dio.dart';
import 'package:megahackapp/app/models/company_model.dart';
import 'package:megahackapp/app/models/portfolio_model.dart';
import 'package:megahackapp/app/shared/custom_dio/custom_dio.dart';

class SearchRepository {
  final _dio = CustomDio();

  Future<List<Company>> getCompany() async {
    var response = await _dio.client.get('/api/company/list');
    List<Company> list = [];
    try {
      for(var json in (response.data['resultado'] as List) ){
        Company company = Company.fromJson(json);
        list.add(company);
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

//  Future<List<CashTransaction>> getCashTransaction(String moedaId, String start, String pageSize) async {
//    var response = await _dio.client.get(
//        "/odata/MovimentoApi?\$count=true&\$orderby=creationDate desc&\$expand=origem(\$select=pessoaId,nomeCompleto),destino(\$select=pessoaId,nomeCompleto)&\$filter=moedaId eq $moedaId&\$skip=$start&\$top=$pageSize");
//    List<CashTransaction> list = [];
//    try{
//      for(var item in (response.data['value'] as List)){
//        CashTransaction handling = CashTransaction.fromJson(item);
//        list.add(handling);
//      }
//      return list;
//    }on DioError catch (e){
//      if (e?.response?.data != null) {
//        throw e.response.data;
//      } else {
//        throw ('Falha ao comunicar com o servidor.');
//      }
//    }
//  }
}
