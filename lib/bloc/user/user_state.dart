part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserSignedOutSuccess extends UserState {}

class UserLoadInProgress extends UserState {}

class UserLoadSuccess extends UserState {
  final User user;
  UserLoadSuccess(this.user);
}

class UserLoadFailure extends UserState {
  final String error;
  UserLoadFailure(this.error);
}

class UserUpdateInProgress extends UserLoadSuccess {
  UserUpdateInProgress(super.user);
}
