part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class IncrementButtonTapped extends CounterEvent {}

class DecrementButtonTapped extends CounterEvent {}
