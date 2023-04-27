import 'package:tech_adventure/data/models/place.dart';
import 'package:tech_adventure/graphql/generated/graphql_api.graphql.dart';

class User {
  int id;
  String email;
  String userName;
  List<Place> places;
  int score;

  User(this.id, this.email, this.userName, this.places, this.score);

  User.fromGraphqlUser(User$RootQueryType$User user)
      : id = int.parse(user.id),
        email = user.email,
        userName = user.username,
        //TODO
        places = [],
        score = user.score;
  User.fromGraphqlPlaceUser(Place$RootQueryType$Place$User user)
      : id = int.parse(user.id),
        email = user.email,
        userName = user.username,
        //TODO
        places = [],
        score = user.score;

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'],
        userName = json['userName'],
        places = json['places'],
        score = json['score'];
}
