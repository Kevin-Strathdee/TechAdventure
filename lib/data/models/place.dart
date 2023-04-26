import 'package:tech_adventure/data/models/geometry.dart';
import 'package:tech_adventure/data/models/minigame.dart';
import 'package:tech_adventure/data/models/user.dart';
import 'package:tech_adventure/graphql/generated/graphql_api.dart';

class Place {
  int id;
  String name;
  User owner;
  Minigame minigame;
  String type;
  String? image;
  Geometry geometry;

  Place(this.id, this.name, this.owner, this.minigame, this.type, this.image,
      this.geometry);

  //TODO
  Place.fromGraphqlPlace(Place$RootQueryType$Place place)
      : id = int.parse(place.id),
        name = place.name,
        minigame = Minigame(place.minigame.type, place.minigame.score),
        owner = User.fromGraphqlUser(place.owner as User$RootQueryType$User),
        type = place.type,
        image = place.image,
        geometry =
            Geometry(Map.MUNICH_4TH, place.geometry?.x, place.geometry?.y);
}
