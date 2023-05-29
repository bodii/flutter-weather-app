import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/model/sun_and_moon.dart';
import 'package:weather_app/pages/weather_details/paints_widgets/arc_sun_widget.dart';

class SunAndMoonWidget extends StatelessWidget {
  const SunAndMoonWidget({
    super.key,
    required this.smi,
  });

  final SunAndMoonAndIndex smi;

  @override
  Widget build(BuildContext context) {
    double percent = getCurrentTimeInDayPercentage(smi.sunAndMoon!.sun!);
    // final double y = percent > 0.5 ? percent - 0.5 : 1 - percent;
    // final double y2 = y;
    percent = .5;

    final num angle = 180 * percent;
    final num radians = degToRad(angle);

    // debugPrint("angle: $angle  percent: $percent  radians: $radians");

    debugPrint('sin: ${sin(radians)} cos: ${cos(radians)}');

    double cosRadians = cos(radians);
    double x1 = 0.1 * cosRadians * 0.5;

    // final double x = sin(radians);
    final double x = percent + cosRadians * .05;
    final double y = cosRadians.abs();

    debugPrint("x1: $x1 percent: $percent cosRadians: $cosRadians");
    // debugPrint("x: $x y: $y");

    return Container(
      width: 380,
      height: 210,
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[100],
      ),
      child: Column(
        children: [
          SizedBox(
            width: 300,
            height: 120,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                const ArcSunWidget(color: Colors.grey, length: 1.0),
                ArcSunWidget(
                  color: Colors.orange.shade200,
                  length: percent,
                ),
                Align(
                  alignment: FractionalOffset(x, y),
                  child: SvgPicture.asset(
                    'assets/weather_icon/icons/sun.svg',
                    width: 32,
                    height: 32,
                    colorFilter: const ColorFilter.mode(
                      Colors.orange,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 320,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      'assets/weather_icon/icons/sunrise.svg',
                      colorFilter: ColorFilter.mode(
                          Colors.orange.shade200, BlendMode.srcIn),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      smi.sunAndMoon!.sun!.sunrise!,
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      smi.sunAndMoon!.sun!.sunset!,
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 8),
                    SvgPicture.asset(
                      'assets/weather_icon/icons/sunset.svg',
                      colorFilter: ColorFilter.mode(
                          Colors.orange.shade200, BlendMode.srcIn),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  num radToDeg(num rad) => rad * (180.0 / pi);
  num degToRad(num deg) => deg * (pi / 180.0);

  double getCurrentTimeInDayPercentage(Sun sun) {
    final DateTime dateTime = DateTime.now();
    final int hour = dateTime.hour;
    String currnet = '${dateTime.hour}${dateTime.minute}';
    int currentInt = int.parse(currnet);

    String sunrise = sun.sunrise!;
    String sunset = sun.sunset!;

    final sunriseSplit = sunrise.split(':');
    sunrise = '${sunriseSplit[0]}${sunriseSplit[1]}';
    int sunriseInt = int.parse(sunrise);

    final sunsetSplit = sunset.split(':');
    sunset = '${sunsetSplit[0]}${sunsetSplit[1]}';
    int sunsetInt = int.parse(sunset);

    if (currentInt < sunriseInt || hour > sunsetInt) {
      return 0.0;
    }

    return (currentInt - sunriseInt) / (sunsetInt - sunriseInt);
  }
}
