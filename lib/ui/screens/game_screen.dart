import 'package:confetti/confetti.dart';
import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japomo/bloc/place/place_bloc.dart';
import 'package:japomo/data/models/minigame.dart';
import 'package:japomo/data/models/place.dart';
import 'package:japomo/theme/colors.dart';
import 'package:japomo/ui/screens/bug_squash_screen.dart';
import 'package:japomo/ui/screens/dice_screen.dart';
import 'package:japomo/ui/screens/flappy_bean_screen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen(this.place, {super.key});

  final Place place;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int score = 0;
  late ConfettiController _confettiController;

  @override
  void initState() {
    BlocProvider.of<PlaceBloc>(context).add(PlaceGameStarted(widget.place));
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 10));
  }

  Path drawCoffeeBean(Size size) {
    var path = Path();
    path.lineTo(size.width * 0.79, size.height * 0.02);
    path.cubicTo(size.width * 0.84, size.height * 0.07, size.width * 0.7, size.height * 0.27, size.width * 0.49, size.height * 0.49);
    path.cubicTo(size.width * 0.27, size.height * 0.71, size.width * 0.06, size.height * 0.84, size.width * 0.02, size.height * 0.79);
    path.cubicTo(-0.03, size.height * 0.75, 0, size.height * 0.43, size.width * 0.22, size.height * 0.22);
    path.cubicTo(size.width * 0.43, size.height * 0.01, size.width * 0.75, -0.03, size.width * 0.79, size.height * 0.02);
    path.cubicTo(size.width * 0.79, size.height * 0.02, size.width * 0.79, size.height * 0.02, size.width * 0.79, size.height * 0.02);
    path.lineTo(size.width / 5, size.height * 0.98);
    path.cubicTo(size.width * 0.16, size.height * 0.94, size.width * 0.3, size.height * 0.73, size.width * 0.51, size.height * 0.51);
    path.cubicTo(size.width * 0.73, size.height * 0.3, size.width * 0.94, size.height * 0.16, size.width * 0.98, size.height / 5);
    path.cubicTo(size.width * 1.03, size.height / 4, size.width, size.height * 0.57, size.width * 0.78, size.height * 0.78);
    path.cubicTo(size.width * 0.57, size.height, size.width / 4, size.height * 1.03, size.width / 5, size.height * 0.98);
    path.cubicTo(size.width / 5, size.height * 0.98, size.width / 5, size.height * 0.98, size.width / 5, size.height * 0.98);
    path.lineTo(size.width / 5, size.height * 0.98);
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: jambitOrange.brighten(0.33),
      body: BlocBuilder<PlaceBloc, PlaceState>(
        builder: (context, state) {
          if (state is PlaceGameInProgress) {
            void reportGameScore(int score) {
              setState(() {
                this.score = score;
              });
              final placeBloc = BlocProvider.of<PlaceBloc>(context);
              placeBloc.add(PlaceGameFinished(score, state.place));
            }

            switch (widget.place.minigame.type) {
              case minigameIdentifierFlappy:
                return FlappyBeanScreen(reportGameScore);
              case minigameIdentifierDice:
                return DiceScreen(reportGameScore);
              case minigameIdentifierSquash:
                return BugSquashScreen(reportGameScore);
              default:
                return DiceScreen(reportGameScore);
            }
          } else if (state is PlaceGameCompletedSuccess) {
            if (state.points > 0) {
              _confettiController.play();
            }
            var ownerName = state.place.owner?.name ?? "the previous owner";
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Card(
                    child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(
                            "Your score: ${state.score}",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: ConfettiWidget(
                              confettiController: _confettiController,
                              blastDirectionality: BlastDirectionality.explosive,
                              shouldLoop: false,
                              colors: [
                                Colors.orange.shade200,
                                Colors.white,
                                Colors.orange.shade700,
                                Colors.grey.shade800,
                              ],
                              // createParticlePath: drawCoffeeBean, // define a custom coffee-bean path. Path isn't correct, needs to be fixed.
                            ),
                          ),
                        ]
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        state.points > 0
                            ? "You beat $ownerName's high score and won ${state.points} jamBeans!"
                            : "You weren't able to crack $ownerName's high score of ${state.place.minigame.score}.",
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<PlaceBloc>(context)
                                    .add(PlaceGameStarted(widget.place));
                              },
                              child: Text("Play Again")),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Go Back"))
                        ],
                      )
                    ],
                  ),
                )),
              ),
            );
          } else if (state is PlaceGameCompletedFailure) {
            return const Text("failed to update score");
          }
          return const Text("Other error encountered");
        },
      ),
    );
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }
}

abstract class JamopoGame {
  abstract final Function onGameFinished;
}
