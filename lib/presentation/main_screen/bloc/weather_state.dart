import 'package:weather_clean/domain/entities/current_weather.dart';

abstract class WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  CurrentWeather loadedWeather;
  WeatherLoadedState({
    required this.loadedWeather,
  });
}

class WeatherEmptyState extends WeatherState {}
class WeatherErrorState extends WeatherState {}
