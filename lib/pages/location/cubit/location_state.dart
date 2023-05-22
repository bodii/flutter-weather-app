part of 'location_cubit.dart';

enum LocationGetStatus {
  init,
  serviceEnabled,
  serviceDisabled,
  permissionDenied,
  permissionGranted,
  inProgress,
  success,
  failure,
}

extension LocationGetStatusX on LocationGetStatus {
  bool get isSuccess => LocationGetStatus.success == this;

  bool get hasPermission => LocationGetStatus.permissionGranted == this;

  bool get notPermission => LocationGetStatus.permissionDenied == this;
}

final class LocationState extends Equatable {
  const LocationState({
    this.status = LocationGetStatus.init,
  });

  final LocationGetStatus status;

  LocationState copyWith({
    LocationGetStatus? status,
  }) =>
      LocationState(
        status: status ?? this.status,
      );

  @override
  List<Object> get props => [status];
}
