const String minigameIdentifierDice = "dice";
const String minigameIdentifierFlappy = "flappy";
const String minigameIdentifierSquash = "bugsquash";

class Minigame {
  String type;
  int score;

  Minigame(this.type, this.score);

  Minigame.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        score = json['score'];
}
