import 'package:megahackapp/app/models/portfolio_model.dart';
import 'package:megahackapp/app/screens/business_detail/business_detail_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final repository = BusinessRepository();



}
