import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

const String assetName = 'assets/icon/logo.svg';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SvgPicture.asset(
        assetName,
        semanticsLabel: 'japomo logo',
        width: 35,
        height: 35,
      ),
      const SizedBox(width: 10),
    ]);
  }
}
