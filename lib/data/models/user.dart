import 'package:tech_adventure/data/models/place.dart';

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

  User(this.id, this.email, this.userName, this.firstName, this.lastName,
      this.places, this.image, this.score);

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'],
        userName = json['userName'],
        firstName = json['firstName'],
        lastName = json['lastName'],
        places = json['places'],
        image = json['image'],
        score = json['score'];
}
