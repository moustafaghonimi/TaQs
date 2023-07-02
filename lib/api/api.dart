
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weatherModel.dart';
 class Api{

   // String apiKey='c9958af0782d7f3f25afcf641e6b2c29';
   // String apiKey='251a6160f6ac9240cc34c2d3c71228f0';
   String apiKey='c9958af0782d7f3f25afcf641e6b2c29';
  Future<WeatherModel> getWeather( String cityName)async{
     Uri url=Uri.parse('http://api.weatherstack.com/current?access_key=$apiKey&query=$cityName&forecast_days =7');
     http.Response response=await http.get(url);
     if (response.statusCode == 400) {
       var data  = jsonDecode(response.body);
       throw Exception(data['error']['message']);
     }
     Map<String,dynamic> data=jsonDecode(response.body);
     WeatherModel weatherModel =WeatherModel.fromJson(data);
     return weatherModel;
   }
 }
 // map api
//AIzaSyC9ZwqMEFSatRomdDHIuNljKJd7W002WUA