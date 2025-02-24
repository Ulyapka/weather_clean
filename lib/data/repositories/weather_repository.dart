import 'package:weather_clean/data/data_sources/location_data_source.dart';
import 'package:weather_clean/data/data_sources/weather_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_clean/domain/entities/current_weather.dart';

@singleton
class WeatherRepository {
  final WeatherDataSource weatherDataSource;
  final LocationDataSource locationDataSource;

  WeatherRepository(this.weatherDataSource, this.locationDataSource);

  Future<CurrentWeather> getWeatherByName(String cityName) async {
    final dto = await weatherDataSource.getForecastByCityName(cityName);

    return CurrentWeather.fromDto(dto);
  }

  Future<CurrentWeather> getWeatherByLocation() async {
    final location = await locationDataSource.getCurrentLocation();
    final dto = await weatherDataSource.getForecastByLocation(location);
    return CurrentWeather.fromDto(dto);
  }
}
