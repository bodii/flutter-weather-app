import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/api/response.dart';
import 'package:weather_app/model/amap_geo_to_address.dart';
import 'package:weather_app/model/city.dart';

part 'weather_list_state.dart';

final class WeatherListCubit extends Cubit<WeatherListState> {
  WeatherListCubit() : super(const WeatherListState());

  void getAddressInfo() async {
    final SharedPreferences store = await SharedPreferences.getInstance();
    String? addressStr = store.getString('local_location');
    if (addressStr == null) {
      emit(state.copyWith(status: WeatherListStatus.failure));
      throw Exception("store get address info failure");
    }
    // List<String> keys = store.getKeys().toList();
    // print(keys);

    AmapGeoToAddress address =
        AmapGeoToAddress.fromJson(jsonDecode(addressStr));

    String addressProvince = address.addressData!.province!;
    if (addressProvince.length > 1) {
      addressProvince =
          addressProvince.substring(0, addressProvince.length - 1);
    }
    String addressCity = address.addressData!.city!;
    if (addressCity.length > 1) {
      addressCity = addressCity.substring(0, addressCity.length - 1);
    }

    // print(addressProvince);
    // print(addressCity);

    List<City> cityList = await getChinaAllCityList();
    if (cityList.isEmpty) {
      emit(state.copyWith(status: WeatherListStatus.failure));
      throw Exception("getChinaAllCityList request failure");
    }
    // print(jsonEncode(cityList));

    // City? currentCity;

    // for (City city in cityList) {
    //   if (city.provcn == addressProvince &&
    //       city.districtcn == addressCity &&
    //       city.namecn == addressCity) {
    //     currentCity = city;
    //   }
    // }
    // if (currentCity == null) {
    //   emit(state.copyWith(status: WeatherListStatus.failure));
    //   throw Exception("city info get failure");
    // }

    // print(currentCity.namecn);
    // print(currentCity.stationid);
    emit(state.copyWith(status: WeatherListStatus.success));
  }
}
