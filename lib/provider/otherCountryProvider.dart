// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:taqs/models/weatherModel.dart';
//
// import '../api/api.dart';
//
// class OtherCountryProvider extends ChangeNotifier {
//   bool loading = false;
//   final api = Api();
//   WeatherModel? _weatherData;
//   WeatherModel? get weatherData => _weatherData;
//   // String? cityName=currentAddress;
//
//   getWeatherCountry(context,String cityName) async {
//     loading = true;
//
//
//
//     final response = await api.getWeather(cityName);
//
//     if (response.error != null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(response.error!.info!),
//           duration: Duration(seconds: 6),
//           action: SnackBarAction(
//             label: 'Error',
//             onPressed: () {
//               // Perform an action when the user taps the action button
//             },
//           ),
//         ),
//       );
//       // SnackBar(content: Text(response.error!.info!),backgroundColor: Colors.white70,showCloseIcon: true,);
//       print(response.error!.info!);
//       notifyListeners();
//     } else {
//       _weatherData = response as WeatherModel?;
//       notifyListeners();
//     }
//
//     loading = false;
//     notifyListeners();
//   }
//
//
// }
