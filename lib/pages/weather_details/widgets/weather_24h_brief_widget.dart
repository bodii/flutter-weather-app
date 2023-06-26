import 'package:flutter/material.dart';
import 'package:weather_app/common/asset.dart';
import 'package:weather_app/model/wni_hot_country_data.dart';

class Weather24HBriefWidget extends StatefulWidget {
  const Weather24HBriefWidget({
    super.key,
    required this.forecast24h,
  });

  final Forecast72H forecast24h;

  @override
  State<Weather24HBriefWidget> createState() => _Weather24HBriefWidgetState();
}

class _Weather24HBriefWidgetState extends State<Weather24HBriefWidget> {
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
    final List<Value> values = widget.forecast24h.value!;

    return Container(
      width: 380,
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.only(top: 10),
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
                      getLocalWeatherIconPath(values[index].iconPic!),
                      width: 20,
                      height: 20,
                    ),
                  ),
                  Text(
                    '${values[index].dateTime!}:00',
                    style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.bodyMedium!.fontSize,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              );
            },
            itemCount: values.length,
          ),
        ),
      ),
    );
  }
}
