part of 'weather_list_cubit.dart';

enum WeatherListStatus {
  init,
  inProgress,
  success,
  failure,
}

extension WeatherListStatusX on WeatherListStatus {
  bool get isSuccess => this == WeatherListStatus.success;
}

final class WeatherListState extends Equatable {
  const WeatherListState({this.status = WeatherListStatus.init});

  final WeatherListStatus status;

  WeatherListState copyWith({
    WeatherListStatus? status,
  }) =>
      WeatherListState(
        status: status ?? this.status,
      );

  @override
  List<Object> get props => [status];
}
