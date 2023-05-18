part of 'weather_response_bloc.dart';

enum WeatherResponseStatus {
  initial,
  httpLoading,
  httpSuccess,
  httpFailure,
  httpError,
}

class WeatherResponseState extends Equatable {
  const WeatherResponseState({
    this.status = WeatherResponseStatus.initial,
    this.cityId = '',
    this.city = '',
    this.air,
    this.weather,
    this.sunAndMoonAndIndex,
  });

  final WeatherResponseStatus? status;
  final String? cityId;
  final String? city;
  final AirCurrent? air;
  final Weather? weather;
  final SunAndMoonAndIndex? sunAndMoonAndIndex;

  WeatherResponseState copyWith({
    WeatherResponseStatus? status,
    String? cityId,
    String? city,
    AirCurrent? air,
    Weather? weather,
    SunAndMoonAndIndex? sunAndMoonAndIndex,
  }) =>
      WeatherResponseState(
        status: status ?? this.status,
        cityId: cityId ?? this.cityId,
        city: city ?? this.city,
        air: air ?? this.air,
        weather: weather ?? this.weather,
        sunAndMoonAndIndex: sunAndMoonAndIndex ?? this.sunAndMoonAndIndex,
      );

  @override
  List<Object?> get props => [
        status,
        cityId,
        city,
        air,
        weather,
        sunAndMoonAndIndex,
      ];
}
