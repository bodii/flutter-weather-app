import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/model/wni_hot_country_data.dart';

class WeatherItemsWidget extends StatelessWidget {
  const WeatherItemsWidget({
    super.key,
    required this.weather,
  });

  final Current weather;

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
        color: Theme.of(context).colorScheme.outline.withOpacity(.1),
      ),
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1.1,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 0),
        children: [
          WeatherItem(
            icon: 'dew_point.svg',
            title: '露点',
            value: '${weather.dewPoint}℃',
          ),
          WeatherItem(
            icon: 'wind_icon.svg',
            title: '风量',
            value: '${weather.wSpeed}',
          ),
          WeatherItem(
            icon: 'precipitation_icon.svg',
            title: '湿度',
            value: '${weather.humid}%',
          ),
          WeatherItem(
            icon: 'uv_icon.svg',
            title: '紫外线',
            value: '${weather.uvindex}',
          ),
          WeatherItem(
            icon: 'eye_icon.svg',
            title: '可视度',
            value: '${weather.visibility}m',
          ),
          WeatherItem(
            icon: 'pressure_icon.svg',
            title: '气压',
            value: '${weather.pressure}hPa',
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
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.inversePrimary,
                BlendMode.srcIn,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.7),
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
                color: Theme.of(context).colorScheme.tertiary,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
