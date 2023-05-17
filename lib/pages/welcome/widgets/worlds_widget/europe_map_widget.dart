import 'package:flutter/material.dart';
import 'package:weather_app/common/text_extension.dart';

// 欧洲
class EuropeMapWidget extends StatelessWidget {
  const EuropeMapWidget({
    super.key,
  });

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
            'assets/weather_icon/world/oz.jpg',
            fit: BoxFit.fill,
            width: screenWidth - (30 * ratio),
          ),
          Stack(
            children: [
              Positioned(
                left: 20 * ratio,
                top: 23 * ratio,
                child: Text(
                  '雷克雅维克',
                  style: TextStyle(fontSize: (11 * ratio)),
                ).inkWellToWeatherInternational(context),
              ),
              Positioned(
                left: 115 * ratio,
                top: 75 * ratio,
                child: Text(
                  '奥斯陆',
                  style: TextStyle(fontSize: 14 * ratio),
                ).inkWellToWeatherInternational(context),
              ),
              Positioned(
                left: 50 * ratio,
                top: 110 * ratio,
                child: Text(
                  '伦敦',
                  style: TextStyle(fontSize: 14 * ratio),
                ).inkWellToWeatherInternational(context),
              ),
              Positioned(
                left: 262 * ratio,
                top: 82 * ratio,
                child: Text(
                  '莫斯科',
                  style: TextStyle(fontSize: 14 * ratio),
                ).inkWellToWeatherInternational(context),
              ),
              Positioned(
                left: 205 * ratio,
                top: 127 * ratio,
                child: Text(
                  '华沙',
                  style: TextStyle(fontSize: 14 * ratio),
                ).inkWellToWeatherInternational(context),
              ),
              Positioned(
                left: 20 * ratio,
                top: 226 * ratio,
                child: Text(
                  '马德里',
                  style: TextStyle(fontSize: 14 * ratio),
                ).inkWellToWeatherInternational(context),
              ),
              Positioned(
                left: 58 * ratio,
                top: 165 * ratio,
                child: Text(
                  '巴黎',
                  style: TextStyle(fontSize: 14 * ratio),
                ).inkWellToWeatherInternational(context),
              ),
              Positioned(
                left: 131 * ratio,
                top: 135 * ratio,
                child: Text(
                  '柏林',
                  style: TextStyle(fontSize: 14 * ratio),
                ).inkWellToWeatherInternational(context),
              ),
              Positioned(
                left: 122 * ratio,
                top: 237 * ratio,
                child: Text(
                  '罗马',
                  style: TextStyle(fontSize: 14 * ratio),
                ).inkWellToWeatherInternational(context),
              ),
              Positioned(
                left: 134 * ratio,
                top: 190 * ratio,
                child: Text(
                  '维也纳',
                  style: TextStyle(fontSize: 14 * ratio),
                ).inkWellToWeatherInternational(context),
              ),
              Positioned(
                left: 234 * ratio,
                top: 185 * ratio,
                child: Text(
                  '布加勒斯特',
                  style: TextStyle(fontSize: 10 * ratio),
                ).inkWellToWeatherInternational(context),
              ),
              Positioned(
                left: 207 * ratio,
                top: 238 * ratio,
                child: Text(
                  '雅典',
                  style: TextStyle(fontSize: 14 * ratio),
                ).inkWellToWeatherInternational(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
