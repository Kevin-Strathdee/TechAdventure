import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

const String assetName = 'assets/coffee-bean.svg';

class CoffeeBean extends StatelessWidget {
  const CoffeeBean({super.key, this.color, this.size = const Size(30, 30)});
  final Color? color;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      color: color,
      assetName,
      semanticsLabel: 'Coffee bean',
      height: size.height,
      width: size.width,
    );
  }
}
