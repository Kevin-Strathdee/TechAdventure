part of 'place_bloc.dart';

@immutable
abstract class PlaceEvent {}

class PlaceScanned extends PlaceEvent {
  final String id;
  PlaceScanned(this.id);
}

class PlaceGameStarted extends PlaceEvent {
  final Place place;

  PlaceGameStarted(this.place);
}

class PlaceGameFinished extends PlaceEvent {
  final int score;
  final Place place;

  PlaceGameFinished(this.score, this.place);
}
