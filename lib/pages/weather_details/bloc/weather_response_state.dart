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
    this.weather,
    this.wniIndexs,
  });

  final WeatherResponseStatus? status;
  final String? cityId;
  final String? city;
  final WniHotCountryData? weather;
  final List<WniHotCountryIndex>? wniIndexs;

  WeatherResponseState copyWith({
    WeatherResponseStatus? status,
    String? cityId,
    String? city,
    WniHotCountryData? weather,
    List<WniHotCountryIndex>? wniIndexs,
  }) =>
      WeatherResponseState(
        status: status ?? this.status,
        cityId: cityId ?? this.cityId,
        city: city ?? this.city,
        weather: weather ?? this.weather,
        wniIndexs: wniIndexs ?? this.wniIndexs,
      );

  @override
  List<Object?> get props => [
        status,
        cityId,
        city,
        weather,
        wniIndexs,
      ];
}
