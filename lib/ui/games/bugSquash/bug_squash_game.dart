import 'dart:async';
import 'dart:ui';

import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:japomo/ui/games/bugSquash/components/background.dart';
import 'package:japomo/ui/games/bugSquash/components/bug.dart';

class BugSquashGame extends FlameGame {
  bool _gameover = false;
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
          style: TextStyle(fontSize: 48.0, color: Colors.white),
        ),
        size: Vector2(50, 50),
        position: Vector2(size.x - 80, 50));
    addAll([background, scoreDisplay]);
    return super.onLoad();
  }

  void _incrementScore() {
    score++;
    scoreDisplay.text = score.toString();
  }

  @override
  void update(double dt) {
    if (_gameover) return;
    count += dt;
    if (count > (1 - (score * .02))) {
      count = 0;
      final circle = Bug(size, () => score++, () => endGame());
      add(circle);
    }
    super.update(dt);
  }

  void endGame() {
    _gameover = true;
    onGameFinished(score);
  }
}
