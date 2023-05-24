import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                    color: Colors.orange,
                    width: 32,
                    height: 32,
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
                    SvgPicture.asset('assets/weather_icon/icons/sunrise.svg'),
                    const Text('00'),
                  ],
                ),
                Row(
                  children: [
                    const Text('23'),
                    SvgPicture.asset('assets/weather_icon/icons/sunset.svg'),
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
