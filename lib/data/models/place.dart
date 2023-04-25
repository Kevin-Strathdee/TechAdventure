import 'package:tech_adventure/data/models/minigame.dart';
import 'package:tech_adventure/data/models/user.dart';


class Place {
  int id;
  String name;
  User owner;
  Minigame minigame;
  String type;
  String image;
  String geometry;

  Place(this.id, this.name, this.owner, this.minigame, this.type, this.image, this.geometry);

}