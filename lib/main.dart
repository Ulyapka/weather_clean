import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_clean/dependency_injection/injection.dart';
import 'package:weather_clean/presentation/main_screen/bloc/weather_bloc.dart';
import 'package:weather_clean/presentation/main_screen/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => getIt.get<WeatherBloc>(),
        child: MainScreen(),
      )
    );
  }
}
