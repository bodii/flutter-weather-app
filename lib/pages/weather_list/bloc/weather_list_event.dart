part of 'weather_list_bloc.dart';

sealed class WeatherListEvent extends Equatable {
  const WeatherListEvent();

  @override
  List<Object> get props => [];
}

final class WeatherListGetAddressEvent extends WeatherListEvent {}
