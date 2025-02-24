import 'package:injectable/injectable.dart';
import 'package:weather_clean/data/repositories/weather_repository.dart';
import 'package:weather_clean/domain/entities/current_weather.dart';

@singleton
class GetWeatherUseCase {
  final WeatherRepository _weatherRepository;

  GetWeatherUseCase(this._weatherRepository);

  Future<CurrentWeather> getWeather(String? cityName) {
    if(cityName == null || cityName.isEmpty) {
      return _weatherRepository.getWeatherByLocation();
    }
    else {
      return _weatherRepository.getWeatherByName(cityName);
    }
  }
}