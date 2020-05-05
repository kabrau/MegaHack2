import 'package:megahackapp/app/models/comments_model.dart';
import 'package:megahackapp/app/models/user_model.dart';
import 'package:megahackapp/app/screens/load_publication/load_publication_repository.dart';
import 'package:mobx/mobx.dart';

part 'load_publication_controller.g.dart';

class LoadPublicationController = _LoadPublicationControllerBase with _$LoadPublicationController;

abstract class _LoadPublicationControllerBase with Store {
  final repository = LoadPublicationRepository();

  @observable
  String description;

  @action
  changeComment(value)=> description = value;

  @observable
  ObservableFuture<List<Comment>> listComment;

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

  createComment(uidPublic)async{
    return await repository.createComment(uidPublic, user.uidUser, user.name, user.urlAvatar, description);

  }
  fetchComment(id){
    listComment = repository.getComments(id).asObservable();
  }


}
