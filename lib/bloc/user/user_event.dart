part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class UserRequested extends UserEvent {}

class UserUpdated extends UserEvent {
  final User user;
  UserUpdated(this.user);
}
