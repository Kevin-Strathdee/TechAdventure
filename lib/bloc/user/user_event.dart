part of 'user_bloc.dart';

@immutable
abstract class UserEvent {
}

class CoffeeBeansIncremented extends UserEvent {
  final int numBeans;

  CoffeeBeansIncremented(this.numBeans);
}

class GetUser extends UserEvent {}