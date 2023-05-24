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
    this.localCity,
    this.currentPage = 0,
    this.currentCity,
    this.currentProvinceCitys,
  });

  final WeatherListStatus status;
  final String? localCity;
  final String? province;
  final List<City>? currentProvinceCitys;
  final City? currentCity;
  final int currentPage;

  WeatherListState copyWith({
    WeatherListStatus? status,
    String? localCity,
    String? province,
    List<City>? currentProvinceCitys,
    City? currentCity,
    int? currentPage,
  }) =>
      WeatherListState(
        status: status ?? this.status,
        localCity: localCity ?? this.localCity,
        province: province ?? this.province,
        currentCity: currentCity ?? this.currentCity,
        currentProvinceCitys: currentProvinceCitys ?? this.currentProvinceCitys,
        currentPage: currentPage ?? this.currentPage,
      );

  @override
  List<Object?> get props => [
        status,
        localCity,
        province,
        currentCity,
        currentProvinceCitys,
        currentPage,
      ];
}
