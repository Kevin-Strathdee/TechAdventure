import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:japomo/bloc/place/place_bloc.dart';
import 'package:japomo/bloc/scan/scan_bloc.dart';
import 'package:japomo/generated/l10n.dart';
import 'package:japomo/ui/screens/practice_list_screen.dart';
import 'package:japomo/ui/screens/maps_page.dart';
import 'package:japomo/ui/screens/overview_screen.dart';
import 'package:japomo/ui/screens/place_detail_screen.dart';
import 'package:japomo/ui/screens/profile_screen.dart';
import 'package:japomo/ui/screens/scan_screen.dart';
import 'package:japomo/ui/widgets/appbar/overview_app_bar.dart';
import 'package:japomo/ui/widgets/coffee_bean.dart';

import '../../theme/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ScanBloc, ScanState>(
      listener: (context, state) {
        if (state is ScanCompleted) {
          final placeId = state.code.split("/").last;
          context.go('/places/$placeId');
        }
      },
      child: Scaffold(
        appBar: const OverviewAppBar(),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const SizedBox(height: 23, child: CoffeeBean()),
              activeIcon: const SizedBox(
                  height: 23,
                  child: CoffeeBean(
                    color: jambitOrange,
                  )),
              label: S.of(context).navbarHome,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.qr_code_scanner),
              label: S.of(context).navbarScan,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.videogame_asset),
              label: S.of(context).practiceIconLabel,
            ),
          ],
          onTap: (index) => _onItemTapped(index, context), //New
          currentIndex: _selectedTab,
        ),
        body: _getHomeScreenContent(_selectedTab),
      ),
    );
  }

  Widget _getHomeScreenContent(int selectedTab) {
    switch (selectedTab) {
      case 0:
        return const OverviewScreen();
      case 1:
        return const ScanScreen();
      case 2:
        return const PracticeListScreen();
      default:
        return const MapsPage();
    }
  }

  _onItemTapped(int index, BuildContext context) {
    setState(() {
      _selectedTab = index;
    });
  }
}
