import 'package:flutter/material.dart';
import 'package:tech_adventure/theme/colors.dart';
import 'package:tech_adventure/ui/widgets/coffee_bean.dart';

class ScoreDisplay extends StatelessWidget {
  const ScoreDisplay({super.key, required this.score});
  final int score;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          const CoffeeBean(),
          if (score != 0)
            Positioned(
                bottom: 0 - (constraints.maxHeight * .05),
                right: 0 - (constraints.maxWidth * .05),
                child: Container(
                  height: constraints.maxWidth * .55,
                  constraints: BoxConstraints(minWidth: constraints.maxWidth * .55),
                  decoration: BoxDecoration(
                    color: jambitOrange.withOpacity(.9),
                    borderRadius: BorderRadius.circular(constraints.maxHeight * .55),
                  ),
                  child: Center(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * .1),
                    child: Text(
                      "$score",
                      style: const TextStyle(fontWeight: FontWeight.w400),
                      textScaleFactor: 1 * (constraints.maxWidth / 40),
                    ),
                  )),
                )),
        ],
      );
    });
  }
}
