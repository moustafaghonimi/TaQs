import 'package:flutter/material.dart';

String getImage(String weatherDescriptions) {
  if (weatherDescriptions == 'Clear' ||
      weatherDescriptions == 'Partly cloudy') {
    return 'assets/images/clear.png';

  }
  else if(weatherDescriptions == 'Sunny'){
    return 'assets/images/sunny.png';
  }
  else if (weatherDescriptions== 'Blizzard' ||
      weatherDescriptions == 'Patchy snow possible' ||
      weatherDescriptions == 'Patchy sleet possible' ||
      weatherDescriptions == 'Patchy freezing drizzle possible' ||
      weatherDescriptions == 'Blowing snow') {
    return 'assets/images/snow.png';
  } else if (weatherDescriptions == 'Freezing fog' ||
      weatherDescriptions== 'Fog' ||
      weatherDescriptions == 'Heavy Cloud' ||
      weatherDescriptions == 'Mist' ||
      weatherDescriptions == 'Fog') {
    return 'assets/images/fog.png';
  } else if (weatherDescriptions == 'Patchy rain possible' ||
      weatherDescriptions == 'Heavy Rain' ||
      weatherDescriptions == 'Showers	') {
    return 'assets/images/rainy.png';
  } else if (weatherDescriptions == 'Thundery outbreaks possible' ||
      weatherDescriptions == 'Moderate or heavy snow with thunder' ||
      weatherDescriptions == 'Patchy light snow with thunder' ||
      weatherDescriptions == 'Moderate or heavy rain with thunder' ||
      weatherDescriptions == 'Patchy light rain with thunder') {
    return 'assets/images/thunderstorm.png';
  } else {
    return 'assets/images/clear.png';
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
      weatherDescriptions == 'Heavy Cloud' ||
      weatherDescriptions == 'Mist' ||
      weatherDescriptions == 'Fog') {
    return 'assets/images/wind.jpeg';
  } else if (weatherDescriptions == 'Patchy rain possible' ||
      weatherDescriptions == 'Heavy Rain' ||
      weatherDescriptions == 'Showers	') {
    return 'assets/images/rain.jpeg';
  } else if (weatherDescriptions == 'Thundery outbreaks possible' ||
      weatherDescriptions == 'Moderate or heavy snow with thunder' ||
      weatherDescriptions == 'Patchy light snow with thunder' ||
      weatherDescriptions == 'Moderate or heavy rain with thunder' ||
      weatherDescriptions == 'Patchy light rain with thunder') {
    return 'assets/images/thunder.jpeg';
  } else {
    return 'assets/images/clear.png';
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
      weatherDescriptions == 'Heavy Cloud' ||
      weatherDescriptions == 'Mist' ||
      weatherDescriptions == 'Fog') {
    return Colors.blueGrey;
  } else if (weatherDescriptions == 'Patchy rain possible' ||
      weatherDescriptions == 'Heavy Rain' ||
      weatherDescriptions == 'Showers	') {
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