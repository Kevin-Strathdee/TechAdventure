part of 'counter_bloc.dart';

@immutable
abstract class CounterState {
  int currentCount = 0;
}

class CounterInitial extends CounterState {}

class CounterPositive extends CounterState {
  CounterPositive(int count) {
    currentCount = count;
  }
}

class CounterNegative extends CounterState {
  CounterNegative(int count) {
    currentCount = count;
  }
}
