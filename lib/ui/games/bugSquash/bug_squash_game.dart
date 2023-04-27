import 'dart:async';
import 'dart:ui';

import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:tech_adventure/ui/games/bugSquash/components/background.dart';
import 'package:tech_adventure/ui/games/bugSquash/components/bug.dart';

class BugSquashGame extends FlameGame {
  int score = 0;
  double count = 0;
  late TextComponent scoreDisplay;
  final Function(int score) onGameFinished;

  BugSquashGame(this.onGameFinished);

  @override
  FutureOr<void> onLoad() async {
    final imagesLoader = Images();
    final image = await imagesLoader.load('bugSquash/background.png');
    final backgroundSprite = Sprite(image);
    final background = Background(backgroundSprite, size);
    scoreDisplay = TextComponent(
        text: "0",
        textRenderer: TextPaint(
          style: TextStyle(fontSize: 48.0, color: Colors.black),
        ),
        size: Vector2(50, 50),
        position: Vector2(size.x - 50, size.y - 50));
    addAll([background]);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    count += dt;
    if (count > (1 - (score * .02))) {
      count = 0;
      final circle = Bug(size, () => score++, () => endGame());
      add(circle);
    }
    super.update(dt);
  }

  void endGame() {
    onGameFinished(score);
  }
}
