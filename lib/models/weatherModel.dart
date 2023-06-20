import 'package:flutter/material.dart';

/// request : {"type":"City","query":"New York, United States of America","language":"en","unit":"m"}
/// location : {"name":"New York","country":"United States of America","region":"New York","lat":"40.714","lon":"-74.006","timezone_id":"America/New_York","localtime":"2023-06-19 06:52","localtime_epoch":1687157520,"utc_offset":"-4.0"}
/// current : {"observation_time":"10:52 AM","temperature":19,"weather_code":116,"weather_icons":["https://cdn.worldweatheronline.com/images/wsymbols01_png_64/wsymbol_0002_sunny_intervals.png"],"weather_descriptions":["Partly cloudy"],"wind_speed":6,"wind_degree":60,"wind_dir":"ENE","pressure":1017,"precip":0,"humidity":70,"cloudcover":75,"feelslike":19,"uv_index":5,"visibility":16,"is_day":"yes"}

class WeatherModel {
  WeatherModel({
    this.request,
    this.location,
    this.current,
    this.success,
    this.error,
  });

  WeatherModel.fromJson(dynamic json) {
    request =
        json['request'] != null ? Request.fromJson(json['request']) : null;
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    current =
        json['current'] != null ? Current.fromJson(json['current']) : null;
    success = json['success'];
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
  }

  Request? request;
  Location? location;
  Current? current;
  bool? success;
  Error? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (request != null) {
      map['request'] = request?.toJson();
    }
    if (location != null) {
      map['location'] = location?.toJson();
    }
    if (current != null) {
      map['current'] = current?.toJson();
    }
    map['success'] = success;
    if (error != null) {
      map['error'] = error?.toJson();
    }
    return map;
  }
}

/// observation_time : "10:52 AM"
/// temperature : 19
/// weather_code : 116
/// weather_icons : ["https://cdn.worldweatheronline.com/images/wsymbols01_png_64/wsymbol_0002_sunny_intervals.png"]
/// weather_descriptions : ["Partly cloudy"]
/// wind_speed : 6
/// wind_degree : 60
/// wind_dir : "ENE"
/// pressure : 1017
/// precip : 0
/// humidity : 70
/// cloudcover : 75
/// feelslike : 19
/// uv_index : 5
/// visibility : 16
/// is_day : "yes"

class Current {
  Current({
    this.observationTime,
    this.temperature,
    this.weatherCode,
    this.weatherIcons,
    this.weatherDescriptions,
    this.windSpeed,
    this.windDegree,
    this.windDir,
    this.pressure,
    this.precip,
    this.humidity,
    this.cloudcover,
    this.feelslike,
    this.uvIndex,
    this.visibility,
    this.isDay,
  });



  Current.fromJson(dynamic json) {
    observationTime = json['observation_time'];
    temperature = json['temperature'];
    weatherCode = json['weather_code'];
    weatherIcons = json['weather_icons'] != null
        ? json['weather_icons'].cast<String>()
        : [];
    weatherDescriptions = json['weather_descriptions'] != null
        ? json['weather_descriptions'].cast<String>()
        : [];
    windSpeed = json['wind_speed'];
    windDegree = json['wind_degree'];
    windDir = json['wind_dir'];
    pressure = json['pressure'];
    precip = json['precip'];
    humidity = json['humidity'];
    cloudcover = json['cloudcover'];
    feelslike = json['feelslike'];
    uvIndex = json['uv_index'];
    visibility = json['visibility'];
    isDay = json['is_day'];
  }

  String? observationTime;
  num? temperature;
  num? weatherCode;
  List<String>? weatherIcons;
  List<String>? weatherDescriptions;
  num? windSpeed;
  num? windDegree;
  String? windDir;
  num? pressure;
  num? precip;
  num? humidity;
  num? cloudcover;
  num? feelslike;
  num? uvIndex;
  num? visibility;
  String? isDay;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['observation_time'] = observationTime;
    map['temperature'] = temperature;
    map['weather_code'] = weatherCode;
    map['weather_icons'] = weatherIcons;
    map['weather_descriptions'] = weatherDescriptions;
    map['wind_speed'] = windSpeed;
    map['wind_degree'] = windDegree;
    map['wind_dir'] = windDir;
    map['pressure'] = pressure;
    map['precip'] = precip;
    map['humidity'] = humidity;
    map['cloudcover'] = cloudcover;
    map['feelslike'] = feelslike;
    map['uv_index'] = uvIndex;
    map['visibility'] = visibility;
    map['is_day'] = isDay;
    return map;
  }
}

/// name : "New York"
/// country : "United States of America"
/// region : "New York"
/// lat : "40.714"
/// lon : "-74.006"
/// timezone_id : "America/New_York"
/// localtime : "2023-06-19 06:52"
/// localtime_epoch : 1687157520
/// utc_offset : "-4.0"

class Location {
  Location({
    this.name,
    this.country,
    this.region,
    this.lat,
    this.lon,
    this.timezoneId,
    this.localtime,
    this.localtimeEpoch,
    this.utcOffset,
  });

  Location.fromJson(dynamic json) {
    name = json['name'];
    country = json['country'];
    region = json['region'];
    lat = json['lat'];
    lon = json['lon'];
    timezoneId = json['timezone_id'];
    localtime = json['localtime'];
    localtimeEpoch = json['localtime_epoch'];
    utcOffset = json['utc_offset'];
  }

  String? name;
  String? country;
  String? region;
  String? lat;
  String? lon;
  String? timezoneId;
  String? localtime;
  num? localtimeEpoch;
  String? utcOffset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['country'] = country;
    map['region'] = region;
    map['lat'] = lat;
    map['lon'] = lon;
    map['timezone_id'] = timezoneId;
    map['localtime'] = localtime;
    map['localtime_epoch'] = localtimeEpoch;
    map['utc_offset'] = utcOffset;
    return map;
  }
}

/// type : "City"
/// query : "New York, United States of America"
/// language : "en"
/// unit : "m"

class Request {
  Request({
    this.type,
    this.query,
    this.language,
    this.unit,
  });

  Request.fromJson(dynamic json) {
    type = json['type'];
    query = json['query'];
    language = json['language'];
    unit = json['unit'];
  }

  String? type;
  String? query;
  String? language;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['query'] = query;
    map['language'] = language;
    map['unit'] = unit;
    return map;
  }
}

class Error {
  Error({
    this.code,
    this.type,
    this.info,
  });

  Error.fromJson(dynamic json) {
    code = json['code'];
    type = json['type'];
    info = json['info'];
  }

  num? code;
  String? type;
  String? info;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['type'] = type;
    map['info'] = info;
    return map;
  }
}
