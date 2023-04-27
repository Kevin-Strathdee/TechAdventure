import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:tech_adventure/ui/games/flappyBean/flappy_bean_game.dart';
import 'package:tech_adventure/ui/screens/home_page.dart';

import '../widgets/flappyBean/game_over_overlay.dart';

class FlappyBeanScreen extends StatefulWidget {
  const FlappyBeanScreen({super.key});

  @override
  State<FlappyBeanScreen> createState() => _FlappyBeanScreenState();
}

class _FlappyBeanScreenState extends State<FlappyBeanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GameWidget(
            overlayBuilderMap: {
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
        },
            game: FlappyBeanGame(
              () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage())),
            )));
  }
}
