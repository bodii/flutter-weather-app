part of 'weather_response_cn_bloc.dart';

enum WeatherResponseCnStatus {
  initial,
  httpLoading,
  httpSuccess,
  httpFailure,
  httpError,
}

class WeatherResponseCnState extends Equatable {
  const WeatherResponseCnState({
    this.status = WeatherResponseCnStatus.initial,
    this.cityId = '',
    this.city = '',
    this.air,
    this.weather,
    this.sunAndMoonAndIndex,
  });

  final WeatherResponseCnStatus? status;
  final String? cityId;
  final String? city;
  final AirCurrent? air;
  final Weather? weather;
  final SunAndMoonAndIndex? sunAndMoonAndIndex;

  WeatherResponseCnState copyWith({
    WeatherResponseCnStatus? status,
    String? cityId,
    String? city,
    AirCurrent? air,
    Weather? weather,
    SunAndMoonAndIndex? sunAndMoonAndIndex,
  }) =>
      WeatherResponseCnState(
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
