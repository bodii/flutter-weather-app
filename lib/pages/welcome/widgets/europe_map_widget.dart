import 'package:flutter/material.dart';

// 欧洲
class EuropeMapWidget extends StatelessWidget {
  const EuropeMapWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      padding: const EdgeInsets.all(20.0),
      child: Stack(
        children: [
          Image.asset(
            'assets/weather_icon/world/oz.jpg',
          ),
          Stack(
            children: const [
              Positioned(
                left: 20,
                top: 20,
                child: Text(
                  '雷克雅维克',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Positioned(
                left: 108,
                top: 72,
                child: Text('奥斯陆'),
              ),
              Positioned(
                left: 48,
                top: 100,
                child: Text('伦敦'),
              ),
              Positioned(
                left: 245,
                top: 78,
                child: Text('莫斯科'),
              ),
              Positioned(
                left: 195,
                top: 120,
                child: Text('华沙'),
              ),
              Positioned(
                left: 18,
                top: 210,
                child: Text('马德里'),
              ),
              Positioned(
                left: 53,
                top: 155,
                child: Text('巴黎'),
              ),
              Positioned(
                left: 122,
                top: 126,
                child: Text('柏林'),
              ),
              Positioned(
                left: 115,
                top: 222,
                child: Text('罗马'),
              ),
              Positioned(
                left: 125,
                top: 180,
                child: Text('维也纳'),
              ),
              Positioned(
                left: 218,
                top: 171,
                child: Text(
                  '布加勒斯特',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Positioned(
                left: 193,
                top: 222,
                child: Text('雅典'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
