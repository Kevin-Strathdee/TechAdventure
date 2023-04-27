import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:tech_adventure/data/api/backend.dart';
import 'package:tech_adventure/data/models/place.dart';

part 'place_event.dart';
part 'place_state.dart';

class PlaceBloc extends Bloc<PlaceEvent, PlaceState> {
  final IBackend backend;
  PlaceBloc(this.backend) : super(PlaceInitial()) {
    on<PlaceScanned>((event, emit) async {
      emit(PlaceLoadInProgress());
      try {
        final place = await backend.getPlace(event.id);
        emit(PlaceLoadedSuccess(place));
      } catch (e) {
        emit(PlaceLoadedFailure());
      }
    });
    on<PlaceGameFinished>((event, emit) async {
      try {
        await backend.submitScore(event.place, event.score);
      } catch (e) {
        emit(PlaceGameCompletedFailure(event.place));
      }
    });
  }
}
