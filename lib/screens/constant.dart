import 'package:flutter/material.dart';
Color getColor(String weatherDescriptions) {
  if (weatherDescriptions == 'Clear' ||
      weatherDescriptions == 'Partly cloudy') {
    return Colors.white70;

  }
  else if(weatherDescriptions == 'Sunny'){
    return Colors.orangeAccent;
  }
  else if (weatherDescriptions== 'Blizzard' ||
      weatherDescriptions == 'Patchy snow possible' ||
      weatherDescriptions == 'Patchy sleet possible' ||
      weatherDescriptions == 'Patchy freezing drizzle possible' ||
      weatherDescriptions == 'Blowing snow') {
    return Colors.white70;
  } else if (weatherDescriptions == 'Freezing fog' ||
      weatherDescriptions== 'Fog' ||
      weatherDescriptions == 'Overcast' ||
      weatherDescriptions == 'Mist' ||
      weatherDescriptions == 'Fog') {
    return Colors.white70;
  } else if (weatherDescriptions == 'Patchy rain possible' ||
      weatherDescriptions == 'Light Rain' ||
      weatherDescriptions == 'Light Rain Shower') {
    return Colors.white70;
  } else if (weatherDescriptions == 'Thundery outbreaks possible' ||
      weatherDescriptions == 'Moderate or heavy snow with thunder' ||
      weatherDescriptions == 'Patchy light snow with thunder' ||
      weatherDescriptions == 'Moderate or heavy rain with thunder' ||
      weatherDescriptions == 'Patchy light rain with thunder') {
    return Colors.white70;
  } else {
    return Colors.white70;
  }}

String getImage(String weatherDescriptions) {
  if (weatherDescriptions == 'Clear' ||
      weatherDescriptions == 'Partly cloudy') {
    return 'assets/images/clear.gif';

  }
  else if(weatherDescriptions == 'Sunny'){
    return 'assets/images/sunny.gif';
  }
  else if(weatherDescriptions == 'Overcast'){
    return 'assets/images/overcast.gif';
  }
  else if (weatherDescriptions== 'Blizzard' ||
      weatherDescriptions == 'Patchy snow possible' ||
      weatherDescriptions == 'Patchy sleet possible' ||
      weatherDescriptions == 'Patchy freezing drizzle possible' ||
      weatherDescriptions == 'Blowing snow') {
    return 'assets/images/snow.gif';
  } else if (weatherDescriptions == 'Freezing fog' ||
      weatherDescriptions== 'Fog' ||
      weatherDescriptions == 'Mist' ||
      weatherDescriptions == 'Fog') {
    return 'assets/images/fog.gif';
  } else if (weatherDescriptions == 'Patchy rain possible' ||
      weatherDescriptions == 'Light Rain' ||
      weatherDescriptions == 'Light Rain Shower') {
    return 'assets/images/rainy.gif';
  } else if (weatherDescriptions == 'Thundery outbreaks possible' ||
      weatherDescriptions == 'Moderate or heavy snow with thunder' ||
      weatherDescriptions == 'Patchy light snow with thunder' ||
      weatherDescriptions == 'Moderate or heavy rain with thunder' ||
      weatherDescriptions == 'Patchy light rain with thunder') {
    return 'assets/images/thunderstorm.gif';
  } else {
    return 'assets/images/clear.gif';
  }
}
String getImageBg(String weatherDescriptions) {
  if (weatherDescriptions == 'Clear' ||
      weatherDescriptions == 'Partly cloudy') {
    return 'assets/images/clear.jpeg';

  }
  else if(weatherDescriptions == 'Sunny'){
    return 'assets/images/sunnyBg.jpeg';
  }
  else if (weatherDescriptions== 'Blizzard' ||
      weatherDescriptions == 'Patchy snow possible' ||
      weatherDescriptions == 'Patchy sleet possible' ||
      weatherDescriptions == 'Patchy freezing drizzle possible' ||
      weatherDescriptions == 'Blowing snow') {
    return 'assets/images/snow.jpeg';
  } else if (weatherDescriptions == 'Freezing fog' ||
      weatherDescriptions== 'Fog' ||
      weatherDescriptions == 'Overcast' ||
      weatherDescriptions == 'Mist' ||
      weatherDescriptions == 'Fog') {
    return 'assets/images/wind.jpeg';
  } else if (weatherDescriptions == 'Patchy rain possible' ||
      weatherDescriptions == 'Light Rain' ||
      weatherDescriptions == 'Light Rain Shower') {
    return 'assets/images/rain.jpeg';
  } else if (weatherDescriptions == 'Thundery outbreaks possible' ||
      weatherDescriptions == 'Moderate or heavy snow with thunder' ||
      weatherDescriptions == 'Patchy light snow with thunder' ||
      weatherDescriptions == 'Moderate or heavy rain with thunder' ||
      weatherDescriptions == 'Patchy light rain with thunder') {
    return 'assets/images/thunder.jpeg';
  } else {
    return 'assets/images/clear.jpeg';
  }
}

MaterialColor getThemeColor(String weatherDescriptions) {
  if (
      weatherDescriptions == 'Clear' ||
      weatherDescriptions == 'Partly cloudy') {
    return Colors.blue;
  }

  else if (weatherDescriptions == 'Sunny' ){
    return Colors.orange;

  }

  else if (weatherDescriptions == 'Blizzard' ||
      weatherDescriptions == 'Patchy snow possible' ||
      weatherDescriptions == 'Patchy sleet possible' ||
      weatherDescriptions == 'Patchy freezing drizzle possible' ||
      weatherDescriptions == 'Blowing snow') {
    return Colors.blue;
  } else if (weatherDescriptions == 'Freezing fog' ||
      weatherDescriptions == 'Fog' ||
      weatherDescriptions == 'Overcast' ||
      weatherDescriptions == 'Mist' ||
      weatherDescriptions == 'Fog') {
    return Colors.blueGrey;
  } else if (weatherDescriptions == 'Patchy rain possible' ||
      weatherDescriptions == 'Light Rain' ||
      weatherDescriptions == 'Light Rain Shower') {
    return Colors.blue;
  } else if (weatherDescriptions == 'Thundery outbreaks possible' ||
      weatherDescriptions == 'Moderate or heavy snow with thunder' ||
      weatherDescriptions == 'Patchy light snow with thunder' ||
      weatherDescriptions == 'Moderate or heavy rain with thunder' ||
      weatherDescriptions == 'Patchy light rain with thunder') {
    return Colors.deepPurple;
  } else {
    return Colors.orange;
  }
}