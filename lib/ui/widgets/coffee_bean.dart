import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

const String assetName = 'assets/coffee-bean.svg';

class CoffeeBean extends StatelessWidget {
  const CoffeeBean({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      color: color,
      assetName,
      semanticsLabel: 'Coffee bean',
      height: 30,
      width: 30,
    );
  }
}
