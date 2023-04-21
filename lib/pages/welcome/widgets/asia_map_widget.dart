import 'package:flutter/material.dart';

// 亚洲
class AsiaMapWidget extends StatelessWidget {
  const AsiaMapWidget({
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
            'assets/weather_icon/world/yz.jpg',
          ),
          Stack(
            children: const [
              Positioned(
                left: 20,
                top: 70,
                child: Text('德黑兰'),
              ),
              Positioned(
                left: 85,
                top: 65,
                child: Text('塔什干'),
              ),
              Positioned(
                left: 188,
                top: 35,
                child: Text('乌兰巴托'),
              ),
              Positioned(
                left: 238,
                top: 78,
                child: Text('北京'),
              ),
              Positioned(
                left: 303,
                top: 60,
                child: Text('首尔'),
              ),
              Positioned(
                left: 310,
                top: 98,
                child: Text('东京'),
              ),
              Positioned(
                left: 38,
                top: 143,
                child: Text('利雅得'),
              ),
              Positioned(
                left: 108,
                top: 103,
                child: Text('新德里'),
              ),
              Positioned(
                left: 113,
                top: 197,
                child: Text('马累'),
              ),
              Positioned(
                left: 198,
                top: 146,
                child: Text('曼谷'),
              ),
              Positioned(
                left: 274,
                top: 164,
                child: Text('马尼拉'),
              ),
              Positioned(
                left: 230,
                top: 218,
                child: Text('雅加达'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
