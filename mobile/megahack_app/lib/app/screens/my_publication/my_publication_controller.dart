import 'package:megahackapp/app/models/publication_model.dart';
import 'package:megahackapp/app/screens/my_publication/my_publication_repository.dart';
import 'package:mobx/mobx.dart';

part 'my_publication_controller.g.dart';

class MyPublicationController = _MyPublicationControllerBase with _$MyPublicationController;

abstract class _MyPublicationControllerBase with Store {
  final repository = MyPublicationRepository();

  @observable
  ObservableFuture<List<Publication>> listPublication;


  fetchPublication(){
    listPublication = repository.getFeed().asObservable();
  }

  @observable
  int selectedIndex = 0;

  @action
  void changePage(int index) {
    selectedIndex = index;
  }
}
