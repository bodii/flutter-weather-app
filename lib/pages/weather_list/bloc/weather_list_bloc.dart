import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/api/response.dart';
import 'package:weather_app/model/amap_geo_to_address.dart';
import 'package:weather_app/model/city.dart';

part 'weather_list_event.dart';
part 'weather_list_state.dart';

class WeatherListBloc extends Bloc<WeatherListEvent, WeatherListState> {
  WeatherListBloc() : super(const WeatherListState()) {
    on<WeatherListGetAddressEvent>(_getAddressInfo);
  }

  Future<void> _getAddressInfo(
    WeatherListGetAddressEvent event,
    Emitter<WeatherListState> emit,
  ) async {
    final SharedPreferences store = await SharedPreferences.getInstance();
    String? addressStr = store.getString('local_location');
    if (addressStr == null) {
      emit(state.copyWith(status: WeatherListStatus.failure));
      throw Exception("store get address info failure");
    }
    // List<String> keys = store.getKeys().toList();
    // print(keys);

    // print(addressStr);

    AmapAddressData address = AmapAddressData.fromJson(jsonDecode(addressStr));

    String addressProvince = address.province!;
    if (addressProvince.length > 1) {
      addressProvince =
          addressProvince.substring(0, addressProvince.length - 1);
    }

    emit(state.copyWith(province: addressProvince));
    String addressCity = address.city!;
    if (addressCity.length > 1) {
      addressCity = addressCity.substring(0, addressCity.length - 1);
    }
    emit(state.copyWith(localCity: addressCity));

    print(addressProvince);
    print(addressCity);

    List<City> cityList = await getChinaAllCityList();
    if (cityList.isEmpty) {
      emit(state.copyWith(status: WeatherListStatus.failure));
      throw Exception("getChinaAllCityList request failure");
    }
    // print(jsonEncode(cityList));

    City? currentCity;
    final List<City> currentProvinceCitys = [];

    for (City city in cityList) {
      if (city.provcn == addressProvince && city.districtcn == addressCity) {
        currentProvinceCitys.add(city);

        if (city.namecn == addressCity) {
          currentCity = city;
        }
      }
    }

    emit(state.copyWith(
      status: WeatherListStatus.success,
      currentCity: currentCity!,
      currentProvinceCitys: currentProvinceCitys,
    ));
  }
}