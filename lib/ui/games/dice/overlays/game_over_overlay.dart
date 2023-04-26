import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:tech_adventure/ui/games/dice/roll_dice_game.dart';

class GameOverOverlay extends StatelessWidget {
  const GameOverOverlay(this.game, {super.key});

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.background,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Jackpot!',
                style: Theme.of(context).textTheme.displayMedium!.copyWith(),
              ),
              const SizedBox(height: 50),
              ValueListenableBuilder<int>(
                  valueListenable: (game as RollDiceGame).gameManager.score,
                  builder: (context, score, child) =>
                      Text(
                        "Your score: $score",
                        style: Theme.of(context).textTheme.headlineMedium,
                      )
              ),
              // Text(
              //   'Your score: ${(game as RollDiceGame).gameManager.score..value}',
              //   style: Theme.of(context).textTheme.headlineMedium,
              // ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  (game as RollDiceGame).resetGame();
                },
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                    const Size(200, 75),
                  ),
                  textStyle: MaterialStateProperty.all(
                      Theme.of(context).textTheme.titleLarge),
                ),
                child: const Text('Play Again'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
