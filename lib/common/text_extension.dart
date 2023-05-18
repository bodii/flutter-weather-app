import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/model/win_hot_city.dart';
import 'package:weather_app/pages/welcome/bloc/continents_bloc.dart';

extension TextExtension on Text {
  // InkWell inkWell(void Function()? onTap) {
  //   return InkWell(
  //     onTap: onTap,
  //     child: this,
  //   );
  // }

  Widget inkWellToWeatherInternational(BuildContext context) {
    if (data == null) {
      throw Exception('data value is empty of Text widget!');
    }

    String cityId = '';
    WniHotCityList? continents;

    SharedPreferences.getInstance().then((store) {
      final String? continentsStr = store.getString("continents");
      if (continentsStr != null) {
        continents = WniHotCityList.fromJson(jsonDecode(continentsStr));
      }
    });

    if (continents == null) {
      debugPrint('continents is null');
      continents = context.watch<ContinentsBloc>().state.continents;

      // throw Exception('continents value is null');
    }

    WniHotCity? wni = continents!.find(data!);

    if (wni == null) {
      throw Exception('wniHotCity info is null');
    }
    print(wni.id);

    if (wni.id == null) {
      throw Exception('continents value is null');
    }

    // 国外城市的id
    cityId = wni.id!;

    return InkWell(
      onTap: () {
        context.pushNamed('/weather/detail/international', pathParameters: {
          'city': data!,
          'cityId': cityId,
        });
      },
      child: this,
    );
  }
}
