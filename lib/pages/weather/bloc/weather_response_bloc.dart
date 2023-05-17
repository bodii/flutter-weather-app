import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:weather_app/api/response.dart';
import 'package:weather_app/model/air_current.dart';
import 'package:weather_app/model/city_station_dis_data.dart';
import 'package:weather_app/model/weather.dart';

part 'weather_response_event.dart';
part 'weather_response_state.dart';

class WeatherResponseBloc
    extends Bloc<WeatherResponseEvent, WeatherResponseState> {
  WeatherResponseBloc({
    required this.city,
    required this.provcn,
  }) : super(WeatherResponseState()) {
    on<WeatherResponseLoadedEvent>(_onRequested);
  }

  final String provcn;
  final String city;

  Future<void> _onRequested(
    WeatherResponseLoadedEvent event,
    Emitter<WeatherResponseState> emit,
  ) async {
    debugPrint("initial");
    emit(state.copyWith(
      status: WeatherResponseStatus.httpLoading,
      provcn: provcn,
      city: city,
    ));
    debugPrint("http loading provcn: $provcn");

    try {
      CityStationDisDataList cityStat = await getCityStationDisData(provcn);
      String stationid = '';
      for (CityStationDis cs in cityStat.cityStationDisList!) {
        if (cs.districtcn == city && cs.namecn == city) {
          stationid = cs.stationid!;
        }
      }
      if (stationid.isNotEmpty) {
        debugPrint("stationid: $stationid");
        AirCurrent air = await getAirCurrent(stationid);
        Weather weather = await getCurrAnd15dAnd24h(stationid);
        debugPrint("air");
        debugPrint(jsonEncode(air.toJson()));

        debugPrint("weather");
        debugPrint(jsonEncode(weather.toJson()));

        emit(state.copyWith(
          status: WeatherResponseStatus.httpSuccess,
          air: air,
          weather: weather,
        ));
      }
    } catch (e, stack) {
      debugPrint("error:");
      debugPrint(e.toString());
      debugPrint(stack.toString());
      emit(state.copyWith(status: WeatherResponseStatus.httpFailure));
    }
  }
}
