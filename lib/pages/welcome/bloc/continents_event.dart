part of 'continents_bloc.dart';

sealed class ContinentsEvent extends Equatable {
  const ContinentsEvent();

  @override
  List<Object> get props => [];
}

final class ContinentsLoaded extends ContinentsEvent {
  const ContinentsLoaded();
}

final class ContinentsSaved extends ContinentsEvent {
  const ContinentsSaved();
}

final class ContinentsGeted extends ContinentsEvent {
  const ContinentsGeted();
}
