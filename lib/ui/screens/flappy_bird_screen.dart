import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:tech_adventure/ui/games/flappyBird/game.dart';
import 'package:tech_adventure/ui/screens/home_page.dart';

class FlappyBirdScreen extends StatelessWidget {
  const FlappyBirdScreen({super.key});

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
        },
            game: FlappyBirdGame(
                () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage())))));
  }
}
