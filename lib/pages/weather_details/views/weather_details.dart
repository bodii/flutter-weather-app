import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/model/air_current.dart';
import 'package:weather_app/model/sun_and_moon.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/pages/weather_details/bloc/weather_response_bloc.dart';
import 'package:weather_app/pages/weather_details/widgets/index.dart';

class WeatherDetailsCNPage extends StatelessWidget {
  const WeatherDetailsCNPage({
    super.key,
    required this.cityId,
    required this.city,
    this.isChina = true,
  });

  final String cityId;
  final String city;
  final bool isChina;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WeatherResponseBloc(
        city: city,
        cityId: cityId,
        isChina: isChina,
      )..add(const WeatherResponseLoadedEvent()),
      child: WeatherBlocWidget(cityId: cityId, city: city),
    );
  }
}

class WeatherBlocWidget extends StatelessWidget {
  const WeatherBlocWidget({
    super.key,
    required this.cityId,
    required this.city,
  });

  final String cityId;
  final String city;

  @override
  Widget build(BuildContext context) {
    return BlocListener<WeatherResponseBloc, WeatherResponseState>(
      listener: (context, state) {
        debugPrint("loadinged");
      },
      listenWhen: (previous, current) =>
          previous.status != current.status &&
          current.status == WeatherResponseStatus.httpSuccess,
      child: WeatherDetailsWidget(cityId: cityId, city: city),
    );
  }
}

class WeatherDetailsWidget extends StatelessWidget {
  const WeatherDetailsWidget({
    super.key,
    required this.cityId,
    required this.city,
  });

  final String cityId;
  final String city;

  @override
  Widget build(BuildContext context) {
    final weatherState = context.watch<WeatherResponseBloc>().state;
    debugPrint('weatherstate city: ${weatherState.city!}');
    debugPrint(weatherState.status.toString());
    if (weatherState.status != WeatherResponseStatus.httpSuccess) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(city),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  debugPrint('check more_vert');
                },
                icon: const Icon(Icons.more_vert),
              ),
            ],
          ),
          body: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    final AirCurrent air = weatherState.air!;
    final Weather weather = weatherState.weather!;
    final SunAndMoonAndIndex smi = weatherState.sunAndMoonAndIndex!;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(city),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                debugPrint('check more_vert');
              },
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 95,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 40,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(40),
                        ),
                        color: Colors.grey[200],
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/weather_icon/icons/pm25_icon.svg',
                            width: 45,
                            height: 45,
                            colorFilter: const ColorFilter.mode(
                                Colors.purple, BlendMode.srcIn),
                          ),
                          Text(air.pm25!),
                        ],
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 40,
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(40),
                        ),
                        color: Colors.grey[200],
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/weather_icon/icons/uv_icon02.svg',
                            colorFilter: const ColorFilter.mode(
                                Colors.purple, BlendMode.srcIn),
                            width: 60,
                            height: 38,
                          ),
                          Text(smi.index![6].indexLevel!),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                'assets/weather_icon/d00.png',
                width: 200,
                height: 200,
              ),
              SizedBox(
                width: 195,
                height: 100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${weather.current?.current?.temperature}',
                      style: const TextStyle(
                        fontSize: 120,
                        height: 0.85,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '℃',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.blueGrey,
                          ),
                        ),
                        Text(
                          "体感温度\n${weather.current?.current?.feelstemperature}℃",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Text(
                "${weather.current?.current?.weather} ${weather.current?.current?.feelstemperature} - ${weather.current?.current?.temperature}℃",
                style: const TextStyle(fontSize: 20),
              ),
              WeatherItemsWidget(weather: weather, smi: smi),
              const AirQualityWidget(),
              const SunAndMoonWidget(),
              const SizedBox(
                height: 100,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
