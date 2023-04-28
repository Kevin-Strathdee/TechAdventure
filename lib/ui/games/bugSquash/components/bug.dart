import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flutter/material.dart';
import 'package:japomo/ui/games/bugSquash/config.dart';

class Bug extends SpriteAnimationComponent with TapCallbacks {
  Bug(this.sprites, this.screenSize, this.onTapped, this.onReachedEdge, this.difficulty)
      : super(
          size: Vector2.all(BugsquashConfig.bugSize),
          animation: SpriteAnimation.spriteList(
            sprites,
            stepTime: .2,
          ),
          position: _getRandomSpawnPosition(screenSize),
        );
  final Vector2 screenSize;
  final Function onTapped;
  final Function onReachedEdge;
  final List<Sprite> sprites;
  final int difficulty;
  double count = 0;
  double xDir = .5 - Random().nextDouble();
  double yDir = .5 - Random().nextDouble();
  double elapsed = 0;

  @override
  void onTapDown(TapDownEvent event) {
    onTapped();
    removeFromParent();
    super.onTapDown(event);
  }

  @override
  void update(double dt) {
    elapsed += dt;
    if (elapsed < BugsquashConfig.gameSpeed) {
      return;
    }
    elapsed = 0;
    final speed = ((difficulty + 1) / 4) * BugsquashConfig.bugSpeed;
    position.x += xDir * speed;
    position.y += yDir * speed;

    position.x = max(min(position.x, screenSize.x - width), 0);
    position.y = max(min(position.y, screenSize.y - height), 0);

    if (isTouchingEdge()) {
      onReachedEdge();
      removeFromParent();
    }
    super.update(dt);
  }

  bool isTouchingEdge() {
    const buffer = 0;
    final touchingRight = position.x - buffer >= (screenSize.x - width);
    final touchingBottom = position.y - buffer >= (screenSize.y - height);
    final touchingLeft = position.x <= -buffer;
    final touchingTop = position.y <= -buffer;
    return touchingLeft || touchingTop || touchingRight || touchingBottom;
  }
}

Vector2 _getRandomSpawnPosition(Vector2 screenSize) {
  final xMin = (screenSize.x / 3) + (BugsquashConfig.bugSize / 2);
  final xPos = (Random().nextDouble() * (screenSize.x / 3)) + xMin;

  final yMin = (screenSize.y / 3) + BugsquashConfig.bugSize / 2;
  final yPos = (Random().nextDouble() * (screenSize.y / 3)) + yMin;

  return Vector2(xPos, yPos);
}
