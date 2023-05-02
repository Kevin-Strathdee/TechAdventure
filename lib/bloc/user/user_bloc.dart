import 'package:bloc/bloc.dart';
import 'package:japomo/data/credentials_util.dart';
import 'package:meta/meta.dart';
import 'package:japomo/data/api/backend.dart';
import 'package:japomo/data/models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

const String conferenceRoom = "conference room";
const String cafeteria = "cafeteria";
const String office = "office";

class UserBloc extends Bloc<UserEvent, UserState> {
  final IBackend backend;
  final CredentialUtil credentialUtil;

  UserBloc(this.backend, this.credentialUtil) : super(UserInitial()) {
    on<UserRequested>((event, emit) async {
      emit(UserLoadInProgress());
      try {
        User user = await backend.getUser();
        emit(UserLoadSuccess(user));
      } catch (e) {
        emit(UserLoadFailure(e.toString()));
      }
    });
    on<UserUpdated>((event, emit) async {
      emit(UserUpdateInProgress(event.user));
      try {
        User user = await backend.updateUser(event.user);
        emit(UserLoadSuccess(user));
      } catch (e) {
        emit(UserLoadFailure(e.toString()));
      }
    });
    on<UserSignedOut>((event, emit) async {
      credentialUtil.logout();
      emit(UserSignedOutSuccess());
    });
  }
}
