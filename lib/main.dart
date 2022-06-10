import 'package:flutter/material.dart';
import 'package:project3/screen/home_screen.dart';
import 'package:provider/provider.dart';
import 'viewmodel/weather_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WeatherViewModel()),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          // '/about': (context) => About(),
          // '/settings': (context) => Settings(),
        },
      ),
    );
  }
}
