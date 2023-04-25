import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

const String assetName = 'assets/coffee-bean.svg';

class CoffeeBean extends StatelessWidget {
  const CoffeeBean({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      semanticsLabel: 'Coffee bean',
      height: 30,
      width: 30,
    );
  }
}
