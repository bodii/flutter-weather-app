import 'package:flutter/material.dart';
import 'package:weather_app/model/wni_hot_country_data.dart';

class Weather15DBriefWidget extends StatefulWidget {
  const Weather15DBriefWidget({
    super.key,
    required this.forecast15d,
  });

  final Forecast15D forecast15d;

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
    final List<Forecast> forecasts = widget.forecast15d.forecast!;
    return Container(
      width: 380,
      height: srcWidgetHight,
      padding: const EdgeInsets.only(top: 20),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.outline.withOpacity(.1),
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: srcListHight,
            child: ListView.builder(
              itemCount: forecasts.length,
              itemExtent: 35.0,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(forecasts[index].validDateCn!),
                    Text(forecasts[index].dayIconText!),
                    Text(forecasts[index].nightIconText!),
                    Text(forecasts[index].minTemp!),
                    Text(forecasts[index].maxTemp!),
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
                child: Icon(
                  Icons.chevron_left,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
