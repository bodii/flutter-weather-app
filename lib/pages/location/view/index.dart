import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/api/location.dart';
import 'package:weather_app/api/response.dart';
import 'package:weather_app/model/city.dart';
import 'package:weather_app/model/weather.dart';

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
                    onPressed: () async {
                      // GetLocation amapLocation = GetLocation();
                      // amapLocation.init();
                      // amapLocation.start();
                      // if (null != amapLocation.locationResult) {
                      //   debugPrint(amapLocation.locationResult.toString());
                      // }
                      var location = await getLocation();
                      // var address = await getAddress(
                      var address = await getAmapGeoToAddress(
                          location!.latitude ?? 0.0, location.longitude ?? 0.0);
                      List<City> cityList = await getChinaAllCityList();
                      print(address.addressData!.city);
                      String addressProvince = address.addressData!.province!;
                      if (addressProvince.length > 1) {
                        addressProvince = addressProvince.substring(
                            0, addressProvince.length - 1);
                      }
                      String addressCity = address.addressData!.city!;
                      if (addressCity.length > 1) {
                        addressCity =
                            addressCity.substring(0, addressCity.length - 1);
                      }

                      print(addressProvince);
                      print(addressCity);

                      if (cityList.isNotEmpty) {
                        City? currentCity;

                        for (City city in cityList) {
                          if (city.provcn == addressProvince &&
                              city.districtcn == addressCity &&
                              city.namecn == addressCity) {
                            currentCity = city;
                          }
                        }

                        print(currentCity!.namecn);
                        print(currentCity.stationid);

                        Weather weather =
                            await getCurrAnd15dAnd24h(currentCity.stationid!);
                        print(jsonEncode(weather.toJson()));
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
