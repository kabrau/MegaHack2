import 'package:dio/dio.dart';
import 'package:megahackapp/app/models/coordenate_model.dart';
import 'package:megahackapp/app/models/portfolio_model.dart';
import 'package:megahackapp/app/shared/custom_dio/custom_dio.dart';

class BusinessRepository {
  final _dio = CustomDio();
  final _normalDio = Dio();

  Future<List<Portfolio>> getPortfolio(String companyId) async {
    var response = await _dio.client.get('/api/company/$companyId/portfolio');
    List<Portfolio> list = [];
    try {
      for(var json in (response.data["resultado"] as List) ){
        Portfolio portfolio = Portfolio.fromJson(json);
        list.add(portfolio);
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

  }
