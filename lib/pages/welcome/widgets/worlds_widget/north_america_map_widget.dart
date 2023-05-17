import 'package:flutter/material.dart';
import 'package:weather_app/common/text_extension.dart';

class NorthAmericaMapWidget extends StatelessWidget {
  const NorthAmericaMapWidget({Key? key}) : super(key: key);

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
            'assets/weather_icon/world/bmz.jpg',
            fit: BoxFit.fill,
            width: screenWidth - (30 * ratio),
          ),
          Stack(
            children: [
              Positioned(
                left: 75 * ratio,
                top: 92 * ratio,
                child: Text(
                  '温哥华',
                  style: TextStyle(fontSize: (14 * ratio)),
                ).inkWellToWeatherInternational(context),
              ),
              Positioned(
                left: 133 * ratio,
                top: 78 * ratio,
                child: Text(
                  '埃德蒙顿',
                  style: TextStyle(fontSize: (13 * ratio)),
                ).inkWellToWeatherInternational(context),
              ),
              Positioned(
                left: 205 * ratio,
                top: 103 * ratio,
                child: Text(
                  '渥太华',
                  style: TextStyle(fontSize: (14 * ratio)),
                ).inkWellToWeatherInternational(context),
              ),
              Positioned(
                left: 264 * ratio,
                top: 79 * ratio,
                child: Text(
                  '蒙特利尔',
                  style: TextStyle(fontSize: (13 * ratio)),
                ).inkWellToWeatherInternational(context),
              ),
              Positioned(
                left: 279 * ratio,
                top: 123 * ratio,
                child: Text(
                  '纽约',
                  style: TextStyle(fontSize: (14 * ratio)),
                ).inkWellToWeatherInternational(context),
              ),
              Positioned(
                left: 62 * ratio,
                top: 138 * ratio,
                child: Text(
                  '旧金山',
                  style: TextStyle(fontSize: (14 * ratio)),
                ).inkWellToWeatherInternational(context),
              ),
              Positioned(
                left: 172 * ratio,
                top: 205 * ratio,
                child: Text(
                  '休斯敦',
                  style: TextStyle(fontSize: (14 * ratio)),
                ).inkWellToWeatherInternational(context),
              ),
              Positioned(
                left: 96 * ratio,
                top: 182 * ratio,
                child: Text(
                  '洛杉矶',
                  style: TextStyle(fontSize: (14 * ratio)),
                ).inkWellToWeatherInternational(context),
              ),
              Positioned(
                left: 177 * ratio,
                top: 155 * ratio,
                child: Text(
                  '芝加哥',
                  style: TextStyle(fontSize: (14 * ratio)),
                ).inkWellToWeatherInternational(context),
              ),
              Positioned(
                left: 255 * ratio,
                top: 165 * ratio,
                child: Text(
                  '华盛顿',
                  style: TextStyle(fontSize: (14 * ratio)),
                ).inkWellToWeatherInternational(context),
              ),
              Positioned(
                left: 260 * ratio,
                top: 213 * ratio,
                child: Text(
                  '迈阿密',
                  style: TextStyle(fontSize: (14 * ratio)),
                ).inkWellToWeatherInternational(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
