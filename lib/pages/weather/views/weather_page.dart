import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('北京'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                print('check more_vert');
              },
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
        body: Column(
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
                        const Text('27'),
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
                          width: 38,
                          height: 38,
                        ),
                        const Text('弱'),
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
                  const Text(
                    '10',
                    style: TextStyle(
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
                        "体感温度\n7℃",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Text(
              "阴   6 - 10℃",
              style: TextStyle(fontSize: 20),
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
                children: const [
                  WeatherIconItem(
                    icon: 'thermometer_icon.svg',
                    title: '温度',
                    value: '7℃',
                  ),
                  WeatherIconItem(
                    icon: 'wind_icon.svg',
                    title: '风量',
                    value: '2',
                  ),
                  WeatherIconItem(
                    icon: 'precipitation_icon.svg',
                    title: '湿度',
                    value: '80%',
                  ),
                  WeatherIconItem(
                    icon: 'uv_icon.svg',
                    title: '紫外线',
                    value: '弱',
                  ),
                  WeatherIconItem(
                    icon: 'eye_icon.svg',
                    title: '可视度',
                    value: '8Km',
                  ),
                  WeatherIconItem(
                    icon: 'pressure_icon.svg',
                    title: '气压',
                    value: '1013 hPa',
                  ),
                ],
              ),
            ),
          ],
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
        padding: EdgeInsets.all(10),
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
