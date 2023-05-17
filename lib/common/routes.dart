import 'package:go_router/go_router.dart';
import 'package:weather_app/pages/error/error_page.dart';
import 'package:weather_app/pages/location/view/index.dart';
import 'package:weather_app/pages/home/view/home.dart';
import 'package:weather_app/pages/home/widgets/search.dart';
import 'package:weather_app/pages/weather/views/weather_page.dart';
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
        builder: (context, state) => const Location(),
        routes: [
          GoRoute(
            name: '/location/search',
            path: 'search',
            builder: (context, state) => const Search(),
          ),
        ],
      ),
      GoRoute(
        name: '/home',
        path: '/home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        name: '/weather/china',
        path: '/weather/china/:city',
        builder: (context, state) =>
            WeatherPage(city: state.pathParameters['city'] ?? '北京'),
      ),
      GoRoute(
        name: '/weather/international',
        path: '/weather/international/:city',
        builder: (context, state) => WeatherPage(
          city: state.pathParameters['city'] ?? '纽约',
          isChina: false,
        ),
      )
    ],
    errorBuilder: (context, state) => ErrorPage(state.error!),
    debugLogDiagnostics: true,
  );
}
