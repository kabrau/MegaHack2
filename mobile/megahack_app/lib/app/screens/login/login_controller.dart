import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  String login;

  @observable
  String password;

  @computed
  bool get isValid {
    return login != null && password != null && login != "" && password !="";
  }

  @action
  changeLogin(value) => login = value;

  @action
  changePassword(value) => password = value;
}
