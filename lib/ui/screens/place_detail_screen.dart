import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:japomo/bloc/place/place_bloc.dart';
import 'package:japomo/data/models/place.dart';
import 'package:japomo/generated/l10n.dart';
import 'package:japomo/theme/colors.dart';
import 'package:japomo/ui/delayed_animation.dart';
import 'package:japomo/ui/screens/game_screen.dart';
import 'package:japomo/ui/screens/home_page.dart';

import '../widgets/coffee_bean.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key});

  final int delayedAmount = 500;

  Widget getContent(BuildContext context, Place place) {
    double textSize = 25;
    Color? cardTextColor = Theme.of(context).textTheme.headlineMedium?.color;
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          elevation: 7,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(7),
                    color: Colors.blue.shade700,
                    width: double.infinity,
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
                        child: Text(
                          place.name,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white),
                        )),
                  ),
                  Positioned.fill(
                    top: 2,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          color: Colors.blue.shade700,
                          child: Icon(Icons.home, color: Colors.grey.shade200, size: 20)),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(S.of(context).ownedBy,
                            style: TextStyle(
                              color: cardTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: textSize,
                            )),
                        const Spacer(),
                        Text(place.owner?.name ?? "Not owned",
                            style: TextStyle(
                              color: cardTextColor,
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
                              color: cardTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: textSize,
                            )),
                        const Spacer(),
                        Text(place.minigame.type,
                            style: TextStyle(
                              color: cardTextColor,
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
                              color: cardTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: textSize,
                            )),
                        const Spacer(),
                        Text(place.minigame.score.toString(),
                            style: TextStyle(
                              color: cardTextColor,
                              fontSize: textSize,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(S.of(context).rent,
                            style: TextStyle(
                              color: cardTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: textSize,
                            )),
                        const Spacer(),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: cardTextColor,
                              fontSize: textSize,
                            ),
                            children: const [
                              TextSpan(text: '1 '),
                              WidgetSpan(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 2.0, top: 1.0, bottom: 6.0),
                                  child: CoffeeBean(size: Size.square(17)),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        SizedBox(
          width: 250,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: jambitOrange, foregroundColor: Colors.white, minimumSize: const Size.fromHeight(60)),
            onPressed: () => {Navigator.of(context).push(MaterialPageRoute(builder: (context) => GameScreen(place)))},
            child: Text(
              S.of(context).play,
              style: const TextStyle(fontSize: 30.0, color: Colors.white),
            ),
          ),
        ),
        const Spacer(),
      ],
    ));

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
        backgroundColor: Colors.grey.shade500.darken(0.15),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      iconSize: 50, color: Colors.white, onPressed: () => context.go("/"), icon: Icon(Icons.close))),
              const SizedBox(
                height: 30,
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
              const SizedBox(height: 50),
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
