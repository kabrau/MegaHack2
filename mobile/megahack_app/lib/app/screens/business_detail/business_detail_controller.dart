import 'package:megahackapp/app/models/product_model.dart';
import 'package:megahackapp/app/screens/business_detail/business_detail_repository.dart';
import 'package:megahackapp/app/shared/custom_dio/custom_dio.dart';
import 'package:mobx/mobx.dart';

part 'business_detail_controller.g.dart';

class BusinessDetailController = _BusinessDetailControllerBase with _$BusinessDetailController;

abstract class _BusinessDetailControllerBase with Store {
  final repository = BusinessRepository();

  _BusinessDetailControllerBase(){
    fetchProducts();
  }
  @observable
  ObservableFuture<List<Product>> listProduct;


  fetchProducts(){
    listProduct = repository.getBalanceOf().asObservable();
  }
}
