import 'package:megahackapp/app/models/company_model.dart';
import 'package:megahackapp/app/screens/search/search_repository.dart';
import 'package:mobx/mobx.dart';

part 'search_controller.g.dart';

class SearchController = _SearchControllerBase with _$SearchController;

abstract class _SearchControllerBase with Store {
  final repository = SearchRepository();

  @observable
  ObservableFuture<List<Company>> listCompany;


  fecthCompany(){
    listCompany = repository.getCompany().asObservable();
  }

}
