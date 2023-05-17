part of 'weather_response_bloc.dart';

enum WeatherResponseStatus {
  initial,
  httpLoading,
  httpSuccess,
  httpFailure,
}

class WeatherResponseState extends Equatable {
  const WeatherResponseState({
    this.status = WeatherResponseStatus.initial,
    this.provcn = '',
    this.city = '',
    this.air,
    this.weather,
  });

  final WeatherResponseStatus? status;
  final String? provcn;
  final String? city;
  final AirCurrent? air;
  final Weather? weather;

  WeatherResponseState copyWith({
    WeatherResponseStatus? status,
    String? provcn,
    String? city,
    AirCurrent? air,
    Weather? weather,
  }) =>
      WeatherResponseState(
        status: status ?? this.status,
        provcn: provcn ?? this.provcn,
        city: city ?? this.city,
        air: air ?? this.air,
        weather: weather ?? this.weather,
      );

  @override
  List<Object?> get props => [
        status,
        provcn,
        city,
        air,
        weather,
      ];
}
