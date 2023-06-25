import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taqs/location/convertAddresse.dart';
import 'package:taqs/location/location.dart';
import 'package:taqs/models/weatherModel.dart';

import '../api/api.dart';

class WeatherProvider with ChangeNotifier {
  bool loading = false;
  final api = Api();
  WeatherModel? _weatherData;
  WeatherModel? get weatherData => _weatherData;
   // String? cityName=currentAddress;

  // void getWeatherToOtherCountry(context,String cityName) async {
  //   loading = true;
  //
  //
  //
  //   final response = await api.getWeather(cityName);
  //
  //   if (response.error != null) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text(response.error!.info!),
  //         duration: Duration(seconds: 6),
  //         action: SnackBarAction(
  //           label: 'Error',
  //           onPressed: () {
  //             // Perform an action when the user taps the action button
  //           },
  //         ),
  //       ),
  //     );
  //     // SnackBar(content: Text(response.error!.info!),backgroundColor: Colors.white70,showCloseIcon: true,);
  //     print(response.error!.info!);
  //     notifyListeners();
  //   } else {
  //     _weatherData = response as WeatherModel?;
  //     notifyListeners();
  //   }
  //
  //   loading = false;
  //   notifyListeners();
  // }



  void getWeather(context) async {
    loading = true;

    var permission=await isPermissionGranted();
    if(permission==false) return;
    var services=await isServicesEnable();
    if(services==false) return;

    locationData= await location.getLocation();
    location.onLocationChanged.listen((event) {
      event=locationData!;
      print('lat ${locationData?.latitude} , long ${locationData?.longitude}');

    });
    print('lat ${locationData?.latitude} , long ${locationData?.longitude}');

    String? address = await getAddressFromLatLng(locationData!.longitude??30, locationData!.latitude??31);


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


}
