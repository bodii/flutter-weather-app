import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/api/response.dart';
import 'package:weather_app/model/amap_geo_to_address.dart';
import 'package:weather_app/model/city_station_dis_data.dart';
import 'package:weather_app/model/related_weather.dart';

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
    emit(state.copyWith(cityName: addressCity));

    // print(addressProvince);
    // print(addressCity);

    CityStationDisDataList cityList =
        await getCityStationDisData(addressProvince);

    String localCityId = '';
    for (CityStationDis cityInfo in cityList.cityStationDisList!) {
      if (cityInfo.namecn == addressCity) {
        localCityId = cityInfo.stationid!;
      }
    }
    if (localCityId.isEmpty) {
      emit(state.copyWith(status: WeatherListStatus.failure));
      throw Exception('get city id failure');
    }
    emit(state.copyWith(cityId: localCityId));

    // store
    Map<String, String> localCityInfo = {
      'cityId': localCityId,
      'cityName': addressCity,
      'province': addressProvince
    };
    bool storeState = await store.setString(
      'local_city_info',
      jsonEncode(localCityInfo),
    );
    if (!storeState) {
      emit(state.copyWith(status: WeatherListStatus.failure));
      throw Exception('store city info failure');
    }

    RelatedWeather relatedWeatherList = await getRelatedWeather(localCityId);
    emit(state.copyWith(
      provinceCitysWeather: relatedWeatherList.relatedArea!,
    ));

    late final RelatedArea cityWeather;
    for (RelatedArea realated in relatedWeatherList.relatedArea!) {
      if (realated.namecn == addressCity) {
        cityWeather = realated;
      }
    }

    emit(state.copyWith(
      status: WeatherListStatus.success,
      cityWeather: cityWeather,
    ));
  }
}
