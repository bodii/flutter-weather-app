part of 'weather_response_bloc.dart';

sealed class WeatherResponseEvent extends Equatable {
  const WeatherResponseEvent();

  @override
  List<Object> get props => [];
}

final class WeatherResponseLoadedEvent extends WeatherResponseEvent {
  const WeatherResponseLoadedEvent();
}
