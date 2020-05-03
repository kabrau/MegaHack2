import 'package:mobx/mobx.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  @observable
  String login;

  @observable
  String password;

  @computed
  bool get isValid {
    return true;
  }

  @action
  changeLogin(value) => login = value;

  @action
  changePassword(value) => password = value;
}
