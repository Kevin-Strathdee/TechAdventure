import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_adventure/bloc/place/place_bloc.dart';
import 'package:tech_adventure/data/models/geometry.dart';
import 'package:tech_adventure/data/models/minigame.dart';
import 'package:tech_adventure/data/models/place.dart';
import 'package:tech_adventure/data/models/user.dart';
import 'package:tech_adventure/ui/games/flappyBean/flappy_bean_game.dart';
import 'package:tech_adventure/ui/screens/game_screen.dart';
import 'package:tech_adventure/ui/screens/home_page.dart';

import '../widgets/flappyBean/game_over_overlay.dart';

class FlappyBeanScreen extends StatelessWidget {
  const FlappyBeanScreen(this.onGameFinished, {super.key});
  final Function(int score) onGameFinished;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GameWidget(overlayBuilderMap: {
      'TapToStart': (context, game) {
        return Center(
            child: Text(
          'Tap to Start!',
          style: Theme.of(context).textTheme.displaySmall,
        ));
      },
      'GameOver': (context, game) {
        return GameOverOverlay(game: game as FlappyBeanGame);
      }
    }, game: FlappyBeanGame(onGameFinished)));
  }
}
