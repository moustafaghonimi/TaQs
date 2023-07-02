import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taqs/location/convertAddresse.dart';
import 'package:taqs/location/location.dart';
import 'package:taqs/models/weatherModel.dart';

import '../api/api.dart';

class WeatherProvider with ChangeNotifier {
  bool loading = false;
  final api = Api();
  WeatherModel? _weatherData;
double? lat;
double? long;
  WeatherModel? get weatherData => _weatherData;
  CameraPosition? myLocation;
  GoogleMapController? mapController; //contrller for Google map

  // final Completer<GoogleMapController> mapController =
  //     Completer<GoogleMapController>();
  Set<Marker> markers = {};
  // Set<Marker> markersChange = {};
  int counter=0;

  // String? cityName=currentAddress;


  void getWeather(context) async {
    loading = true;

    var permission = await isPermissionGranted();
    if (permission == false) return;
    var services = await isServicesEnable();
    if (services == false) return;

    locationData = await location.getLocation();
    location.onLocationChanged.listen((event) {
      event = locationData!;
      myLocation = CameraPosition(
        target: LatLng( (lat ?? locationData!.latitude)!, (long??locationData!.longitude)!),
        zoom: 14.4746,
      );
      Marker userMarker = Marker(
        markerId: MarkerId('UserMarker'),
        // draggable: true,
        position: LatLng( (lat ?? locationData!.latitude)!, (long??locationData!.longitude)!),
      );
      markers.add(userMarker);
      // print('lat ${locationData?.latitude} , long ${locationData?.longitude}');
    });
    print('lat ${locationData?.latitude} , long ${locationData?.longitude}');


    String? address = await getAddressFromLatLng(
        (lat ?? locationData!.latitude)!, (long??locationData!.longitude)!);


    //  myLocation = CameraPosition(
    //   target: LatLng(locationData!.latitude!,locationData!.longitude!),
    //   // target: LatLng(30.5361754,31.2800495),
    //   zoom: 14.4746,
    // );

    final response = await api.getWeather(address!);
    print(address);

    if (response.error != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response.error!.info!),
          duration: Duration(seconds: 6),
          action: SnackBarAction(
            label: 'Error',
            onPressed: () {
              // Perform an action when the user taps the action button
            },
          ),
        ),
      );
      // SnackBar(content: Text(response.error!.info!),backgroundColor: Colors.white70,showCloseIcon: true,);
      print(response.error!.info!);
      notifyListeners();
    } else {
      _weatherData = response as WeatherModel?;
      notifyListeners();
    }

    loading = false;
    notifyListeners();
  }

  void changeMarker(LatLng latlong){
    Marker markerChange = Marker(
      markerId: MarkerId('markerChanged${counter}'),
      // draggable: true,
      position: latlong,
    );
    markers.add(markerChange);
    counter++;
    print("mmmmmmmmmmmmmmm ${markers}");
    notifyListeners();
  }

  void deleteMarker(LatLng latlong){
    Marker markerChange = Marker(
      markerId: MarkerId('markerChanged${counter}'),
      // draggable: true,
      position: latlong,
    );
    markers.remove(markerChange);
    counter--;
    notifyListeners();
  }

//   CameraPosition kLake =  CameraPosition(
//     bearing: 192.8334901395799,
//     target: LatLng(37.43296265331129, -122.08832357078792),
//     tilt: 59.440717697143555,
//     zoom: 19.151926040649414);
//
// Future<void> goToTheLake() async {
//   final GoogleMapController controller = await mapController.future;
//   await controller.animateCamera(CameraUpdate.newCameraPosition(kLake));
// }
}
