import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<IncrementButtonTapped>((event, emit) {
      print("got one increment event");
      int newCount = state.currentCount + 1;
      if (newCount >= 0) {
        emit(CounterPositive(newCount));
      } else {
        emit(CounterNegative(newCount));
      }
    });
    on<DecrementButtonTapped>((event, emit) {
      print("got one decrement event");
      int newCount = state.currentCount - 1;
      if (newCount >= 0) {
        emit(CounterNegative(newCount));
      } else {
        emit(CounterNegative(newCount));
      }
    });
  }
}
