import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:tech_adventure/ui/games/flappyBird/components/background.dart';
import 'package:tech_adventure/ui/games/flappyBird/components/bean.dart';
import 'package:tech_adventure/ui/games/flappyBird/components/floor.dart';
import 'package:tech_adventure/ui/games/flappyBird/components/pipe.dart';
import 'package:tech_adventure/ui/games/flappyBird/config.dart';

enum GameState { intial, playing, gameOver }

class FlappyBirdGame extends FlameGame with TapDetector {
  late Bean _bean;
  late Floor _floor;
  late Pipe _pipe1down;
  late Pipe _pipe1up;
  late Pipe _pipe2down;
  late Pipe _pipe2up;
  late List<Pipe> pipes;
  late double _maxOffset;
  late double _minOffset;

  GameState _gameState = GameState.intial;
  Function onGameOver;
  final tapToStartOverlayIdentifier = 'TapToStart';
  FlappyBirdGame(this.onGameOver);

  @override
  FutureOr<void> onLoad() async {
    var playArea = size.y - FlappyBeansDimensions.floorHeight;
    _minOffset = playArea - FlappyBeansDimensions.pipeSizeY;
    _maxOffset = FlappyBeansDimensions.pipeSizeY;

    final floorSprite = await Sprite.load("flappyBeans/fbs-04.png");
    final backgroundSprite = await Sprite.load("flappyBeans/fbs-49.png");
    final beanSprites = await Future.wait([1, 2, 3].map((i) => Sprite.load('flappyBeans/fbs-0$i.png')));
    final pipeUpSprite = await Sprite.load("flappyBeans/fbs-07.png");
    final pipeDownSprite = await Sprite.load("flappyBeans/fbs-08.png");

    _floor = Floor(floorSprite, size);
    final background = Background(backgroundSprite, size);
    _bean = Bean(beanSprites, size);
    _pipe1up = Pipe(pipeUpSprite, FlappyBeansDimensions.defaultPipeGap, 300, 1, size, PipeOrientation.up);
    _pipe1down = Pipe(pipeDownSprite, FlappyBeansDimensions.defaultPipeGap, 300, 1, size, PipeOrientation.down);

    _pipe2up = Pipe(pipeUpSprite, FlappyBeansDimensions.defaultPipeGap, 50, 2, size, PipeOrientation.up);
    _pipe2down = Pipe(pipeDownSprite, FlappyBeansDimensions.defaultPipeGap, 50, 2, size, PipeOrientation.down);

    pipes = [_pipe1down, _pipe1up, _pipe2down, _pipe2up];

    addAll([background, _pipe1down, _pipe2down, _floor, _bean, _pipe1up, _pipe2up]);

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
    if (_isGameOver()) {
      // _endGame();
      _resetGame();
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

  void _resetGame() {
    _gameState = GameState.intial;
    for (var pipe in pipes) {
      pipe.resetPosition();
    }
    _bean.resetPosition();
    overlays.add(tapToStartOverlayIdentifier);
  }

  void _endGame() {
    _gameState = GameState.gameOver;
    removeFromParent();
    onGameOver();
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
    return intersectedRect.width > 0 && intersectedRect.height > 0;
  }
}
