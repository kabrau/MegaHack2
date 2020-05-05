import 'package:dio/dio.dart';
import 'package:megahackapp/app/models/category_model.dart';
import 'package:megahackapp/app/shared/custom_dio/custom_dio.dart';
import 'package:megahackapp/app/shared/utils/shared_prefs.dart';

class MainScaffoldRepository{
  final _dio = CustomDio();

  Future<List<Category>> getCategory() async {
    var response = await _dio.client.get('/api/category/list');
    List<Category> list = [];
    try {
      print("Ta aqui?");
      for(var json in (response.data['resultado'] as List) ){
        Category category = Category.fromJson(json);
        category.save();
        list.add(category);
      }
      print(await SharedPrefs.getString("categories"));
      SharedPrefs.setString("categories", list.toString());

      return list;
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