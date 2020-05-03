import 'package:megahackapp/app/models/user_model.dart';
import 'package:megahackapp/app/screens/profile/profile_repository.dart';
import 'package:mobx/mobx.dart';

part 'profile_controller.g.dart';

class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  final repository = ProfileRepository();

  @observable
  ObservableFuture<User> user;

  @action
  getCurrentUser() {
    user = repository.getProfile().asObservable();
  }
}
