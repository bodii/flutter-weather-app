part of 'continents_bloc.dart';

enum ContinentsStatus {
  initial,
  httpLoading,
  httpSuccess,
  httpfailure,
  storeGetInitial,
  storeGetting,
  storeGetSuccess,
  storeGetFailure,
  storeSaveInitial,
  storeSaving,
  storeSaveSuccess,
  storeSaveFailure
}

class ContinentsState extends Equatable {
  const ContinentsState({
    this.status = ContinentsStatus.initial,
    this.continents,
  });

  final ContinentsStatus status;
  final WniHotCountryList? continents;

  ContinentsState copyWith({
    ContinentsStatus? status,
    WniHotCountryList? continents,
  }) {
    return ContinentsState(
      status: status ?? this.status,
      continents: continents ?? this.continents,
    );
  }

  @override
  List<Object?> get props => [status, continents];
}
