import 'package:flutter/material.dart';
import 'package:weather_app/common/text_extension.dart';

class SouthAmericaMapWidget extends StatelessWidget {
  const SouthAmericaMapWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final ratio = screenWidth / 411;

    return Container(
      width: screenWidth,
      height: screenWidth - (100 * ratio),
      padding: EdgeInsets.all(15.0 * ratio),
      child: Stack(
        children: [
          Image.asset(
            'assets/weather_icon/world/nmz.jpg',
            fit: BoxFit.fill,
            width: screenWidth - (30 * ratio),
          ),
          Stack(
            children: [
              Positioned(
                left: 141 * ratio,
                top: 12 * ratio,
                child: Text(
                  '波哥大',
                  style: TextStyle(fontSize: (14 * ratio)),
                ).inkWellToWeatherInternational(context),
              ),
              Positioned(
                left: 208 * ratio,
                top: 22 * ratio,
                child: Text(
                  '乔治敦',
                  style: TextStyle(fontSize: (14 * ratio)),
                ).inkWellToWeatherInternational(context),
              ),
              Positioned(
                left: 111 * ratio,
                top: 53 * ratio,
                child: Text(
                  '基多',
                  style: TextStyle(fontSize: (14 * ratio)),
                ).inkWellToWeatherInternational(context),
              ),
              Positioned(
                left: 118 * ratio,
                top: 97 * ratio,
                child: Text(
                  '利马',
                  style: TextStyle(fontSize: (14 * ratio)),
                ).inkWellToWeatherInternational(context),
              ),
              Positioned(
                left: 179 * ratio,
                top: 107 * ratio,
                child: Text(
                  '苏克雷',
                  style: TextStyle(fontSize: (14 * ratio)),
                ).inkWellToWeatherInternational(context),
              ),
              Positioned(
                left: 239 * ratio,
                top: 84 * ratio,
                child: Text(
                  '巴西利亚',
                  style: TextStyle(fontSize: (13 * ratio)),
                ).inkWellToWeatherInternational(context),
              ),
              Positioned(
                left: 202 * ratio,
                top: 149 * ratio,
                child: Text(
                  '亚松森',
                  style: TextStyle(fontSize: (14 * ratio)),
                ).inkWellToWeatherInternational(context),
              ),
              Positioned(
                left: 113 * ratio,
                top: 178 * ratio,
                child: Text(
                  '圣地亚哥',
                  style: TextStyle(fontSize: (13 * ratio)),
                ).inkWellToWeatherInternational(context),
              ),
              Positioned(
                left: 198 * ratio,
                top: 205 * ratio,
                child: Text(
                  '布宜诺斯艾利斯',
                  style: TextStyle(fontSize: (8 * ratio)),
                ).inkWellToWeatherInternational(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
