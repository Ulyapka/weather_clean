import 'package:weather_clean/data/dto/weather_list_dto.dart';

import 'city_dto.dart';

class WeatherForecastDto {
  CityDto? city;
  String? cod;
  num? message;
  num? cnt;
  List<WeatherListDto>? list;

  WeatherForecastDto({
    this.city,
    this.cod,
    this.message,
    this.cnt,
    this.list,
  });

  WeatherForecastDto.fromJson(Map<String, dynamic> json) {
    city = json['city'] != null ? CityDto.fromJson(json['city']) : null;
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      list = <WeatherListDto>[];
      json['list'].forEach((v) {
        list!.add(WeatherListDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (city != null) {
      data['city'] = city!.toJson();
    }
    data['cod'] = cod;
    data['message'] = message;
    data['cnt'] = cnt;
    if (list != null) {
      data['list'] = list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}