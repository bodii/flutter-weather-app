import 'package:flutter/material.dart';
import 'package:weather_app/model/air_current.dart';

class AirQualityWidget extends StatelessWidget {
  const AirQualityWidget({
    super.key,
    required this.air,
  });

  final AirCurrent air;

  @override
  Widget build(BuildContext context) {
    final int no2Int = int.parse(air.no2!);

    return Container(
      width: 380,
      height: 230,
      padding: const EdgeInsets.symmetric(vertical: 20),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        // backgroundBlendMode: BlendMode.colorBurn,
        color: Theme.of(context).colorScheme.outline.withOpacity(.1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 320,
            height: 80,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      air.aqi!,
                      style: const TextStyle(fontSize: 32),
                    ),
                    Text(air.levelIndex!),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 6,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context).colorScheme.inversePrimary,
                            Theme.of(context).colorScheme.error,
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0.0,
                      child: Container(
                        width: 320 - 320 * (no2Int / 300),
                        height: 6,
                        color: Theme.of(context).colorScheme.outlineVariant,
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('良好'),
                    Text('严重'),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AirItem(title: 'PM2.5', value: air.pm25!, maxValue: 300),
              AirItem(title: 'PM10', value: air.pm10!, maxValue: 300),
              AirItem(title: 'CO', value: air.co!, maxValue: 30),
              AirItem(title: 'SO2', value: air.so2!, maxValue: 150),
            ],
          ),
        ],
      ),
    );
  }
}

class AirItem extends StatelessWidget {
  const AirItem({
    super.key,
    required this.title,
    required this.value,
    required this.maxValue,
  });

  final String title;
  final String value;
  final double maxValue;

  @override
  Widget build(BuildContext context) {
    const double maxWidth = 50;
    final double valWidth = maxWidth * (double.parse(value) / maxValue);
    final double emptyWidth = maxWidth - valWidth;
    return SizedBox(
      height: 60,
      width: maxWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 12)),
          Text(value, style: const TextStyle(fontSize: 20)),
          Stack(
            children: [
              Container(
                width: maxWidth,
                height: 6,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.inversePrimary,
                      Theme.of(context).colorScheme.error,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),
              Positioned(
                right: 0.0,
                child: Container(
                  width: emptyWidth,
                  height: 6,
                  color: Theme.of(context).colorScheme.outlineVariant,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
