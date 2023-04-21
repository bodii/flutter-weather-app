part of 'continents_bloc.dart';

abstract class ContinentsEvent extends Equatable {
  const ContinentsEvent();

  @override
  List<Object> get props => [];
}

class ContinentsLoaded extends ContinentsEvent {
  const ContinentsLoaded();
}

class ContinentsSaved extends ContinentsEvent {
  const ContinentsSaved();
}

class ContinentsGeted extends ContinentsEvent {
  const ContinentsGeted();
}
