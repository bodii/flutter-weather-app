import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:weather_app/api/response.dart';
import 'package:weather_app/model/wni_hot_country_data.dart';
import 'package:weather_app/model/wni_hot_country_index.dart';

part 'weather_response_event.dart';
part 'weather_response_state.dart';

class WeatherResponseBloc
    extends Bloc<WeatherResponseEvent, WeatherResponseState> {
  WeatherResponseBloc({
    required this.city,
    required this.cityId,
  }) : super(const WeatherResponseState()) {
    on<WeatherResponseLoadedEvent>(_onRequested);
  }

  final String cityId;
  final String city;

  Future<void> _onRequested(
    WeatherResponseLoadedEvent event,
    Emitter<WeatherResponseState> emit,
  ) async {
    debugPrint("initial");
    emit(state.copyWith(
      status: WeatherResponseStatus.httpLoading,
      cityId: cityId,
      city: city,
    ));
    debugPrint("http loading cityId: $cityId");

    try {
      String stationid = cityId;

      if (stationid.isNotEmpty) {
        debugPrint("stationid: $stationid");
        final WniHotCountryData weather = await getWniHotCountryData(stationid);
        final List<WniHotCountryIndex> wniIndexs =
            await getWniHotCountryIndex(stationid);

        if (weather.current == null) {
          debugPrint("weather is null");
          emit(state.copyWith(
            status: WeatherResponseStatus.httpFailure,
          ));
        } else {
          // debugPrint("air");
          // debugPrint(jsonEncode(air.toJson()));

          // debugPrint("weather");
          // debugPrint(jsonEncode(weather.toJson()));

          // debugPrint("sunAndMoonAndIndex");
          // debugPrint(jsonEncode(sunAndMoonAndIndex.toJson()));

          emit(state.copyWith(
            status: WeatherResponseStatus.httpSuccess,
            weather: weather,
            wniIndexs: wniIndexs,
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
