import 'package:flutter/material.dart';
import 'package:japomo/generated/l10n.dart';
import 'package:japomo/ui/games/flappyBean/flappy_bean_game.dart';

class GameOverOverlay extends StatelessWidget {
  const GameOverOverlay({super.key, required this.game});
  final FlappyBeanGame game;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    S.of(context).gameOverOverviewTitle,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    S.of(context).gameOverOverviewMessage(game.score, game.highScore),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(onPressed: () => (game).resetGame(), child: const Text("Try Again")),
                      const SizedBox(
                        width: 40,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            (game).endGame();
                          },
                          child: const Text("Submit")),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
