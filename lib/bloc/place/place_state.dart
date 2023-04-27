part of 'place_bloc.dart';

@immutable
abstract class PlaceState {}

class PlaceInitial extends PlaceState {}

class PlaceLoadInProgress extends PlaceState {}

class PlaceLoadedSuccess extends PlaceState {
  final Place place;

  PlaceLoadedSuccess(this.place);
}

class PlaceLoadedFailure extends PlaceState {
  final String error;

  PlaceLoadedFailure(this.error);
}

class PlaceGameInProgress extends PlaceLoadedSuccess {
  PlaceGameInProgress(super.place);
}

class PlaceGameCompletedSuccess extends PlaceLoadedSuccess {
  PlaceGameCompletedSuccess(super.place);
}

class PlaceGameCompletedFailure extends PlaceLoadedSuccess {
  PlaceGameCompletedFailure(super.place);
}
