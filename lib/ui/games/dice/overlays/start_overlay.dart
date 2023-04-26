import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../roll_dice_game.dart';
import '../sprites/die.dart';

// Overlay that appears for the main menu
class StartOverlay extends StatefulWidget {
  const StartOverlay(this.game, {super.key});

  final Game game;

  @override
  State<StartOverlay> createState() => _StartOverlayState();
}

class _StartOverlayState extends State<StartOverlay> {

  @override
  Widget build(BuildContext context) {
    RollDiceGame game = widget.game as RollDiceGame;

    return LayoutBuilder(builder: (context, constraints) {

      final TextStyle titleStyle = (constraints.maxWidth > 830)
          ? Theme.of(context).textTheme.displayLarge!
          : Theme.of(context).textTheme.displaySmall!;

      // 760 is the smallest height the browser can have until the
      // layout is too large to fit.
      final bool screenHeightIsSmall = constraints.maxHeight < 760;

      return Material(
        color: Theme.of(context).colorScheme.background,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Roll the dice!',
                      style: titleStyle.copyWith(
                        height: .8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 50),
                    const Align(
                      alignment: Alignment.center,
                      child: Image(image: AssetImage('assets/images/game/dice-pair-icon.png'), height: 250,),
                    ),
                    const WhiteSpace(height: 50),
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          game.startGame();
                        },
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                            const Size(100, 50),
                          ),
                          textStyle: MaterialStateProperty.all(
                              Theme.of(context).textTheme.titleLarge),
                        ),
                        child: const Text('Start'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

class WhiteSpace extends StatelessWidget {
  const WhiteSpace({super.key, this.height = 100});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
