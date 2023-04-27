import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:tech_adventure/ui/games/dice/managers/dice_game_manager.dart';
import 'package:tech_adventure/ui/games/dice/sprites/die.dart';
import 'package:tech_adventure/ui/screens/scan_screen.dart';

class RollDiceGame extends FlameGame with HasTappables {
  RollDiceGame(this.onGameFinished, {super.children});
  final Function(int score) onGameFinished;
  DiceGameManager gameManager = DiceGameManager();
  int screenBufferSpace = 30;

  List<Die> dice = [];

  @override
  Future<void> onLoad() async {
    await add(gameManager);
  }

  @override
  Future<void> update(double dt) async {
    super.update(dt);

    if (gameManager.isIntro) {
      overlays.add('startOverlay');
      return;
    }

    if (gameManager.isPlaying) {
      if (dice.every((die) => die.value > 0)) {
        await Future.delayed(const Duration(milliseconds: 1500));
        endGame();
        //  TODO: send score
      }
    }
  }

  @override
  Color backgroundColor() {
    return Colors.orange.shade100;
  }

  void initializeGameStart() {
    initializeDice();
    gameManager.reset();
  }

  void initializeDice() {
    dice = [Die(), Die(), Die()];

    final Vector2 screenCenter = size / 2;
    final double diceWidth = (dice[0].width) * 3;
    final double diceGap = (size.x - diceWidth) / 6;

    for (var i = 0; i < 3; i++) {
      final die = dice[i];
      die.position = Vector2((diceGap * 2) + (i * (die.width + diceGap)), screenCenter.y);
    }

    addAll(dice);
  }

  void startGame() {
    initializeGameStart();
    gameManager.state = GameState.playing;
    overlays.remove('startOverlay');
  }

  void endGame() {
    gameManager.state = GameState.gameOver;
    overlays.add('gameOverOverlay');
    onGameFinished(gameManager.score.value);
  }

  void resetGame() {
    removeAll(dice);
    startGame();
    overlays.remove('gameOverOverlay');
  }

  void togglePauseState() {
    if (paused) {
      resumeEngine();
    } else {
      pauseEngine();
    }
  }
}
