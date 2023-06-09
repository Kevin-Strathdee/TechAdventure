import 'dart:math';

import 'package:flame/components.dart';
import 'package:japomo/ui/games/flappyBean/config.dart';

class Bean extends SpriteAnimationComponent {
  double _speed = FlappyBeansDimensions.flapPower;
  late double _bottom;
  bool shouldMove = false;
  double elapsed = 0;

  Bean(List<Sprite> sprites, Vector2 screenSize)
      : super(
            size: Vector2.all(FlappyBeansDimensions.beanSize),
            animation: SpriteAnimation.spriteList(
              sprites,
              stepTime: .05,
            ),
            position: Vector2(FlappyBeansDimensions.beanStartX, FlappyBeansDimensions.beanStarty)) {
    _bottom = screenSize.y - FlappyBeansDimensions.floorHeight - FlappyBeansDimensions.beanSize + 5;
  }

  void fly() {
    _speed = FlappyBeansDimensions.flapPower;
  }

  void resetPosition() {
    position = Vector2(FlappyBeansDimensions.beanStartX, FlappyBeansDimensions.beanStarty);
    shouldMove = false;
    _speed = FlappyBeansDimensions.flapPower;
  }

  @override
  void update(double dt) {
    elapsed += dt;
    if (elapsed < FlappyBeansDimensions.gameSpeed) return;
    elapsed = 0;
    if (!shouldMove) return;
    _speed = max(_speed - FlappyBeansDimensions.gravity, FlappyBeansDimensions.terminalVelocity);
    position.y = max(min(_bottom + 10, position.y - _speed), 0);
    super.update(dt);
  }
}
