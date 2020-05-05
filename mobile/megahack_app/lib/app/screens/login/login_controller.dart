import 'package:megahackapp/app/screens/login/login_repository.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final repository = LoginRepository();
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

  loginUser() async{
    return await repository.loginUser(login, password);
  }
}
