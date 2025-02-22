import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_clean/presentation/main_screen/bloc/weather_event.dart';
import 'package:weather_clean/presentation/main_screen/bloc/weather_state.dart';

import '../../../data/repositories/weather_repository.dart';
import '../../../domain/entities/weather_forecast.dart';

@injectable
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({
    required this.weatherRepository,
  })
  : super(WeatherEmptyState()) {
    initEventHandler();
  }

  void initEventHandler() {
    on<WeatherLoadEvent>((event, emit) async {
      emit(WeatherLoadingState());
      try {
        final WeatherForecast? loadedWeather = await weatherRepository.getWeather(event.cityName);

        if(loadedWeather != null) {
          emit(WeatherLoadedState(loadedWeather: loadedWeather));
        }
        else {
          emit(WeatherEmptyState());
        }
      } catch (_) {
        emit(WeatherErrorState());
      }
    });
  }
}
