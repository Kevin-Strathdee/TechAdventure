
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tech_adventure/data/api/backend.dart';
import 'package:tech_adventure/data/api/backend_mock.dart';
import 'package:tech_adventure/data/models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {

  final IBackend backend = BackendMock();

  UserBloc() : super(UserInitial()) {
    on<UserRequested>((event, emit) async {
      User user = await backend.getUser();
      emit(UserLoadSuccess(user));
    });
  }

}