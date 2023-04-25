import 'package:flutter/material.dart';
import 'package:tech_adventure/ui/widgets/coffee_bean.dart';

class ScoreCounter extends StatelessWidget {
  const ScoreCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          const CoffeeBean(),
          Positioned(
              bottom: 0,
              right: -25,
              child: RawMaterialButton(
                onPressed: () {},
                elevation: 2.0,
                fillColor: Color(0xFFF5F6F9),
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.blue,
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              )),
        ],
      ),
    );
    return Stack(
      children: [
        Positioned(bottom: 5, right: 0, left: 0, top: 0, child: const CoffeeBean()),
        Positioned(
          top: 5,
          left: 10,
          right: 0,
          bottom: 5,
          child: CircleAvatar(
            radius: 4,
            child: Text("15"),
          ),
        )
      ],
    );
  }
}
