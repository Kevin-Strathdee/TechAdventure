import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:tech_adventure/ui/games/dice/overlays/start_overlay.dart';
import 'package:tech_adventure/ui/games/dice/roll_dice_game.dart';

import '../games/dice/overlays/game_over_overlay.dart';

class DiceScreen extends StatelessWidget {
  const DiceScreen(this.onGameFinished, {super.key});
  final Function(int score) onGameFinished;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 800,
        minWidth: 550,
      ),
      child: GameWidget(
        game: RollDiceGame(onGameFinished),
        overlayBuilderMap: <String, Widget Function(BuildContext, Game)>{
          'startOverlay': (context, game) => StartOverlay(game),
          'gameOverOverlay': (context, game) => GameOverOverlay(game),
        },
      ),
    );
  }
}
