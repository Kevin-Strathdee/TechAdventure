import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flutter/material.dart';
import 'package:japomo/ui/games/bugSquash/config.dart';

class Bug extends CircleComponent with TapCallbacks {
  Bug(this.screenSize, this.onTapped, this.onReachedEdge)
      : super(
            radius: BugsquashConfig.bugSize,
            position: _getRandomSpawnPosition(screenSize),
            paint: Paint()..color = Colors.red);
  final Vector2 screenSize;
  final Function onTapped;
  final Function onReachedEdge;

  double count = 0;
  double xDir = .5 - Random().nextDouble();
  double yDir = .5 - Random().nextDouble();

  @override
  void onTapDown(TapDownEvent event) {
    onTapped();
    removeFromParent();
    super.onTapDown(event);
  }

  @override
  void update(double dt) {
    position.x += xDir * BugsquashConfig.bugSpeed;
    position.y += yDir * BugsquashConfig.bugSpeed;

    position.x = max(min(position.x, screenSize.x - width), 0);
    position.y = max(min(position.y, screenSize.y - height), 0);

    if (isTouchingEdge()) {
      onReachedEdge();
      removeFromParent();
    }
    super.update(dt);
  }

  bool isTouchingEdge() {
    final touchingRight = position.x >= (screenSize.x - width);
    final touchingBottom = position.y >= (screenSize.y - height);
    final touchingLeft = position.x <= 0;
    final touchingTop = position.y <= 0;
    return touchingLeft || touchingTop || touchingRight || touchingBottom;
  }
}

Vector2 _getRandomSpawnPosition(Vector2 screenSize) {
  final xMin = screenSize.x / 4 + BugsquashConfig.bugSize / 2;
  final xPos = (Random().nextDouble() * (screenSize.x / 2)) + xMin;

  final yMin = screenSize.y / 4 + BugsquashConfig.bugSize / 2;
  final yPos = (Random().nextDouble() * (screenSize.y / 2)) + yMin;

  return Vector2(xPos, yPos);
}
