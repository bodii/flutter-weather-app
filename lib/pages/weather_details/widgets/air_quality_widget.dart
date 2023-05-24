import 'package:flutter/material.dart';

class AirQualityWidget extends StatelessWidget {
  const AirQualityWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 230,
      padding: const EdgeInsets.symmetric(vertical: 20),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        // backgroundBlendMode: BlendMode.colorBurn,
        color: Colors.grey[100],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 320,
            height: 80,
            child: Column(
              children: [
                const Row(
                  children: [
                    Text('50', style: TextStyle(fontSize: 32)),
                    Text('良好'),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 6,
                      decoration: const BoxDecoration(color: Colors.lightGreen),
                    ),
                    Container(
                      width: 20,
                      height: 6,
                      decoration: const BoxDecoration(color: Colors.grey),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('良好'),
                    Text('严重'),
                  ],
                ),
              ],
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AirItem(title: 'PM2.5', value: '21'),
              AirItem(title: 'PM10', value: '39'),
              AirItem(title: 'CO', value: '0'),
              AirItem(title: 'SO2', value: '5'),
            ],
          ),
        ],
      ),
    );
  }
}

class AirItem extends StatelessWidget {
  const AirItem({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    const double maxWidth = 55;
    return SizedBox(
      height: 60,
      width: maxWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 12)),
          Text(value, style: const TextStyle(fontSize: 20)),
          Stack(
            children: [
              Container(
                width: maxWidth,
                height: 6,
                color: Colors.grey[300],
              ),
              Container(
                width: maxWidth * (double.parse(value) / 100),
                height: 6,
                color: Colors.green,
              ),
            ],
          )
        ],
      ),
    );
  }
}
