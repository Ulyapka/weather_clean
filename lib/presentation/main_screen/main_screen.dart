import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dependency_injection/injection.dart';
import 'bloc/weather_bloc.dart';
import 'bloc/weather_event.dart';
import 'bloc/weather_state.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherBloc weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return BlocProvider<WeatherBloc>(
      create: (context) => getIt.get<WeatherBloc>(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              _InputField(bloc: weatherBloc),
              _Content(),
            ],
          ),
        ),
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  final WeatherBloc bloc;

  const _InputField({required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        cursorColor: Colors.blueGrey[800],
        style: const TextStyle(
          color: Colors.white,
          fontSize: 17.0,
          fontWeight: FontWeight.w300,
        ),
        decoration: const InputDecoration(
          hintText: 'Введите название города',
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 17.0,
            fontWeight: FontWeight.w300,
          ),
          filled: true,
          fillColor: Colors.black54,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(7.0),
            ),
            borderSide: BorderSide.none,
          ),
          icon: Icon(
            Icons.search_outlined,
            color: Colors.black54,
            size: 50.0,
          ),
        ),
        onChanged: (value) {
          bloc.add(WeatherLoadEvent(cityName: value));
        },
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadedState) {
          return Center(
            child: Column(
              children: [
                Text(
                  '${state.loadedWeather.city?.name}',
                  style: const TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  '${state.loadedWeather.list?[0].temp?.day?.ceil()}ºC'
                      .toUpperCase(),
                  style: const TextStyle(
                    fontSize: 50.0,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  '${state.loadedWeather.list?[0].weather![0].description}'
                      .toUpperCase(),
                  style: const TextStyle(
                      fontSize: 40.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }
        else if (state is WeatherLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        else if (state is WeatherErrorState) {
          return const Center(
            child: Text(
                'Ошибочка вышла =(\nНаверное вы не ввели название города\nили оно введено неверно...'),
          );
        }
        else if (state is WeatherEmptyState) {
          return const Center(
            child: Text('Пусто...'),
          );
        }
        return Container();
      },
    );
  }
}

