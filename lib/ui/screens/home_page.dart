import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_adventure/bloc/place/place_bloc.dart';
import 'package:tech_adventure/bloc/scan/scan_bloc.dart';
import 'package:tech_adventure/generated/l10n.dart';
import 'package:tech_adventure/ui/screens/practice_list_screen.dart';
import 'package:tech_adventure/ui/screens/maps_page.dart';
import 'package:tech_adventure/ui/screens/overview_screen.dart';
import 'package:tech_adventure/ui/screens/place_detail_screen.dart';
import 'package:tech_adventure/ui/screens/profile_screen.dart';
import 'package:tech_adventure/ui/screens/scan_screen.dart';
import 'package:tech_adventure/ui/widgets/appbar/overview_app_bar.dart';
import 'package:tech_adventure/ui/widgets/coffee_bean.dart';

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
          BlocProvider.of<PlaceBloc>(context).add(PlaceScanned(placeId));
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const PlaceDetailScreen()));
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
