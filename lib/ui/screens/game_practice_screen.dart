import 'package:flutter/material.dart';
import 'package:tech_adventure/data/models/minigame.dart';
import 'package:tech_adventure/ui/screens/bug_squash_screen.dart';
import 'package:tech_adventure/ui/screens/dice_screen.dart';
import 'package:tech_adventure/ui/screens/flappy_bean_screen.dart';

class GamePracticeScreen extends StatefulWidget {
  const GamePracticeScreen({super.key, required this.game});
  final String game;

  @override
  State<GamePracticeScreen> createState() => _GamePracticeScreenState();
}

class _GamePracticeScreenState extends State<GamePracticeScreen> {
  late String game;

  @override
  void initState() {
    super.initState();
    game = widget.game;
  }

  @override
  Widget build(BuildContext context) {
    void reportGameScore(int score) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Game Over"),
                content: Text("Your score was $score. Would you like to try again?"),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();

                        setState(() {
                          game = "";
                        });
                        setState(() {
                          game = widget.game;
                        });
                      },
                      child: Text("Yes")),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      child: Text("No"))
                ],
              ));
    }

    switch (widget.game) {
      case minigameIdentifierFlappy:
        return FlappyBeanScreen(reportGameScore);
      case minigameIdentifierDice:
        return DiceScreen(reportGameScore);
      case minigameIdentifierSquash:
        return BugSquashScreen(reportGameScore);
      default:
        return Container();
    }
  }
}
