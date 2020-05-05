import 'package:megahackapp/app/models/category_model.dart';
import 'package:megahackapp/app/models/publication_model.dart';
import 'package:megahackapp/app/models/user_model.dart';
import 'package:megahackapp/app/screens/create_publication/create_publication_repository.dart';
import 'package:megahackapp/app/screens/create_request/create_request_repository.dart';
import 'package:mobx/mobx.dart';

part 'create_request_controller.g.dart';

class CreateRequestController = _CreateRequestControllerBase with _$CreateRequestController;

abstract class _CreateRequestControllerBase with Store {
  final repository = CreateRequestRepository();

  @observable
  String description;

  @action
  changeDescription (value) => description = value;

  @observable
  ObservableFuture<List<Category>> listCategory;

  @observable
  Category selectedCategory;

  @action
  changeCategory(Category value) => selectedCategory = value;

  @observable
  bool loading;
  @observable
  User user;

  User _user = User();
  @action
  getCurrentUser() async{
    loading = true;
    var userTeste = await _user.get();
    loading = false;
    user = userTeste;
  }


  fetchCategory(){
    return listCategory = repository.getCategory().asObservable();
  }

  createRequest() async{
    return await repository.createPublication(description, user.uid, user.urlAvatar, user.name, selectedCategory);
  }
}
