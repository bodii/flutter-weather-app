import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WeatherCardWidget extends StatelessWidget {
  const WeatherCardWidget({
    super.key,
    required this.provcn,
    required this.city,
    required this.weather,
    required this.pic,
    required this.temperature,
  });

  final String provcn;
  final String city;
  final String weather;
  final String pic;
  final String temperature;

  @override
  Widget build(BuildContext context) {
    // 'assets/weather_icon/d00.png';
    // https: //www.weatherol.cn/images/icon/n00.png;

    return Container(
      height: 140,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: InkWell(
        onTap: () =>
            context.pushNamed('weather', pathParameters: {'city': city}),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  provcn,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Text(
                  city,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Text(
                  weather,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Image(
                    image: AssetImage(pic),
                  ),
                ),
                Text(
                  '$temperature℃',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
