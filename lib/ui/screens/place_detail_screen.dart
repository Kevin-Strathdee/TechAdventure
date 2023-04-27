import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_adventure/bloc/place/place_bloc.dart';
import 'package:tech_adventure/data/models/place.dart';
import 'package:tech_adventure/generated/l10n.dart';
import 'package:tech_adventure/theme/colors.dart';
import 'package:tech_adventure/ui/delayed_animation.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key});

  final int delayedAmount = 500;

  Widget getContent(BuildContext context, Place place) {
    double textSize = 25;
    Color textColor = Colors.white;
    return Expanded(
        child: Column(children: [
      AvatarGlow(
        endRadius: 90,
        duration: const Duration(seconds: 2),
        glowColor: Colors.white24,
        repeat: true,
        repeatPauseDuration: const Duration(seconds: 2),
        startDelay: const Duration(seconds: 1),
        child: Material(
          color: Colors.blue,
          elevation: 8.0,
          child: Card(
              color: Colors.blue,
              child: Text(
                S.of(context).streetName,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    color: Colors.white),
              )),
        ),
      ),
      Card(
        color: Colors.orangeAccent,
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        elevation: 7,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(S.of(context).ownedBy,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: textSize,
                      )),
                  const Spacer(),
                  Text(place.owner?.userName ?? "",
                      style: TextStyle(
                        color: textColor,
                        fontSize: textSize,
                      ))
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(S.of(context).game,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: textSize,
                      )),
                  const Spacer(),
                  Text(place.minigame.type,
                      style: TextStyle(
                        color: textColor,
                        fontSize: textSize,
                      ))
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(S.of(context).highScore,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: textSize,
                      )),
                  const Spacer(),
                  Text(place.minigame.score.toString(),
                      style: TextStyle(
                        color: textColor,
                        fontSize: textSize,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
      const Spacer(),
      SizedBox(
        width: 250,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orangeAccent,
            // background (button) color
            foregroundColor: Colors.white, // foreground (text) color
          ),
          onPressed: () => {},
          child: Text(
            S.of(context).play,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35.0,
                color: Colors.white),
          ),
        ),
      ),
      const Spacer()
    ]));
  }

  Widget noContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 50),
        Text(
          S.of(context).noPlaceInformationWereProvided,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    const color = Colors.white;
    return Scaffold(
        backgroundColor: jambitOrange,
        body: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 100.0,
              ),
              DelayedAnimation(
                delay: delayedAmount + 1000,
                child: Text(
                  S.of(context).discoveredNewPlaceTitle,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: color),
                ),
              ),
              const SizedBox(height: 20),
              BlocBuilder<PlaceBloc, PlaceState>(builder: (context, state) {
                if (state is PlaceLoadInProgress) {
                  return const CircularProgressIndicator(
                      backgroundColor: Colors.white);
                } else if (state is PlaceLoadedSuccess) {
                  return getContent(context, state.place);
                }
                return noContent(context);
              }),
            ],
          ),
        ));
  }
}
