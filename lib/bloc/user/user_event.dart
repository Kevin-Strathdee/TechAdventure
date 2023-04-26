part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class UserRequested extends UserEvent {
  final String userId;

  UserRequested(this.userId);
}

class UserUpdated extends UserEvent {
  final User user;

  UserUpdated(this.user);
}
