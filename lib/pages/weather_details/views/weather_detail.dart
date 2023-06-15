import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/model/wni_hot_country_data.dart';
import 'package:weather_app/model/wni_hot_country_index.dart';
import 'package:weather_app/pages/weather_details/bloc/weather_response_bloc.dart';
import 'package:weather_app/pages/weather_details/widgets/index.dart';

class WeatherDetailsInterPage extends StatelessWidget {
  const WeatherDetailsInterPage({
    super.key,
    required this.cityId,
    required this.city,
  });

  final String cityId;
  final String city;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WeatherResponseBloc(
        city: city,
        cityId: cityId,
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

    final WniHotCountryData weather = weatherState.weather!;
    final List<WniHotCountryIndex> wniIndexs = weatherState.wniIndexs!;

    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;

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
              Image.asset(
                'assets/weather_icon/d00.png',
                width: screenWidth * 0.5,
                height: screenWidth * 0.5,
              ),
              SizedBox(
                width: screenWidth * 0.54,
                height: screenWidth * 0.27,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${weather.current?.temp}',
                      style: TextStyle(
                        fontSize: 125,
                        height: 0.85,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '℃',
                          style: TextStyle(
                            fontSize: 40,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        Text(
                          "体感温度\n${weather.current?.feelsLike}℃",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Text(
                "${weather.current?.iconDecoder} "
                "${weather.current?.tempMin24} - "
                "${weather.current?.tempMax24}℃",
                style: TextStyle(fontSize: screenWidth * 0.05),
              ),
              Weather24HBriefWidget(forecast24h: weather.forecast72H!),
              Weather15DBriefWidget(forecast15d: weather.forecast15D!),
              WeatherItemsWidget(weather: weather.current!),
              // AirQualityWidget(air: air),
              // SunAndMoonWidget(smi: smi),
              LivingIndexWidget(wniIndexs: wniIndexs),
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
