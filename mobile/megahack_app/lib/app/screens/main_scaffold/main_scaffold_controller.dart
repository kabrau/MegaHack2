import 'package:megahackapp/app/screens/main_scaffold/main_scaffold_repository.dart';
import 'package:mobx/mobx.dart';

part 'main_scaffold_controller.g.dart';

class MainScaffoldController = _MainScaffoldControllerBase with _$MainScaffoldController;

abstract class _MainScaffoldControllerBase with Store {
  final repository = MainScaffoldRepository();

  fetchCategories(){
//    repository.getCategory();
  }
  @observable
  int selectedIndex = 0;

  @action
  void changePage(int index) {
    selectedIndex = index;
  }
}
