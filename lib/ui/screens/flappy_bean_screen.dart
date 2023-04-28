import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japomo/bloc/place/place_bloc.dart';
import 'package:japomo/data/models/geometry.dart';
import 'package:japomo/data/models/minigame.dart';
import 'package:japomo/data/models/place.dart';
import 'package:japomo/data/models/user.dart';
import 'package:japomo/ui/games/flappyBean/flappy_bean_game.dart';
import 'package:japomo/ui/screens/game_screen.dart';
import 'package:japomo/ui/screens/home_page.dart';

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
