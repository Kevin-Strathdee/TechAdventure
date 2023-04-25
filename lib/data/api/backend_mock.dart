import 'package:tech_adventure/data/api/backend.dart';
import 'package:tech_adventure/data/models/minigame.dart';
import 'package:tech_adventure/data/models/place.dart';
import 'package:tech_adventure/data/models/user.dart';

class BackendMock extends IBackend {

  //Testing Data
  User getMockUser(){
    return User(1, "max.mustemann@jambit.com", "MadMax", "Max", "Mustermann", [getMockPlace()], "image", 300);
  }

  User getMockUser2(){
    return User(2, "grixon0@yahoo.com", "Garey", "Garey", "Rixon", [], "image", 0);
  }

  Place getMockPlace() {
    return Place(1, "Street", getMockUser2(), Minigame("DiceRolling", 5),"confrence room", "image", "tdb");
  }

  @override
  Future<User> getUser() {
    return Future.value(getMockUser());
  }

  @override
  Future<Place> getPlace() {
    throw Future.value(getMockPlace());
  }
}