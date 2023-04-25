import 'package:flutter/material.dart';
import 'package:tech_adventure/ui/widgets/appbar/app_logo.dart';
import 'package:tech_adventure/ui/widgets/appbar/score_counter.dart';

class OverviewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OverviewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const ContinuousRectangleBorder(),
      margin: const EdgeInsetsDirectional.all(0),
      child: SizedBox(
        height: preferredSize.height,
        width: preferredSize.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppLogo(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ScoreCounter(),
            )
          ],
        ),
      ),
    );
    return AppBar(
      backgroundColor: Colors.white,
      title: AppLogo(),
      automaticallyImplyLeading: true,
      elevation: 2,
      leadingWidth: 0,
      actions: const <Widget>[ScoreCounter()],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
