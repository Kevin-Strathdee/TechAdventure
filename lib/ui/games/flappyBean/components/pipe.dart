import 'package:flame/components.dart';
import 'package:japomo/ui/games/flappyBean/config.dart';

enum PipeOrientation { up, down }

class Pipe extends SpriteComponent {
  Pipe(Sprite sprite, this.gap, this.offset, this.order, this.screenSize, this.orientation)
      : super(
            sprite: sprite,
            size: Vector2(FlappyBeansDimensions.pipeSizeX, FlappyBeansDimensions.pipeSizeY),
            position: _getPosition(offset, gap, order, orientation, screenSize));
  final Vector2 screenSize;
  bool shouldMove = false;
  final int order;
  final PipeOrientation orientation;
  double offset;
  final double gap;
  double speed = FlappyBeansDimensions.gameSpeed;
  bool crossed = false;

  startPosition() => _getPosition(offset, gap, order, orientation, screenSize);

  void resetPosition() {
    position = startPosition();
    shouldMove = false;
    speed = FlappyBeansDimensions.gameSpeed;
  }

  void speedUp() {
    speed++;
  }

  @override
  void update(double dt) {
    if (!shouldMove) return;
    position.x -= speed;
    if (position.x < -FlappyBeansDimensions.pipeSizeX) {
      position.x += screenSize.x * 2;
      crossed = false;
    }
    super.update(dt);
  }
}

Vector2 _getPosition(double offset, double gap, int order, PipeOrientation orientation, Vector2 screenSize) {
  var xPos = screenSize.x + (screenSize.x * order);
  if (orientation == PipeOrientation.up) {
    return Vector2(xPos, 0 - (FlappyBeansDimensions.pipeSizeY - offset));
  } else {
    return Vector2(xPos, offset + gap);
  }
}
