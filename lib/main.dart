import 'package:flutter/material.dart';
import 'package:weather_clean/dependency_injection/injection.dart';
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
      home: MainScreen(),
    );
  }
}
