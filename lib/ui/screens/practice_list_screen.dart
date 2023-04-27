import 'package:flutter/material.dart';
import 'package:tech_adventure/data/models/minigame.dart';
import 'package:tech_adventure/ui/widgets/game_information_tile.dart';

class PracticeListScreen extends StatelessWidget {
  const PracticeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: ListView(
        children: [
          Text("Games", style: Theme.of(context).textTheme.displayMedium),
          ...[minigameIdentifierDice, minigameIdentifierFlappy, minigameIdentifierSquash]
              .map((e) => GameInformationTile(game: e))
        ],
      ),
    );
  }
}
