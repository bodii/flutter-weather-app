import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:weather_app/api/amap_location.dart';
import 'package:weather_app/api/location.dart';
import 'package:weather_app/api/response.dart';
import 'package:weather_app/model/amap_geo_to_address.dart';
import 'package:weather_app/model/city.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(const LocationState());

  void getCityInfo() async {
    emit(state.copyWith(status: LocationGetStatus.inProgress));

    LocationData? location = await getLocation();
    if (location == null ||
        location.latitude == null ||
        location.altitude == null) {
      emit(state.copyWith(status: LocationGetStatus.failure));
      throw Exception("getLocation request failure");
    }

    AmapGeoToAddress? address =
        await getAmapGeoToAddress(location.latitude!, location.longitude!);

    if (address.addressData == null ||
        address.addressData!.province == null ||
        address.addressData!.city == null) {
      emit(state.copyWith(status: LocationGetStatus.failure));
      throw Exception("getAmapGeoToAddress request failure");
    }

    List<City> cityList = await getChinaAllCityList();
    if (cityList.isEmpty) {
      emit(state.copyWith(status: LocationGetStatus.failure));
      throw Exception("getChinaAllCityList request failure");
    }

    String addressProvince = address.addressData!.province!;
    if (addressProvince.length > 1) {
      addressProvince =
          addressProvince.substring(0, addressProvince.length - 1);
    }
    String addressCity = address.addressData!.city!;
    if (addressCity.length > 1) {
      addressCity = addressCity.substring(0, addressCity.length - 1);
    }

    print(addressProvince);
    print(addressCity);

    City? currentCity;

    for (City city in cityList) {
      if (city.provcn == addressProvince &&
          city.districtcn == addressCity &&
          city.namecn == addressCity) {
        currentCity = city;
      }
    }
    if (currentCity == null) {
      emit(state.copyWith(status: LocationGetStatus.failure));
      throw Exception("city info get failure");
    }

    print(currentCity.namecn);
    print(currentCity.stationid);
    emit(state.copyWith(
      status: LocationGetStatus.success,
      cityInfo: currentCity,
    ));
  }

  void getAmapSdkGeo() async {
    GetLocation amapLocation = GetLocation();
    amapLocation.init();
    amapLocation.start();
    if (null != amapLocation.locationResult) {
      debugPrint(amapLocation.locationResult.toString());
    }
  }
}
