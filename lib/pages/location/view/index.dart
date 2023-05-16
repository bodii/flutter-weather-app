import 'package:flutter/material.dart';
import 'package:weather_app/api/amap_location.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('位置'),
        ),
        body: Center(
          child: Container(
            alignment: Alignment.center,
            width: 400,
            height: 450,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(120),
                  ),
                  child: const Icon(
                    Icons.location_on,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
                const Column(
                  children: [
                    Text(
                      '需要定位权限',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '请开启位置权限，以获取更准确的天气信息',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 300,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      GetLocation amapLocation = GetLocation();
                      amapLocation.init();
                      amapLocation.start();
                      if (null != amapLocation.locationResult) {
                        debugPrint(amapLocation.locationResult.toString());
                      }
                      // context.pushNamed('/home');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    child: const Text(
                      '同意',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
