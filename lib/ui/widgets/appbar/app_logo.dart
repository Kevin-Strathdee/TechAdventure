import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

const String assetName = 'assets/jambit-logo.svg';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      semanticsLabel: 'jambit logo',
      width: 160,
    );
  }
}
