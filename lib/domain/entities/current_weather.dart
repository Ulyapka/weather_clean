import 'package:weather_clean/domain/entities/dto/weather_forecast_dto.dart';

class CurrentWeather {
  final String cityName;
  final double temp;
  final String description;

  CurrentWeather({
    required this.cityName,
    required this.temp,
    required this.description,
  });

  static CurrentWeather fromDto(WeatherForecastDto dto) {
    final cityName = dto.city?.name ?? "";
    final temp = dto.list?[0].temp?.day ?? 0.0;
    final description = dto.list?[0].weather?[0].description ?? "";

    return CurrentWeather(
      cityName: cityName,
      temp: temp,
      description: description,
    );
  }
}