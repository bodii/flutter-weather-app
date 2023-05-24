part of 'weather_list_bloc.dart';

enum WeatherListStatus {
  init,
  inProgress,
  success,
  failure,
}

extension WeatherListStatusX on WeatherListStatus {}

final class WeatherListState extends Equatable {
  const WeatherListState({
    this.status = WeatherListStatus.init,
    this.province,
    this.cityName,
    this.cityId,
    this.cityWeather,
    this.provinceCitysWeather,
  });

  final WeatherListStatus status;
  final String? cityName;
  final String? cityId;
  final String? province;
  final List<RelatedArea>? provinceCitysWeather;
  final RelatedArea? cityWeather;

  WeatherListState copyWith({
    WeatherListStatus? status,
    String? cityName,
    String? cityId,
    String? province,
    List<RelatedArea>? provinceCitysWeather,
    RelatedArea? cityWeather,
  }) =>
      WeatherListState(
        status: status ?? this.status,
        cityName: cityName ?? this.cityName,
        cityId: cityId ?? this.cityId,
        province: province ?? this.province,
        cityWeather: cityWeather ?? this.cityWeather,
        provinceCitysWeather: provinceCitysWeather ?? this.provinceCitysWeather,
      );

  @override
  List<Object?> get props => [
        status,
        cityName,
        cityId,
        province,
        cityWeather,
        provinceCitysWeather,
      ];
}
