import 'package:flutter/material.dart';
import 'package:japomo/data/models/minigame.dart';
import 'package:japomo/ui/widgets/game_information_tile.dart';

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
