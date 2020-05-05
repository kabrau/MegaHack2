import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:megahackapp/app/models/company_model.dart';
import 'package:megahackapp/app/models/coordenate_model.dart';
import 'package:megahackapp/app/shared/constants.dart';


class BusinessMapScreen extends StatefulWidget {
  final double lat;
  final double lng;
  final Company company;
  BusinessMapScreen({this.company, this.lat, this.lng});
  @override
  _BusinessMapScreenState createState() => _BusinessMapScreenState();
}

class _BusinessMapScreenState extends State<BusinessMapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> allMarkers =[];
  @override
  void initState() {
    allMarkers.add( Marker(
      markerId: MarkerId(this.widget.company.uid),
      position: LatLng(this.widget.lat,this.widget.lng),
      infoWindow: InfoWindow(title: this.widget.company.name),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    ));
    super.initState();
  }
  double zoomVal = 5.0;
  var _marker = {
    saoPauloMarker,
    sao2PauloMarker,
  };
  

  @override
  Widget build(BuildContext context) {
    var currentMarkerBusiness =
  print("to auiiiiiiiiiiiiiiiiiiii");
  print(this.widget.lng);
  print(this.widget.lat);
    return Scaffold(appBar: AppBar(
      backgroundColor: blankColor,
      title: Text(
        "Google Maps",
        style: TextStyle(
            color: primaryColor,
            fontFamily: "AvenirLTStd Roman",
            fontSize: 22),
      ),
      centerTitle: true,
      iconTheme: IconThemeData(color: primaryColor),
    ),
      body: Stack(
        children: <Widget>[
          _googleMap(context),
//          _zoominusfunction(),
//          _zommplusfunction(),
//          _buildContainer(),
        ],
      ),
    );
  }
  Widget _googleMap(context,{currentMarker}){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        buildingsEnabled: false,
        initialCameraPosition: CameraPosition(
            target: this.widget.company != null ? LatLng(this.widget.lat,this.widget.lng): LatLng(-23.5467233,-46.4957697),zoom: 15,
        ),
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
        markers: this.widget.company != null ? Set.from(allMarkers) :_marker
      ),
    );

  }
}

Marker saoPauloMarker = Marker(
  markerId: MarkerId("company_008"),
  position: LatLng(-23.544923, -46.493243),
  infoWindow: InfoWindow(title: "Lojinha do bebum"),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
);

Marker sao2PauloMarker = Marker(
  markerId: MarkerId("company_009"),
  position: LatLng(-23.545169, -46.493283),
  infoWindow: InfoWindow(title: "Lojinha da sóbria"),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
);
