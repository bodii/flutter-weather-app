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
      height: 180,
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
            height: 32,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  width: 300,
                  height: 6,
                  color: Colors.grey[300],
                ),
                Container(
                  width: 200,
                  height: 6,
                  color: Colors.orange[300],
                ),
                Align(
                  alignment: const FractionalOffset(0.401, 0.0),
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
          Container(
            width: 320,
            height: 60,
            margin: const EdgeInsets.only(top: 20),
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
          const ArcSunWidget(),
        ],
      ),
    );
  }
}

class ArcSunWidget extends StatefulWidget {
  const ArcSunWidget({Key? key}) : super(key: key);

  @override
  _ArcSunWidgetState createState() => _ArcSunWidgetState();
}

class _ArcSunWidgetState extends State<ArcSunWidget> {
  @override
  Widget build(BuildContext context) {
    return ArcPainter();
  }
}
