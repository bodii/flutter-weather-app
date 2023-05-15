import 'package:flutter/material.dart';
import 'package:weather_app/common/routes.dart';
import 'package:weather_app/common/color_schemes.g.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      themeMode: ThemeMode.system,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      // home: const WelcomePage(),
      routerConfig: AppRoutes.routes,
    );
  }
}
