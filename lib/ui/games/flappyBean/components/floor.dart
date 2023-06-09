import 'package:flame/components.dart';
import 'package:japomo/ui/games/flappyBean/config.dart';

class Floor extends SpriteComponent {
  Floor(Sprite sprite, Vector2 screenSize)
      : super(
            size: Vector2(screenSize.x, FlappyBeansDimensions.floorHeight),
            sprite: sprite,
            position: Vector2(0, screenSize.y - FlappyBeansDimensions.floorHeight));
}
