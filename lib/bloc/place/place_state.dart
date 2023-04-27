part of 'place_bloc.dart';

@immutable
abstract class PlaceState {}

class PlaceInitial extends PlaceState {}

class PlaceLoadInProgress extends PlaceState {}

class PlaceLoadedSuccess extends PlaceState {
  final Place place;

  PlaceLoadedSuccess(this.place);
}

class PlaceLoadedFailure extends PlaceState {}

class PlaceGameInProgress extends PlaceState {
  final Place place;

  PlaceGameInProgress(this.place);
}

class PlaceGameCompletedSuccess extends PlaceState {
  final Place place;

  PlaceGameCompletedSuccess(this.place);
}

class PlaceGameCompletedFailure extends PlaceState {
  final Place place;

  PlaceGameCompletedFailure(this.place);
}
