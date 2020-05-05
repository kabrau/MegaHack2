import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:megahackapp/app/models/user_model.dart';
import 'package:megahackapp/app/screens/create_business/create_business_repository.dart';
import 'package:megahackapp/app/screens/create_publication/create_publication_repository.dart';
import 'package:mobx/mobx.dart';

part 'create_business_controller.g.dart';

class CreateBusinessController = _CreateBusinessControllerBase with _$CreateBusinessController;

abstract class _CreateBusinessControllerBase with Store {
  final repository = CreateBusinessRepository();


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
//    return await repository.createPublication(description, user.uid, user.urlAvatar, user.name);
  }
  @observable
  String name;
  @observable
  String cnpj;
  @observable
  String mobile;
  @observable
  String site;
  @observable
  String category;
  @observable
  String address;
  @observable
  String cep;
  @observable
  String number;
  @observable
  String city;
  @observable
  String state;

  @computed
  bool get isValid {
    return true;
  }
  @action
  changeName(value){
    name = value;
  }
  @action
  changeCategory(value) => category = value;
  @action
  changeAddress(value) => address = value;
  @action
  changeCep(value) => cep = value;
  @action
  changeNumber(value) => number = value;
  @action
  changeCity(value) => city = value;
  @action
  changeState(value) => state = value;
  @action
  changeCnpj(value) => cnpj = value;
  @action
  changeMobile(value) => mobile = value;
  @action
  changeEmail(value) => site = value;

  String validateName(value){
    if(value.isEmpty){
      return "Este campo não pode ser vazio";
    }
    return null;
  }
  String validateCnpj(value) {
    if(value.isEmpty){
      return "Este campo não pode ser vazio";
    } else if(!CNPJValidator.isValid(cnpj)){
      return "Digite um CPF válido";
    }
    return null;
  }
  String validateCategory(value){
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

  String validateSite(value){
    if(value.isEmpty){
      return "Este campo não pode ser vazio";
    } else if(!site.contains("@")) {
      return "Email não é válido";
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
//    return await repository.registerUser(name, category, site, password);
  }
}
