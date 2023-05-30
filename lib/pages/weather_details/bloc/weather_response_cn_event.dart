part of 'weather_response_cn_bloc.dart';

sealed class WeatherResponseCnEvent extends Equatable {
  const WeatherResponseCnEvent();

  @override
  List<Object> get props => [];
}

final class WeatherResponseCnLoadedEvent extends WeatherResponseCnEvent {
  const WeatherResponseCnLoadedEvent();
}
