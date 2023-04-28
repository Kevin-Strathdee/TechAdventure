import 'package:tech_adventure/data/api/backend.dart';
import 'package:tech_adventure/data/models/geometry.dart';
import 'package:tech_adventure/data/models/minigame.dart';
import 'package:tech_adventure/data/models/minigame_outcome.dart';
import 'package:tech_adventure/data/models/place.dart';
import 'package:tech_adventure/data/models/user.dart';

class BackendMock extends IBackend {
  //Testing Data
  User getMockUser() {
    return User(1, "max.mustemann@jambit.com", "MadMax", "Max", [getMockPlace()], 300);
  }

  User getMockUser2() {
    return User(2, "grixon0@yahoo.com", "Garey", "Weber", [], 0);
  }

  Place getMockPlace() {
    return Place("1", "Street", getMockUser2(), Minigame("DiceRolling", 5), "image", Geometry(Map.MUNICH_4, 10, 10));
  }

  @override
  Future<User> getUser() async {
    await Future.delayed(const Duration(seconds: 1));

    return Future.value(getMockUser());
  }

  @override
  Future<Place> getPlace(String id) async {
    return getMockPlace();
  }

  @override
  Future<User> updateUser(User user) async {
    await Future.delayed(Duration(seconds: 1));
    return user;
  }

  @override
  Future<MinigameOutcome> submitScore(Place place, int score) async {
    await Future.delayed(Duration(seconds: 1));
    return MinigameOutcome(place, 5);
  }
}
