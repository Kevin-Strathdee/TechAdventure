import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'scan_event.dart';
part 'scan_state.dart';

class ScanBloc extends Bloc<ScanEvent, ScanState> {
  ScanBloc() : super(ScanInitial()) {
    on<ScanStarted>((event, emit) {
      emit(ScanInProgress());
    });
    on<ScanCodeDetected>((event, emit) {
      emit(ScanCompleted(event.code));
    });
    on<ScanEnded>((event, emit) {
      emit(ScanInitial());
    });
  }
}
