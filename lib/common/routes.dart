import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/pages/error/error_page.dart';
import 'package:weather_app/pages/get_location/view/index.dart';
import 'package:weather_app/pages/home/view/home.dart';
import 'package:weather_app/pages/weather/views/weather_page.dart';
import 'package:weather_app/pages/welcome/views/welcome_page.dart';

class AppRoutes {
  static final GoRouter routes = GoRouter(
    initialLocation: '/welcome',
    routes: <GoRoute>[
      GoRoute(
        path: '/welcome',
        builder: (BuildContext context, GoRouterState state) =>
            const WelcomePage(),
      ),
      GoRoute(
        path: '/get_location',
        builder: (context, state) => const GetLocation(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        name: 'weather',
        path: '/weather/:city',
        builder: (context, state) =>
            WeatherPage(city: state.pathParameters['city'] ?? '北京'),
      ),
    ],
    errorBuilder: (context, state) => ErrorPage(state.error!),
    debugLogDiagnostics: true,
  );
}
