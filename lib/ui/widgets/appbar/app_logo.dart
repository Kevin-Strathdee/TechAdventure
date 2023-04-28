import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../../theme/colors.dart';

const String assetName = 'assets/logo.svg';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    const logoTextStyle = TextStyle(
      fontWeight: FontWeight.w800,
      fontFamily: 'Open Sans',
      fontSize: 28,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
      SvgPicture.asset(
        assetName,
        semanticsLabel: 'japomo logo',
        width: 35,
        height: 35,
      ),
      const SizedBox(width: 10),
      Row(children: [
        const Text('japo', style: logoTextStyle),
        Text('mo',
            style: logoTextStyle.copyWith(color: jambitOrange)
        ),
      ])
    ]);
  }
}
