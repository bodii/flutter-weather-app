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
    return Container(
      width: 380,
      height: 200,
      padding: const EdgeInsets.symmetric(vertical: 20),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        // backgroundBlendMode: BlendMode.colorBurn,
        color: Colors.grey[100],
      ),
      child: Column(
        children: [
          SizedBox(
            width: 300,
            height: 100,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                const ArcSunWidget(color: Colors.grey, length: 1.0),
                ArcSunWidget(
                  color: Colors.orange.shade200,
                  length: currentTimeInDayPercentage(),
                ),
                Align(
                  alignment:
                      FractionalOffset(currentTimeInDayPercentage(), 0.58),
                  child: SvgPicture.asset(
                    'assets/weather_icon/icons/sun.svg',
                    width: 32,
                    height: 32,
                    colorFilter:
                        const ColorFilter.mode(Colors.orange, BlendMode.srcIn),
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

  double currentTimeInDayPercentage() {
    final DateTime dateTime = DateTime.now();
    final int hour = dateTime.hour;

    const int sunrise = 5;
    const int sunset = 17;
    if (hour < sunrise || hour > sunset) {
      return 0.0;
    }

    return (hour - sunrise) / (sunset - sunrise);
  }
}
