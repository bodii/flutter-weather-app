import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WeatherCardWidget extends StatelessWidget {
  const WeatherCardWidget({
    super.key,
    required this.provcn,
    required this.city,
    required this.cityId,
    required this.weather,
    required this.pic,
    required this.temperature,
  });

  final String provcn;
  final String city;
  final String cityId;
  final String weather;
  final String pic;
  final String temperature;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () =>
            context.pushNamed('/weather/detail/china', pathParameters: {
          'city': city,
          'cityId': cityId,
        }),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    provcn,
                    style: TextStyle(
                      fontSize: Theme.of(context)
                          .primaryTextTheme
                          .bodyMedium!
                          .fontSize,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  Text(
                    city,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Text(
                    weather,
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(
                      image: AssetImage(pic),
                    ),
                    Text(
                      '$temperature℃',
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
