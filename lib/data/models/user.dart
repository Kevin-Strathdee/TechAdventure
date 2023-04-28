import 'package:japomo/data/models/place.dart';
import 'package:japomo/graphql/generated/graphql_api.graphql.dart';

import 'geometry.dart';
import 'minigame.dart';

class User {
  int id;
  String email;
  String userName;
  String name;
  List<Place> places;
  int score;

  User(this.id, this.email, this.name, this.userName, this.places, this.score);

  User.fromGraphqlUser(User$RootQueryType$User user)
      : id = int.parse(user.id),
        email = user.email,
        userName = user.username,
        name = user.name,
        places = user.places.map((e) => fromGraphqlUserPlace(e)).toList(),
        score = user.score;

  User.fromGraphqlPlaceUserWitoutUserPlaces(Place$RootQueryType$Place$User user)
      : id = int.parse(user.id),
        email = user.email,
        userName = user.username,
        name = user.name,
        //set places empty because it is not relevant in this context
        places = [],
        score = user.score;

  User.fromGraphqlMinigameOutcomePlaceUserWithoutUserPlaces(
      MinigameOutcome$RootMutationType$MinigameOutcome$Place$User user)
      : id = int.parse(user.id),
        email = user.email,
        userName = user.username,
        name = user.name,
        //set places empty because it is not relevant in this context
        places = [],
        score = user.score;

  static Place fromGraphqlUserPlace(User$RootQueryType$User$Place place) {
    return Place(
        place.id,
        place.name,
        null,
        Minigame(place.minigame.type, place.minigame.score),
        place.image,
        Geometry(mapMapLayer(place.geometry?.mapLayer), place.geometry?.x,
            place.geometry?.y));
  }

  static Map mapMapLayer(MapLayer? mapLayer) {
    return Map.values.firstWhere((element) => element.value == mapLayer?.name);
  }
}
