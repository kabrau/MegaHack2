import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:megahackapp/app/screens/register/register_repository.dart';
import 'package:mobx/mobx.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {

  final repository = RegisterRepository();
  @observable
  String name;
  @observable
  String cpf;
  @observable
  String mobile;
  @observable
  String email;
  @observable
  String login;
  @observable
  String address;
  @observable
  String password;

  @computed
  bool get isValid {
    return true;
  }

  @action
  changeName(value){
    name = value;
  }
  @action
  changeLogin(value) => login = value;
  @action
  changePassword(value) => password = value;
  @action
  changeCpf(value) => cpf = value;
  @action
  changeMobile(value) => mobile = value;
  @action
  changeEmail(value) => email = value;
  @action
  changeAddress(value) => address = value;

  String validateName(value){
    if(value.isEmpty){
      return "Este campo não pode ser vazio";
    }
    return null;
  }
  String validateAddress(value){
    if(value.isEmpty){
      return "Este campo não pode ser vazio";
    }
    return null;
  }
  String validateCpf(value) {
    if(value.isEmpty){
      return "Este campo não pode ser vazio";
    } else if(!CPFValidator.isValid(cpf)){
      return "Digite um CPF válido";
    }
    return null;
  }


  String validateEmail(value){
    if(value.isEmpty){
      return "Informe o e-mail para entrar";
    } else if(!email.contains("@")) {
      return "Email não é válido";
    }
    return null;
  }

  String validateMobile(value){
    Pattern pattern =
        r'^(?:[+0]9)?[0-9]{9}$';
    RegExp regex = new RegExp(pattern);
    if(value.isEmpty){
      return 'Este campo não pode ser vazio';
    } else if (!regex.hasMatch(value)){
      return 'Digite um número válido';
    }
    return null;
  }
  String validateLogin(value){
    if(value.isEmpty){
      return 'Este campo não pode ser vazio';
    }
    return null;
  }
  String validatePassword(value){
    if(value.isEmpty){
      return 'Este campo não pode ser vazio';
    } else if(value.length < 4) {
      return 'A senha precisa ter ao menos 4 caracteres';
    }
    return null;
  }

  registerUser() async{
    return await repository.registerUser(name, login, email, password);
  }
}
