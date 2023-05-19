import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    print(address.toJson());

    if (address.addressData == null ||
        address.addressData!.province == null ||
        address.addressData!.city == null) {
      emit(state.copyWith(status: LocationGetStatus.failure));
      throw Exception("getAmapGeoToAddress request failure");
    }

    final SharedPreferences store = await SharedPreferences.getInstance();
    bool storeState = await store.setString(
        'local_location', jsonEncode(address.addressData));

    if (!storeState) {
      emit(state.copyWith(status: LocationGetStatus.failure));
    }
    emit(state.copyWith(status: LocationGetStatus.success));
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
