import 'package:tech_adventure/data/models/geometry.dart';
import 'package:tech_adventure/data/models/minigame.dart';
import 'package:tech_adventure/data/models/user.dart';
import 'package:tech_adventure/graphql/generated/graphql_api.dart';

class Place {
  String id;
  String name;
  User? owner;
  Minigame minigame;
  String? image;
  Geometry geometry;

  Place(this.id, this.name, this.owner, this.minigame, this.image, this.geometry);

  //TODO
  Place.fromGraphqlPlace(Place$RootQueryType$Place place)
      : id = place.id,
        name = place.name,
        minigame = Minigame(place.minigame.type, place.minigame.score),
        owner = place.owner != null ? User.fromGraphqlPlaceUser(place.owner as Place$RootQueryType$Place$User) : null,
        image = place.image,
        geometry = Geometry(Map.MUNICH_4, place.geometry?.x, place.geometry?.y);
}
