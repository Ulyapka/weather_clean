import '../../../domain/entities/weather_forecast.dart';

abstract class WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  WeatherForecast loadedWeather;
  WeatherLoadedState({
    required this.loadedWeather,
  });
}

class WeatherEmptyState extends WeatherState {}
class WeatherErrorState extends WeatherState {}
