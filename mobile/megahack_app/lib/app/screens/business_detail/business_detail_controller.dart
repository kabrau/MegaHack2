import 'package:megahackapp/app/models/portfolio_model.dart';
import 'package:megahackapp/app/screens/business_detail/business_detail_repository.dart';
import 'package:mobx/mobx.dart';

part 'business_detail_controller.g.dart';

class BusinessDetailController = _BusinessDetailControllerBase with _$BusinessDetailController;

abstract class _BusinessDetailControllerBase with Store {
  final repository = BusinessRepository();


  @observable
  ObservableFuture<List<Portfolio>> listPortfolio;


  fetchPortfolios(){
    listPortfolio = repository.getBalanceOf().asObservable();
  }
}
