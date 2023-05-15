import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AfriceMapWidget extends StatelessWidget {
  const AfriceMapWidget({Key? key}) : super(key: key);

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
            'assets/weather_icon/world/fz.jpg',
            fit: BoxFit.fill,
            width: screenWidth - (30 * ratio),
          ),
          Stack(
            children: [
              Positioned(
                left: 115 * ratio,
                top: 18 * ratio,
                child: InkWell(
                  onTap: () {
                    context
                        .goNamed('wearther', pathParameters: {'city': '突尼斯'});
                  },
                  child: Text(
                    '突尼斯',
                    style: TextStyle(fontSize: (14 * ratio)),
                  ),
                ),
              ),
              Positioned(
                left: 217 * ratio,
                top: 22 * ratio,
                child: InkWell(
                  onTap: () {
                    print("test");
                  },
                  child: Text(
                    '开罗',
                    style: TextStyle(fontSize: (14 * ratio)),
                  ),
                ),
              ),
              Positioned(
                left: 40 * ratio,
                top: 79 * ratio,
                child: InkWell(
                  onTap: () {
                    print("test");
                  },
                  child: Text(
                    '达喀尔',
                    style: TextStyle(fontSize: (14 * ratio)),
                  ),
                ),
              ),
              Positioned(
                left: 149 * ratio,
                top: 122 * ratio,
                child: Text(
                  '班吉',
                  style: TextStyle(fontSize: (14 * ratio)),
                ),
              ),
              Positioned(
                left: 197 * ratio,
                top: 79 * ratio,
                child: Text(
                  '恩贾梅纳',
                  style: TextStyle(fontSize: (13 * ratio)),
                ),
              ),
              Positioned(
                left: 248 * ratio,
                top: 133 * ratio,
                child: Text(
                  '内罗华',
                  style: TextStyle(fontSize: (14 * ratio)),
                ),
              ),
              Positioned(
                left: 198 * ratio,
                top: 184 * ratio,
                child: Text(
                  '哈拉雷',
                  style: TextStyle(fontSize: (14 * ratio)),
                ),
              ),
              Positioned(
                left: 147 * ratio,
                top: 242 * ratio,
                child: Text(
                  '开普敦',
                  style: TextStyle(fontSize: (14 * ratio)),
                ),
              ),
              Positioned(
                left: 288 * ratio,
                top: 218 * ratio,
                child: Text(
                  '塔那那利佛',
                  style: TextStyle(fontSize: (10 * ratio)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
