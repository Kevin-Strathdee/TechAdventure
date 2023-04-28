import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:japomo/bloc/user/user_bloc.dart';
import 'package:japomo/data/api/backend.dart';
import 'package:japomo/data/models/place.dart';

part 'place_event.dart';
part 'place_state.dart';

class PlaceBloc extends Bloc<PlaceEvent, PlaceState> {
  final IBackend backend;
  final UserBloc userBloc;
  PlaceBloc(this.backend, this.userBloc) : super(PlaceInitial()) {
    on<PlaceScanned>((event, emit) async {
      emit(PlaceLoadInProgress());
      try {
        final place = await backend.getPlace(event.id);
        emit(PlaceLoadedSuccess(place));
      } catch (e) {
        emit(PlaceLoadedFailure(e.toString()));
      }
    });
    on<PlaceGameFinished>((event, emit) async {
      try {
        final outcome = await backend.submitScore(event.place, event.score);
        userBloc.add(UserRequested());
        emit(PlaceGameCompletedSuccess(outcome.place, points: outcome.points, score: event.score));
      } catch (e) {
        emit(PlaceGameCompletedFailure(event.place));
      }
    });
    on<PlaceGameStarted>((event, emit) {
      emit(PlaceGameInProgress(event.place));
    });
  }
}
