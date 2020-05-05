import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:megahackapp/app/models/category_model.dart';
import 'package:megahackapp/app/models/publication_model.dart';
import 'package:megahackapp/app/models/user_model.dart';
import 'package:megahackapp/app/screens/my_publication/my_publication_repository.dart';
import 'package:megahackapp/app/screens/splash/splash_screen.dart';
import 'package:megahackapp/app/shared/utils/shared_prefs.dart';
import 'package:mobx/mobx.dart';

part 'my_publication_controller.g.dart';

class MyPublicationController = _MyPublicationControllerBase with _$MyPublicationController;

abstract class _MyPublicationControllerBase with Store {
  final repository = MyPublicationRepository();

  _$MyPublicationController(){

  }
  @observable
  ObservableFuture<List<Publication>> listPublication;
  @observable
  ObservableFuture<List<Publication>> listRequest;

  @observable
  Category category;

  @observable
  bool loading;
  @observable
  String user;

  User _user = User();

  @action
  getCurrentUser() async{
    loading = true;
    var userTest = await _user.get();
    loading = false;
    return userTest.uid;
  }

  fetchPublication() async{
    listPublication = repository.getFeed(await getCurrentUser()).asObservable();
  }

  fetchRequest() async{
    listRequest = repository.getRequest(await getCurrentUser()).asObservable();
  }
 deletePublication(id) async{
    repository.deletePublication(id);
  }

  @observable
  int selectedIndex = 0;

  @action
  void changePage(int index) {
    selectedIndex = index;
  }
}
