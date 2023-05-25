import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/model/sun_and_moon.dart';
import 'package:weather_app/model/weather.dart';

class WeatherItemsWidget extends StatelessWidget {
  const WeatherItemsWidget({
    super.key,
    required this.weather,
    required this.smi,
  });

  final Weather weather;
  final SunAndMoonAndIndex smi;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          WeatherItem(
            icon: 'thermometer_icon.svg',
            title: '温度',
            value: '${weather.current?.current?.temperature}℃',
          ),
          WeatherItem(
            icon: 'wind_icon.svg',
            title: '风量',
            value:
                '${weather.current?.current?.winddir}${weather.current?.current?.windpower}',
          ),
          WeatherItem(
            icon: 'precipitation_icon.svg',
            title: '湿度',
            value: '${weather.current?.current?.humidity}%',
          ),
          WeatherItem(
            icon: 'uv_icon.svg',
            title: '紫外线',
            value: '${smi.index![6].indexLevel}',
          ),
          WeatherItem(
            icon: 'eye_icon.svg',
            title: '可视度',
            value: '${weather.current?.current?.visibility}Km',
          ),
          WeatherItem(
            icon: 'pressure_icon.svg',
            title: '气压',
            value: '${weather.current?.current?.airpressure}hPa',
          ),
        ],
      ),
    );
  }
}

class WeatherItem extends StatelessWidget {
  const WeatherItem({
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
              colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
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
