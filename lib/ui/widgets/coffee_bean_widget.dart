import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

const String assetName = 'assets/coffee-bean.svg';

final Widget svgCoffeeBean = SvgPicture.asset(
  assetName,
  semanticsLabel: 'Coffee bean',
  height: 30,
  width: 30,
);