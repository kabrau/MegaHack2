import 'package:geocoder/geocoder.dart';
import 'package:megahackapp/app/models/coordenate_model.dart';
import 'package:megahackapp/app/models/portfolio_model.dart';
import 'package:megahackapp/app/screens/business_detail/business_detail_repository.dart';
import 'package:megahackapp/app/shared/env_constants.dart';
import 'package:mobx/mobx.dart';

part 'business_detail_controller.g.dart';

class BusinessDetailController = _BusinessDetailControllerBase with _$BusinessDetailController;

abstract class _BusinessDetailControllerBase with Store {
  final repository = BusinessRepository();


  @observable
  ObservableFuture<List<Portfolio>> listPortfolio;
  @observable
  double lng;
  @observable
  double lat;

  fetchCoordenate(address, number ,city, state) async{
    final query =  "$address, $number, $city, $state";
    var addresses = await Geocoder.local.findAddressesFromQuery(query);
    var first = addresses.first;
    print("${first.featureName} : ${first.coordinates}");
    lng = first.coordinates.longitude;
    lat = first.coordinates.latitude;
  }
  fetchPortfolios(String companyId){
    listPortfolio = repository.getPortfolio(companyId).asObservable();
  }
}
