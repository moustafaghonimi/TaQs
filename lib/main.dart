import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taqs/provider/weatherProvider.dart';
import 'package:taqs/screens/home/home_screen.dart';

void main() {

  runApp(ChangeNotifierProvider<WeatherProvider>(create: (context) => WeatherProvider(),child:MyApp() ,) );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner:false ,
      initialRoute: HomeScreen.routName,
      routes: {
        HomeScreen.routName: (context) => HomeScreen(),
      },
    );
  }
}

