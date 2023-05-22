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

    final SharedPreferences store = await SharedPreferences.getInstance();
    bool storeState = await store.setString(
        'local_location', jsonEncode(address.addressData));

    if (!storeState) {
      emit(state.copyWith(status: LocationGetStatus.failure));
    } else {
      emit(state.copyWith(status: LocationGetStatus.success));
    }
  }

  void getAmapSdkGeo() async {
    GetLocation amapLocation = GetLocation();
    amapLocation.init();
    amapLocation.start();
    if (null != amapLocation.locationResult) {
      debugPrint(amapLocation.locationResult.toString());
    }
  }

  void getPermisssion() async {
    Location location = Location();

    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      emit(state.copyWith(status: LocationGetStatus.serviceDisabled));
    } else {
      emit(state.copyWith(status: LocationGetStatus.serviceEnabled));
    }

    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      emit(state.copyWith(status: LocationGetStatus.permissionDenied));
    } else {
      emit(state.copyWith(status: LocationGetStatus.permissionGranted));
    }
  }

  void changePermission() async {
    Location location = Location();

    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      emit(state.copyWith(status: LocationGetStatus.serviceDisabled));

      serviceEnabled = await location.requestService();
      if (serviceEnabled) {
        emit(state.copyWith(status: LocationGetStatus.serviceEnabled));
      } else {
        return;
      }
    }

    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      emit(state.copyWith(status: LocationGetStatus.permissionDenied));

      permissionGranted = await location.requestPermission();
      if (permissionGranted == PermissionStatus.granted) {
        emit(state.copyWith(status: LocationGetStatus.permissionGranted));
      }
    }
  }
}
