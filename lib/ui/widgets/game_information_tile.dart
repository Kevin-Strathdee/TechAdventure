import 'package:flutter/material.dart';
import 'package:japomo/data/models/minigame.dart';
import 'package:japomo/ui/screens/game_practice_screen.dart';

class GameInformationTile extends StatelessWidget {
  const GameInformationTile({super.key, required this.game});
  final String game;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => GamePracticeScreen(game: game)));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _getNameForGame(game),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      _getDescriptionForGame(game),
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
              const Center(
                  child: Icon(
                Icons.play_arrow_rounded,
                size: 40,
              ))
            ],
          ),
        ),
      ),
    );
  }

  String _getNameForGame(String game) {
    switch (game) {
      case minigameIdentifierDice:
        return "Dice";
      case minigameIdentifierFlappy:
        return 'Flappy Bean';
      case minigameIdentifierSquash:
        return "Bug Squash";
      default:
        return 'Name';
    }
  }

  String _getDescriptionForGame(String game) {
    switch (game) {
      case minigameIdentifierDice:
        return "Roll 3 dice and aim for the highest combine score.";
      case minigameIdentifierFlappy:
        return 'Tap the screen to flap your way through as many pipes as possible. Highest score wins!';
      case minigameIdentifierSquash:
        return "Tap the bugs to squash as many as possible and score points. The game ends when the first bug touches the side";
      default:
        return 'Name';
    }
  }
}
