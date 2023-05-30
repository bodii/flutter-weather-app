import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:weather_app/model/air_current.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/model/sun_and_moon.dart';
import 'package:weather_app/api/response.dart';

part 'weather_response_cn_event.dart';
part 'weather_response_cn_state.dart';

class WeatherResponseCnBloc
    extends Bloc<WeatherResponseCnEvent, WeatherResponseCnState> {
  WeatherResponseCnBloc({
    required this.city,
    required this.cityId,
  }) : super(const WeatherResponseCnState()) {
    on<WeatherResponseCnLoadedEvent>(_onRequested);
  }

  final String cityId;
  final String city;

  Future<void> _onRequested(
    WeatherResponseCnLoadedEvent event,
    Emitter<WeatherResponseCnState> emit,
  ) async {
    debugPrint("initial");
    emit(state.copyWith(
      status: WeatherResponseCnStatus.httpLoading,
      cityId: cityId,
      city: city,
    ));
    debugPrint("http loading cityId: $cityId");

    try {
      String stationid = cityId;

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
            status: WeatherResponseCnStatus.httpFailure,
          ));
        } else {
          // debugPrint("air");
          // debugPrint(jsonEncode(air.toJson()));

          // debugPrint("weather");
          // debugPrint(jsonEncode(weather.toJson()));

          // debugPrint("sunAndMoonAndIndex");
          // debugPrint(jsonEncode(sunAndMoonAndIndex.toJson()));

          emit(state.copyWith(
            status: WeatherResponseCnStatus.httpSuccess,
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
      emit(state.copyWith(status: WeatherResponseCnStatus.httpError));
    }
  }
}
