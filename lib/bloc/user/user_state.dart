part of 'user_bloc.dart';

@immutable
abstract class UserState {
  int numCoffeeBeans = 0;
}

class UserInitial extends UserState {}

class UserCoffeeBeans extends UserState {
  UserCoffeeBeans(int numBeans) {
    numCoffeeBeans = numBeans;
  }
}