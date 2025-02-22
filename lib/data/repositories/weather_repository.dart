import 'package:weather_clean/data/data_sources/weather_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/weather_forecast.dart';

@singleton
class WeatherRepository {
  final WeatherDataSource weatherDataSource;

  WeatherRepository(this.weatherDataSource);

  Future<WeatherForecast?> getWeather(cityName) {
    return weatherDataSource.fetchWeatherForecast(cityName);
  }
}
