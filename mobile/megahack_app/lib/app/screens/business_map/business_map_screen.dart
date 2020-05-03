import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class BusinessMapScreen extends StatefulWidget {
  @override
  _BusinessMapScreenState createState() => _BusinessMapScreenState();
}

class _BusinessMapScreenState extends State<BusinessMapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    super.initState();
  }
  double zoomVal = 5.0;
  var _marker = {
    saoPauloMarker,
    sao2PauloMarker,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("Vizinhaça"),
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

  Widget _googleMap(context){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(

        mapType: MapType.normal,
        buildingsEnabled: false,

        initialCameraPosition: CameraPosition(
            target: LatLng(-23.5467233,-46.4957697), zoom: 15,
        ),
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
        markers: _marker
      ),
    );
  }
}

Marker saoPauloMarker = Marker(
  markerId: MarkerId("company_002"),
  position: LatLng(-23.544923, -46.493243),
  infoWindow: InfoWindow(title: "Lojinha do bebum"),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
);

Marker sao2PauloMarker = Marker(
  markerId: MarkerId("company_001"),
  position: LatLng(-23.545169, -46.493283),
  infoWindow: InfoWindow(title: "Lojinha da sóbria"),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
);