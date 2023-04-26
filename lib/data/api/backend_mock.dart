import 'package:tech_adventure/bloc/user/user_bloc.dart';
import 'package:tech_adventure/data/api/backend.dart';
import 'package:tech_adventure/data/models/geometry.dart';
import 'package:tech_adventure/data/models/minigame.dart';
import 'package:tech_adventure/data/models/place.dart';
import 'package:tech_adventure/data/models/user.dart';

class BackendMock extends IBackend {
  //Testing Data
  User getMockUser() {
    return User(1, "max.mustemann@jambit.com", "MadMax", [getMockPlace()], 300);
  }

  User getMockUser2() {
    return User(2, "grixon0@yahoo.com", "Garey", [], 0);
  }

  Place getMockPlace() {
    return Place(1, "Street", getMockUser2(), Minigame("DiceRolling", 5),
        "confrence room", "image", Geometry(Map.MUNICH_4, 10, 10));

  }

  @override
  Future<User> getUser() async {
    await Future.delayed(const Duration(seconds: 1));

    return Future.value(getMockUser());
  }

  @override
  Future<Place> getPlace() {
    throw Future.value(getMockPlace());
  }

  List<Place> getMockPlaces() {
    return [
      Place(1, "Toko", getMockUser2(), Minigame("DiceRolling", 5), conferenceRoom, "image", "tdb"),
      Place(2, "Sarah's Office", getMockUser2(), Minigame("DiceRolling", 5), office, "image", "tdb"),
      Place(3, "Java", getMockUser2(), Minigame("DiceRolling", 5), cafeteria, "image", "tdb"),
    ];
  }

  @override
  Future<User> updateUser(User user) async {
    await Future.delayed(Duration(seconds: 1));
    return user;
  }
}
