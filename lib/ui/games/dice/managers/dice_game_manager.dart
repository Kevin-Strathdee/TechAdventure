import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:japomo/ui/games/dice/roll_dice_game.dart';

class DiceGameManager extends Component with HasGameRef<RollDiceGame> {
  DiceGameManager();

  ValueNotifier<int> score = ValueNotifier(0);
  GameState state = GameState.intro;

  bool get isPlaying => state == GameState.playing;
  bool get isGameOver => state == GameState.gameOver;
  bool get isIntro => state == GameState.intro;

  void reset() {
    score.value = 0;
    state = GameState.intro;
  }

  void increaseScore(int value) {
    score.value += value;
  }
}

enum GameState { intro, playing, gameOver }
