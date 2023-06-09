import 'package:japomo/data/models/geometry.dart';
import 'package:japomo/data/models/minigame.dart';
import 'package:japomo/data/models/user.dart';
import 'package:japomo/graphql/generated/graphql_api.dart';

class Place {
  String id;
  String name;
  User? owner;
  Minigame minigame;
  String? image;
  Geometry geometry;

  Place(
      this.id, this.name, this.owner, this.minigame, this.image, this.geometry);

  Place.fromGraphqlPlace(Place$RootQueryType$Place place)
      : id = place.id,
        name = place.name,
        minigame = Minigame(place.minigame.type, place.minigame.score),
        owner = place.owner != null
            ? User.fromGraphqlPlaceUserWithoutUserPlaces(place.owner!)
            : null,
        image = place.image,
        geometry = Geometry(Map.MUNICH_4, place.geometry?.x, place.geometry?.y);

  Place.fromGraphqlMinigameOutcomePlace(
      MinigameOutcome$RootMutationType$MinigameOutcome$Place place)
      : id = place.id,
        name = place.name,
        minigame = Minigame(place.minigame.type, place.minigame.score),
        owner = place.owner != null
            ? User.fromGraphqlMinigameOutcomePlaceUserWithoutUserPlaces(
                place.owner!)
            : null,
        image = place.image,
        geometry = Geometry(Map.MUNICH_4, place.geometry?.x, place.geometry?.y);
}
