import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/pages/welcome/views/welcome_page.dart';

class AppRoutes {
  static const init = '/welcome';

  static final List<RouteBase> routes = [
    GoRoute(
      path: '/welcome',
      builder: (BuildContext context, GoRouterState state) {
        return const WelcomePage();
      },
    ),
  ];

  // ignore: prefer_function_declarations_over_variables
  static final Text Function(BuildContext context, GoRouterState state) unknow =
      (context, state) => const Text('Not Found');
}
