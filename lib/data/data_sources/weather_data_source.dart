import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

import '../../utilities/constants.dart';
import '../dto/location_dto.dart';
import '../dto/weather_forecast_dto.dart';

@singleton
class WeatherDataSource {
  static const String _apiKey = Constants.WEATHER_APP_ID;
  static const String _unitsKey = 'units';
  static const String _langKey = 'lang';
  static const String _cityKey = 'q';
  static const String _latKey = 'lat';
  static const String _lonKey = 'lon';
  static const String _appIdKey = 'APPID';
  static const String _baseUrl = Constants.WEATHER_BASE_URL_DOMAIN;
  static const String _forecastPath = Constants.WEATHER_FORECAST_PATH;

  WeatherDataSource();

  Future<WeatherForecastDto> getForecastByCityName(String cityName) async {

    final parameters = {
      _appIdKey: _apiKey,
      _unitsKey: "metric",
      _cityKey: cityName,
      _langKey: "RU",
    };

    return _sendResponse(parameters);
  }

  Future<WeatherForecastDto> getForecastByLocation(LocationDto location) async {

    final parameters = {
      _appIdKey: _apiKey,
      _unitsKey: "metric",
      _latKey: location.latitude.toString(),
      _lonKey: location.longitude.toString(),
      _langKey: "RU",
    };

    return _sendResponse(parameters);
  }

  Future<WeatherForecastDto> _sendResponse(Map<String, String>? parameters) async {
    final uri = Uri.https(
      _baseUrl,
      _forecastPath,
      parameters,
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return WeatherForecastDto.fromJson(json.decode(response.body));
    } else {
      throw Exception("Response result ${response.statusCode}");
    }
  }
}
