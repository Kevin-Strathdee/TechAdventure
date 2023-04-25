part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoadSuccess extends UserState {
  User user;
  UserLoadSuccess(this.user);
}

class UserLoadFailure extends UserState {}

