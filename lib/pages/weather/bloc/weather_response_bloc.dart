import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:weather_app/api/response.dart';
import 'package:weather_app/model/air_current.dart';
import 'package:weather_app/model/city_station_dis_data.dart';
import 'package:weather_app/model/sun_and_moon.dart';
import 'package:weather_app/model/weather.dart';

part 'weather_response_event.dart';
part 'weather_response_state.dart';

class WeatherResponseBloc
    extends Bloc<WeatherResponseEvent, WeatherResponseState> {
  WeatherResponseBloc({
    required this.city,
    required this.provcn,
  }) : super(const WeatherResponseState()) {
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
        final AirCurrent air = await getAirCurrent(stationid);
        final Weather weather = await getCurrAnd15dAnd24h(stationid);
        final SunAndMoonAndIndex sunAndMoonAndIndex =
            await getSunMoonAndIndex(stationid);

        if (air.dataTime == null ||
            weather.current == null ||
            sunAndMoonAndIndex.sunAndMoon == null) {
          debugPrint("air or weather or sunAndMoonAndIndex is null");
          emit(state.copyWith(
            status: WeatherResponseStatus.httpFailure,
          ));
        } else {
          debugPrint("air");
          debugPrint(jsonEncode(air.toJson()));

          debugPrint("weather");
          debugPrint(jsonEncode(weather.toJson()));

          debugPrint("sunAndMoonAndIndex");
          debugPrint(jsonEncode(sunAndMoonAndIndex.toJson()));

          emit(state.copyWith(
            status: WeatherResponseStatus.httpSuccess,
            air: air,
            weather: weather,
            sunAndMoonAndIndex: sunAndMoonAndIndex,
          ));
        }
      }
    } catch (e, stack) {
      debugPrint("error:");
      debugPrint(e.toString());
      debugPrint(stack.toString());
      emit(state.copyWith(status: WeatherResponseStatus.httpError));
    }
  }
}
