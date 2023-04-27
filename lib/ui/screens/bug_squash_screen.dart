import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:tech_adventure/ui/games/bugSquash/bug_squash_game.dart';

class BugSquashScreen extends StatelessWidget {
  const BugSquashScreen(
    this.onGameFinished, {
    super.key,
  });
  final Function(int score) onGameFinished;
  @override
  Widget build(BuildContext context) {
    return GameWidget(game: BugSquashGame(onGameFinished));
  }
}
