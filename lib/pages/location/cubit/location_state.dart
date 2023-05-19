part of 'location_cubit.dart';

enum LocationGetStatus {
  init,
  inProgress,
  success,
  failure,
}

extension LocationGetStatusX on LocationGetStatus {
  bool get isSuccess => LocationGetStatus.success == this;
}

final class LocationState extends Equatable {
  const LocationState({
    this.cityInfo,
    this.status = LocationGetStatus.init,
  });

  final City? cityInfo;
  final LocationGetStatus status;

  LocationState copyWith({
    City? cityInfo,
    LocationGetStatus? status,
  }) =>
      LocationState(
        cityInfo: cityInfo ?? this.cityInfo,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [cityInfo, status];
}
