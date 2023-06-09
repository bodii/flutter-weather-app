import 'package:flutter/material.dart';
import 'package:weather_app/common/asset.dart';
import 'package:weather_app/model/weather.dart';

class WeatherCn24HBriefWidget extends StatefulWidget {
  const WeatherCn24HBriefWidget({
    super.key,
    required this.forecast24h,
  });

  final List<Forecast24h> forecast24h;

  @override
  State<WeatherCn24HBriefWidget> createState() =>
      _WeatherCn24HBriefWidgetState();
}

class _WeatherCn24HBriefWidgetState extends State<WeatherCn24HBriefWidget> {
  late final ScrollController listController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    listController = ScrollController();
    listController.addListener(() {});
  }

  @override
  void dispose() {
    listController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Forecast24h> forecast24h = widget.forecast24h;

    return Container(
      width: 380,
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.outline.withOpacity(.1),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 65,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
          child: ListView.builder(
            reverse: false,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            controller: listController,
            itemExtent: 70.0,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Image.asset(
                      getLocalWeatherIconPath(forecast24h[index].weatherPic!),
                      width: 20,
                      height: 20,
                    ),
                  ),
                  Text(
                    forecast24h[index].forecasttime!,
                    style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.bodyMedium!.fontSize,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              );
            },
            itemCount: forecast24h.length,
          ),
        ),
      ),
    );
  }
}
