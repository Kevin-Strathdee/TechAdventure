import 'package:flutter/material.dart';
import 'package:tech_adventure/ui/widgets/appbar/score_display.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: SizedBox(height: 200, width: 200, child: ScoreDisplay()),
    ));
  }
}
