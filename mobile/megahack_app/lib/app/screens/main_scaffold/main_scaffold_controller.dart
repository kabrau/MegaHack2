import 'package:mobx/mobx.dart';

part 'main_scaffold_controller.g.dart';

class MainScaffoldController = _MainScaffoldControllerBase with _$MainScaffoldController;

abstract class _MainScaffoldControllerBase with Store {
  @observable
  int selectedIndex = 0;

  @action
  void changePage(int index) {
    selectedIndex = index;
  }
}
