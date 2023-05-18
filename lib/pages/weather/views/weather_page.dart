import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/model/air_current.dart';
import 'package:weather_app/model/sun_and_moon.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/pages/weather/bloc/weather_response_bloc.dart';
import 'package:weather_app/pages/weather/widgets/chart.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({
    super.key,
    required this.city,
    this.isChina = true,
  });

  final String city;
  final bool isChina;
  final String provcn = '河南';

  @override
  Widget build(BuildContext context) {
    const city = '郑州';
    return BlocProvider(
      create: (_) => WeatherResponseBloc(
        city: city,
        provcn: provcn,
      )..add(const WeatherResponseLoadedEvent()),
      child: const WeatherBlocWidget(city: city),
    );
  }
}

class WeatherBlocWidget extends StatelessWidget {
  const WeatherBlocWidget({
    super.key,
    required this.city,
  });

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
      child: WeatherDetailsWidget(city: city),
    );
  }
}

class WeatherDetailsWidget extends StatelessWidget {
  const WeatherDetailsWidget({
    super.key,
    required this.city,
  });

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
                            color: Colors.purple,
                            width: 45,
                            height: 45,
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
                            color: Colors.purple,
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
              Container(
                width: 380,
                height: 260,
                padding: const EdgeInsets.symmetric(vertical: 20),
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  // backgroundBlendMode: BlendMode.colorBurn,
                  color: Colors.grey[100],
                ),
                child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 1.1,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  children: [
                    WeatherIconItem(
                      icon: 'thermometer_icon.svg',
                      title: '温度',
                      value: '${weather.current?.current?.temperature}℃',
                    ),
                    WeatherIconItem(
                      icon: 'wind_icon.svg',
                      title: '风量',
                      value:
                          '${weather.current?.current?.winddir}${weather.current?.current?.windpower}',
                    ),
                    WeatherIconItem(
                      icon: 'precipitation_icon.svg',
                      title: '湿度',
                      value: '${weather.current?.current?.humidity}%',
                    ),
                    WeatherIconItem(
                      icon: 'uv_icon.svg',
                      title: '紫外线',
                      value: '${smi.index![6].indexLevel}',
                    ),
                    WeatherIconItem(
                      icon: 'eye_icon.svg',
                      title: '可视度',
                      value: '${weather.current?.current?.visibility}Km',
                    ),
                    WeatherIconItem(
                      icon: 'pressure_icon.svg',
                      title: '气压',
                      value: '${weather.current?.current?.airpressure}hPa',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 200,
                child: Chart(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherIconItem extends StatelessWidget {
  const WeatherIconItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  final String icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/weather_icon/icons/$icon',
              width: 45,
              height: 45,
              color: Colors.blue,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.green,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
