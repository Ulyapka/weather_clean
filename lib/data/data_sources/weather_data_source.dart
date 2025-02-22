import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

import '../../domain/entities/weather_forecast.dart';
import '../../utilities/constants.dart';
import '../../domain/use_cases/get_location_use_case.dart';

@singleton
class WeatherDataSource {
  final GetLocationUseCase getLocationUseCase;

  WeatherDataSource(this.getLocationUseCase);

  static const String _apiKey = Constants.WEATHER_APP_ID;
  static const String _unitsKey = 'units';
  static const String _langKey = 'lang';
  static const String _cityKey = 'q';
  static const String _latKey = 'lat';
  static const String _lonKey = 'lon';
  static const String _appIdKey = 'APPID';
  static const String _baseUrl = Constants.WEATHER_BASE_URL_DOMAIN;
  static const String _forecastPath = Constants.WEATHER_FORECAST_PATH;

  Future<WeatherForecast?> fetchWeatherForecast(String cityName) async {
    Map<String, String>? parameters;

    final location = await getLocationUseCase.getCurrentLocation();
    if (location == null) {
      return null;
    }

    if (cityName.isNotEmpty) {
      parameters = {
        _appIdKey: _apiKey,
        _unitsKey: "metric",
        _cityKey: cityName,
        _langKey: "RU",
      };
    } else {
      parameters = {
        _appIdKey: _apiKey,
        _unitsKey: "metric",
        _latKey: location.latitude.toString(),
        _lonKey: location.longitude.toString(),
        _langKey: "RU",
      };
    }

    final uri = Uri.https(
      _baseUrl,
      _forecastPath,
      parameters,
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error response');
    }
  }
}
