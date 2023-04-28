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
  @override
  void initState() {
    BlocProvider.of<PlaceBloc>(context).add(PlaceGameStarted(widget.place));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: jambitOrange,
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
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Card(
                    child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Your score was ${state.score}",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        state.points > 0
                            ? "you beat the high score and won ${state.points} points!"
                            : "You werent able to crack ${state.place.owner?.userName ?? "the previous owner"}'s high score of ${state.place.minigame.score}.",
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<PlaceBloc>(context).add(PlaceGameStarted(widget.place));
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
            return Text("failed to update score");
          }
          return Text("other error encounted");
        },
      ),
    );
  }
}

abstract class JamopoGame {
  abstract final Function onGameFinished;
}
