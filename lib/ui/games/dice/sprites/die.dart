import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:tech_adventure/ui/games/dice/roll_dice_game.dart';


enum DieState {
  die1,
  die2,
  die3,
  die4,
  die5,
  die6,
  rolling,
}

class Die extends SpriteGroupComponent<DieState>
    with HasGameRef<RollDiceGame>, Tappable {
  Die() : super(
    size: Vector2.all(80),
    anchor: Anchor.centerLeft,
    priority: 1,
  );

  int value = 0;
  SpriteAnimationComponent? rollingAnimation;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    await _loadSprites();
    current = DieState.die1;
  }

  @override
  void update(double dt) {
    if (gameRef.gameManager.isIntro || gameRef.gameManager.isGameOver) return;

    if (current == DieState.rolling) {
      rollingAnimation?.update(dt);
    }

    super.update(dt);
  }

  @override
  bool onTapDown(TapDownInfo info) {
    if (value == 0 && current != DieState.rolling) {
      current = DieState.rolling;

      Future.delayed(const Duration(milliseconds: 2000), () {
        int dieIndex = Random().nextInt(6);
        value = dieIndex + 1;
        print("new value: $value");
        current = DieState.values[dieIndex];
        gameRef.gameManager.increaseScore(value);
      });
      return true;
    }
    return false;
  }

  @override
  void render(Canvas canvas) {
    if (current == DieState.rolling && rollingAnimation != null) {
      rollingAnimation?.render(canvas);
    } else {
      super.render(canvas);
    }
  }

  void reset() {
    current = DieState.die1;
  }

  Future<void> _loadSprites() async {
    final viewSize = Vector2.all(80);
    final spriteSize = Vector2.all(178.0);
    final spriteSheet = SpriteSheet.fromColumnsAndRows(
        image: await Flame.images.load('game/dice-roll.png'),
        columns: 4,
        rows: 8
    );
    // Load & configure sprite assets
    final die1 = spriteSheet.getSprite(3, 3);
    final die2 = spriteSheet.getSprite(0, 3);
    final die3 = spriteSheet.getSprite(6, 3);
    final die4 = spriteSheet.getSprite(4, 3);
    final die5 = spriteSheet.getSprite(2, 3);
    final die6 = spriteSheet.getSprite(5, 3);

    sprites = <DieState, Sprite>{
      DieState.die1: die1,
      DieState.die2: die2,
      DieState.die3: die3,
      DieState.die4: die4,
      DieState.die5: die5,
      DieState.die6: die6,
    };

    final animation = await gameRef.loadSpriteAnimation(
        'game/dice-roll.png',
        SpriteAnimationData.sequenced(
          amount: 32,
          stepTime: 0.075,
          textureSize: spriteSize,
          amountPerRow: 4,
        )
    );
    rollingAnimation = SpriteAnimationComponent(
      animation: animation,
      size: viewSize,
    );
  }
}
