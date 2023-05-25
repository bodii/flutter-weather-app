import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/pages/weather_details/paints/arc.dart';

class SunAndMoonWidget extends StatelessWidget {
  const SunAndMoonWidget({
    super.key,
  });

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
                const ArcSunWidget(color: Colors.orange, length: 0.6),
                Align(
                  alignment: const FractionalOffset(0.62, 0.28),
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
                  children: [
                    SvgPicture.asset(
                      'assets/weather_icon/icons/sunrise.svg',
                      colorFilter: ColorFilter.mode(
                          Colors.orange.shade200, BlendMode.srcIn),
                    ),
                    Text(
                      '00',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '23',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
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
}

class ArcSunWidget extends StatelessWidget {
  const ArcSunWidget({
    super.key,
    required this.color,
    required this.length,
  });

  final Color color;
  final double length;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 150,
      top: 130,
      child: CustomPaint(
        painter: ArcPainter(color: color, length: length),
      ),
    );
  }
}
