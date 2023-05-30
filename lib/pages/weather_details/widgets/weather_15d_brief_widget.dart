import 'package:flutter/material.dart';
import 'package:weather_app/model/weather.dart';

class Weather15DBriefWidget extends StatefulWidget {
  const Weather15DBriefWidget({
    super.key,
    required this.forecast15d,
  });

  final List<Forecast15d> forecast15d;

  @override
  State<Weather15DBriefWidget> createState() => _Weather15DBriefWidgetState();
}

class _Weather15DBriefWidgetState extends State<Weather15DBriefWidget> {
  late final ScrollController listController;
  int currentIndex = 0;
  double srcWidgetHight = 235;
  double srcListHight = 165;
  bool hasCheckAdd = false;

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
    final List<Forecast15d> forecast15d = widget.forecast15d;
    return Container(
      width: 380,
      height: srcWidgetHight,
      padding: const EdgeInsets.only(top: 20),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[100],
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: srcListHight,
            child: ListView.builder(
              itemCount: forecast15d.length,
              itemExtent: 35.0,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(forecast15d[index].forecasttime!),
                    Text(forecast15d[index].weatherAm!),
                    Text(forecast15d[index].weatherPm!),
                    Text(forecast15d[index].temperaturePm!),
                    Text(forecast15d[index].temperatureAm!),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1),
            child: IconButton(
              // padding: EdgeInsets.zero,
              onPressed: () {
                setState(() {
                  if (!hasCheckAdd) {
                    srcListHight += 250;
                    srcWidgetHight += 250;
                    hasCheckAdd = !hasCheckAdd;
                  } else {
                    srcListHight -= 250;
                    srcWidgetHight -= 250;
                    hasCheckAdd = !hasCheckAdd;
                  }
                });
              },
              icon: RotatedBox(
                quarterTurns: hasCheckAdd ? 1 : 3,
                child: const Icon(
                  Icons.chevron_left,
                  color: Colors.black26,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
