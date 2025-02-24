import 'package:weather_clean/domain/entities/dto/temp_dto.dart';
import 'package:weather_clean/domain/entities/dto/weather_dto.dart';

import '../../../utilities/constants.dart';
import 'feels_like_dto.dart';

class WeatherListDto {
  num? dt;
  num? sunrise;
  num? sunset;
  TempDto? temp;
  FeelsLikeDto? feelsLike;
  num? pressure;
  int? humidity;
  List<WeatherDto>? weather;
  num? speed;
  num? deg;
  num? gust;
  num? clouds;
  num? pop;
  num? rain;

  WeatherListDto({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.weather,
    this.speed,
    this.deg,
    this.gust,
    this.clouds,
    this.pop,
    this.rain,
  });

  WeatherListDto.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    temp = json['temp'] != null ? TempDto.fromJson(json['temp']) : null;
    feelsLike = json['feels_like'] != null ? FeelsLikeDto.fromJson(json['feels_like']) : null;
    pressure = json['pressure'];
    humidity = json['humidity'];
    if (json['weather'] != null) {
      weather = <WeatherDto>[];
      json['weather'].forEach((v) {
        weather!.add(WeatherDto.fromJson(v));
      });
    }
    speed = json['speed'];
    deg = json['deg'];
    gust = json['gust'];
    clouds = json['clouds'];
    pop = json['pop'];
    rain = json['rain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    if (temp != null) {
      data['temp'] = temp!.toJson();
    }
    if (feelsLike != null) {
      data['feels_like'] = feelsLike!.toJson();
    }
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    data['speed'] = speed;
    data['deg'] = deg;
    data['gust'] = gust;
    data['clouds'] = clouds;
    data['pop'] = pop;
    data['rain'] = rain;
    return data;
  }

  String getIconUrl() {
    return '${Constants.WEATHER_IMAGES_URL}${weather?[0].icon}.png';
  }
}