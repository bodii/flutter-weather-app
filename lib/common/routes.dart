import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/pages/error/error_page.dart';
import 'package:weather_app/pages/location/cubit/location_cubit.dart';
import 'package:weather_app/pages/location/view/index.dart';
import 'package:weather_app/pages/weather_details/views/weather_details.dart';
import 'package:weather_app/pages/weather_list/view/weather_list.dart';
import 'package:weather_app/pages/weather_list/widgets/search.dart';
import 'package:weather_app/pages/welcome/views/welcome_page.dart';

class AppRoutes {
  static final GoRouter routes = GoRouter(
    initialLocation: '/welcome',
    routes: <GoRoute>[
      GoRoute(
        name: '/welcome',
        path: '/welcome',
        builder: (context, state) => const WelcomePage(),
      ),
      GoRoute(
        name: '/location',
        path: '/location',
        builder: (context, state) {
          return const Location();
        },
        routes: [
          GoRoute(
            name: '/location/search',
            path: 'search',
            builder: (context, state) => const Search(),
          ),
        ],
      ),
      GoRoute(
        name: '/weather/list',
        path: '/weather/list',
        builder: (context, state) => const WeatherListPage(),
      ),
      GoRoute(
        name: '/weather/detail/china',
        path: '/weather/detail/china/:city/:cityId',
        builder: (context, state) => WeatherDetailsCNPage(
            city: state.pathParameters['city'] ?? '北京',
            cityId: state.pathParameters['cityId'] ?? '101010100'),
      ),
      // GoRoute(
      //   name: '/weather/detail/international',
      //   path: '/weather/detail/international/:city/:cityid',
      //   builder: (context, state) => WeatherDetailsInterPage(
      //     city: state.pathParameters['city'] ?? '',
      //     cityId: state.pathParameters['cityId'] ?? '',
      //     isChina: false,
      //   ),
      // )
    ],
    errorBuilder: (context, state) => ErrorPage(state.error!),
    debugLogDiagnostics: true,
  );
}
