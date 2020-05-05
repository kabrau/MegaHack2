import 'package:megahackapp/app/models/category_model.dart';
import 'package:megahackapp/app/models/publication_model.dart';
import 'package:megahackapp/app/models/user_model.dart';
import 'package:megahackapp/app/screens/create_publication/create_publication_repository.dart';
import 'package:mobx/mobx.dart';

part 'create_publication_controller.g.dart';

class CreatePublicationController = _CreatePublicationControllerBase with _$CreatePublicationController;

abstract class _CreatePublicationControllerBase with Store {
  final repository = CreatePublicationRepository();


  @observable
  String description;

  @action
  changeDescription (value) => description = value;

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

  createPublication() async{
   return await repository.createPublication(description, user.uid, user.urlAvatar, user.name);
  }

}
