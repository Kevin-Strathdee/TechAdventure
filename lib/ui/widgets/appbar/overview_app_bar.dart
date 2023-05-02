import 'package:flutter/material.dart';
import 'package:japomo/theme/colors.dart';
import 'package:japomo/ui/widgets/appbar/app_logo.dart';

class OverviewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OverviewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    const logoTextStyle =
        TextStyle(fontWeight: FontWeight.w800, fontFamily: 'Open Sans', fontSize: 28, color: Colors.black);
    return AppBar(
        backgroundColor: Colors.grey.shade50,
        leading: const AppLogo(),
        title: Row(
          children: [
            const Text('japo', style: logoTextStyle),
            Text('mo', style: logoTextStyle.copyWith(color: jambitOrange)),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ))
        ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
