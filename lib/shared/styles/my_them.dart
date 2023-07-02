import 'package:flutter/material.dart';

import 'colors.dart';

class MyThemeData {


  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: colorGreen,
    primaryColor: primaryColor,
    colorScheme: const ColorScheme(
      primary: primaryColor,
      onPrimary: onprimaryColor,
      error: Colors.red,
      onError: Colors.white,
      background: colorGreen,
      onBackground: Colors.white,
      surface: Colors.black,
      onSurface:primaryColor,
      secondary: colorGreen,
      onSecondary: primaryColor,
      brightness: Brightness.light,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(primaryColor),elevation: MaterialStateProperty.all(3),
        )
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: primaryColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      // backgroundColor: Colors.white,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
    ),
    textTheme: const TextTheme(
    titleMedium: TextStyle(
    fontSize: 20,
    color:Colors.black,
    ),
      displayLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: primaryDarkColor,
    primaryColor: primaryDarkColor,
    colorScheme: const ColorScheme(
      primary: primaryDarkColor,
      onPrimary: onprimaryDarkColor,
      error: Colors.red,
      onError: Colors.white,
      background: colorGreen,
      onBackground: Colors.white,
      surface:Colors.white,
      onSurface: Colors.white,
      secondary: primaryDarkColor,
      onSecondary: primaryDarkColor,
      brightness: Brightness.light,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
      highlightElevation: 3,
      splashColor: Colors.white,

      iconSize: 25,

    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(primaryColor),elevation: MaterialStateProperty.all(3),shadowColor: MaterialStateProperty.all(Colors.white)
        )
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: primaryColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      // backgroundColor: Color.fromRGBO(20, 25, 34, 1.0),
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.black,
      elevation: 7
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontSize: 20,
        color:Colors.white,
      ),
      displayLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );}
