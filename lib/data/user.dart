import 'package:tech_adventure/data/place.dart';

class User {
  int id;
  String email;
  String userName;
  String firstName;
  String lastName;
  List<Place> places;
  //image url
  String image;
  int score;

  User(this.id, this.email, this.userName, this.firstName, this.lastName, this.places, this.image, this.score);
}