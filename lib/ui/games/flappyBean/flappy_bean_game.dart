import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:tech_adventure/ui/games/flappyBean/components/background.dart';
import 'package:tech_adventure/ui/games/flappyBean/components/bean.dart';
import 'package:tech_adventure/ui/games/flappyBean/components/floor.dart';
import 'package:tech_adventure/ui/games/flappyBean/components/pipe.dart';
import 'package:tech_adventure/ui/games/flappyBean/config.dart';

enum GameState { intial, playing, gameOver }

class FlappyBeanGame extends FlameGame with TapDetector {
  late Bean _bean;
  late Floor _floor;
  late Pipe _pipe1down;
  late Pipe _pipe1up;
  late Pipe _pipe2down;
  late Pipe _pipe2up;
  late List<Pipe> pipes;
  late TextComponent _score;

  late double _maxOffset;
  late double _minOffset;
  int score = 0;
  int highScore = 0;
  GameState _gameState = GameState.intial;
  Function onGameOver;
  final tapToStartOverlayIdentifier = 'TapToStart';
  FlappyBeanGame(this.onGameOver);

  @override
  FutureOr<void> onLoad() async {
    var playArea = size.y - FlappyBeansDimensions.floorHeight;
    _minOffset = playArea - FlappyBeansDimensions.pipeSizeY - FlappyBeansDimensions.defaultOffset;
    _maxOffset = min(FlappyBeansDimensions.pipeSizeY, playArea - FlappyBeansDimensions.defaultPipeGap - 50);

    final floorSprite = await Sprite.load("flappyBeans/fbs-04.png");
    final backgroundSprite = await Sprite.load("flappyBeans/fbs-49.png");
    final beanSprites = await Future.wait([1, 2, 3].map((i) => Sprite.load('flappyBeans/fbs-0$i.png')));
    final pipeUpSprite = await Sprite.load("flappyBeans/fbs-07.png");
    final pipeDownSprite = await Sprite.load("flappyBeans/fbs-08.png");

    _floor = Floor(floorSprite, size);
    final background = Background(backgroundSprite, size);
    _bean = Bean(beanSprites, size);

    var pipe1offset = max(_minOffset, Random().nextDouble() * _maxOffset);
    var pipe2offset = max(_minOffset, Random().nextDouble() * _maxOffset);

    _pipe1up = Pipe(pipeUpSprite, FlappyBeansDimensions.defaultPipeGap, pipe1offset, 1, size, PipeOrientation.up);
    _pipe1down = Pipe(pipeDownSprite, FlappyBeansDimensions.defaultPipeGap, pipe1offset, 1, size, PipeOrientation.down);

    _pipe2up = Pipe(pipeUpSprite, FlappyBeansDimensions.defaultPipeGap, pipe2offset, 2, size, PipeOrientation.up);
    _pipe2down = Pipe(pipeDownSprite, FlappyBeansDimensions.defaultPipeGap, pipe2offset, 2, size, PipeOrientation.down);

    _score = TextComponent(
        text: "0",
        textRenderer: TextPaint(
          style: TextStyle(fontSize: 48.0, color: Colors.black),
        ),
        size: Vector2(50, 50),
        position: Vector2((size.x / 2) - 15, size.y - 100));

    pipes = [_pipe1down, _pipe1up, _pipe2down, _pipe2up];

    addAll([background, _pipe1down, _pipe2down, _floor, _bean, _pipe1up, _pipe2up, _score]);

    overlays.add(tapToStartOverlayIdentifier);

    return super.onLoad();
  }

  @override
  void onTap() {
    if (_gameState == GameState.intial) {
      _startGame();
    } else {
      _bean.fly();
    }
    super.onTap();
  }

  @override
  void update(double dt) {
    if (_gameState == GameState.gameOver) return;
    if ([_pipe1up, _pipe2up].any((pipe) => _checkIfBeanCrossedPipe(pipe))) {
      _incrementScore();
    }
    if (_isGameOver()) {
      _showGameOverOverlay();
    } else {
      super.update(dt);
    }
  }

  void _startGame() {
    _gameState = GameState.playing;
    for (var pipe in pipes) {
      pipe.shouldMove = true;
    }
    _bean.shouldMove = true;
    overlays.remove(tapToStartOverlayIdentifier);
  }

  void resetGame() {
    _gameState = GameState.intial;
    score = 0;
    _score.text = score.toString();

    var pipe1offset = max(_minOffset, Random().nextDouble() * _maxOffset);
    var pipe2offset = max(_minOffset, Random().nextDouble() * _maxOffset);

    _pipe1down.offset = pipe1offset;
    _pipe1up.offset = pipe1offset;
    _pipe2down.offset = pipe2offset;
    _pipe2up.offset = pipe2offset;

    for (var pipe in pipes) {
      pipe.resetPosition();
    }
    _bean.resetPosition();
    overlays.add(tapToStartOverlayIdentifier);
    overlays.remove("GameOver");
  }

  void endGame() {
    _gameState = GameState.gameOver;
    removeFromParent();
    onGameOver();
  }

  void _showGameOverOverlay() {
    _gameState = GameState.gameOver;
    overlays.add("GameOver");
  }

  void _incrementScore() {
    score++;
    highScore = max(highScore, score);
    _score.text = score.toString();
    if (score % 3 == 0) {
      for (var element in pipes) {
        element.speedUp();
      }
    }
  }

  bool _isGameOver() {
    // return false;
    final beanTouchesFloor = _check2ItemsCollision(_floor.toRect(), _bean.toRect());
    final beanTouchesPipe =
        pipes.map((pipe) => pipe.toRect()).any((pipeRect) => _check2ItemsCollision(pipeRect, _bean.toRect()));
    return beanTouchesFloor || beanTouchesPipe;
  }

  bool _check2ItemsCollision(Rect item1, Rect item2) {
    var intersectedRect = item1.intersect(item2);
    return intersectedRect.width > 5 && intersectedRect.height > 5;
  }

  bool _checkIfBeanCrossedPipe(Pipe pipe) {
    if (!pipe.crossed) {
      var rect = pipe.toRect();
      var pipeCenter = rect.left + rect.width / 2;
      var beanCenter = _bean.x + _bean.width / 2;
      if (pipeCenter < beanCenter) {
        pipe.crossed = true;
        return true;
      }
    }
    return false;
  }
}
