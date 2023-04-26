import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:tech_adventure/ui/games/flappyBird/game.dart';
import 'package:tech_adventure/ui/screens/home_page.dart';

class FlappyBirdScreen extends StatefulWidget {
  const FlappyBirdScreen({super.key});

  @override
  State<FlappyBirdScreen> createState() => _FlappyBirdScreenState();
}

class _FlappyBirdScreenState extends State<FlappyBirdScreen> {
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
          }
        },
            game: FlappyBirdGame(
              () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage())),
            )));
  }
}
