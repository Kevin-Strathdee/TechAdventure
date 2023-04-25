class Minigame {
  String type;
  int score;

  Minigame(this.type, this.score);

  Minigame.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        score = json['score'];
}
