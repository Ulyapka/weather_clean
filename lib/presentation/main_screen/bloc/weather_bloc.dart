import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_clean/domain/entities/current_weather.dart';
import 'package:weather_clean/domain/use_cases/get_weather_use_case.dart';
import 'package:weather_clean/presentation/main_screen/bloc/weather_event.dart';
import 'package:weather_clean/presentation/main_screen/bloc/weather_state.dart';

import '../../../data/repositories/weather_repository.dart';

@injectable
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherUseCase getWeatherUseCase;

  WeatherBloc({
    required this.getWeatherUseCase,
  })
  : super(WeatherEmptyState()) {
    initEventHandler();
    add(WeatherLoadEvent(cityName: null));
  }

  void initEventHandler() {
    on<WeatherLoadEvent>((event, emit) async {
      emit(WeatherLoadingState());
      try {
        final CurrentWeather? currentWeather = await getWeatherUseCase.getWeather(event.cityName);

        if(currentWeather != null) {
          emit(WeatherLoadedState(loadedWeather: currentWeather));
        }
        else {
          emit(WeatherEmptyState());
        }
      } catch (_) {
        emit(WeatherErrorState());
      }
    });
  }

  void setCityName(String name) {
    add(WeatherLoadEvent(cityName: name));
  }
}
