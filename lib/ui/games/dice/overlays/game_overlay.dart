import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:tech_adventure/ui/games/dice/roll_dice_game.dart';

class GameOverlay extends StatefulWidget {
  const GameOverlay(this.game, {super.key});

  final Game game;

  @override
  State<GameOverlay> createState() => GameOverlayState();
}

class GameOverlayState extends State<GameOverlay> {
  bool isPaused = false;
  // Mobile Support: Add isMobile boolean

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          // Positioned(
          //   top: 30,
          //   left: 30,
          //   child: ScoreDisplay(game: widget.game),
          // ),
          Positioned(
            top: 30,
            right: 30,
            child: ElevatedButton(
              child: isPaused
                  ? const Icon(
                      Icons.play_arrow,
                      size: 48,
                    )
                  : const Icon(
                      Icons.pause,
                      size: 48,
                    ),
              onPressed: () {
                (widget.game as RollDiceGame).togglePauseState();
                setState(
                  () {
                    isPaused = !isPaused;
                  },
                );
              },
            ),
          ),
          // Mobile Support: Add on-screen left & right directional buttons
          if (isPaused)
            Positioned(
              top: MediaQuery.of(context).size.height / 2 - 72.0,
              right: MediaQuery.of(context).size.width / 2 - 72.0,
              child: const Icon(
                Icons.pause_circle,
                size: 144.0,
                color: Colors.black12,
              ),
            ),
          if (!isPaused)
            Positioned(
              top: 78,
              left: 0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 78,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: Material(
                    color: Colors.transparent,
                  )
                )
              )
            ),
          // GestureDetector(
          //     behavior: HitTestBehavior.translucent
          // )
        ],
      ),
    );
  }
}
