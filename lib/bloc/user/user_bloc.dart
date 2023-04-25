import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tech_adventure/data/minigame.dart';
import 'package:tech_adventure/data/place.dart';
import 'package:tech_adventure/data/api/backend.dart';
import 'package:tech_adventure/data/api/backend_mock.dart';
import 'package:tech_adventure/data/models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

const String conferenceRoom = "conference room";
const String cafeteria = "cafeteria";
const String office = "office";

class UserBloc extends Bloc<UserEvent, UserState> {
  final IBackend backend = BackendMock();

  UserBloc() : super(UserInitial()) {
    on<UserRequested>((event, emit) async {
      emit(UserLoadInProgress());
      User user = await backend.getUser();
      emit(UserLoadSuccess(user));
    });
  }

  //Testing Data
  Future<User> getMockUser() async {
    await Future.delayed(const Duration(seconds: 1));
    return User(1, "max.mustemann@jambit.com", "MadMax", "Max", "Mustermann", [...getMockPlaces()], "image", 300);
  }

  User getMockUser2() {
    return User(2, "grixon0@yahoo.com", "Garey", "Garey", "Rixon", [], "image", 0);
  }

  List<Place> getMockPlaces() {
    return [
      Place(1, "Toko", getMockUser2(), Minigame("DiceRolling", 5), conferenceRoom, "image", "tdb"),
      Place(2, "Sarah's Office", getMockUser2(), Minigame("DiceRolling", 5), office, "image", "tdb"),
      Place(3, "Java", getMockUser2(), Minigame("DiceRolling", 5), cafeteria, "image", "tdb"),
    ];
  }

  Place getMockPlace() {
    return Place(1, "Street", getMockUser2(), Minigame("DiceRolling", 5), "conference room", "image", "tdb");
  }
}
