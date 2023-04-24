import 'package:flutter/material.dart';
import 'package:tech_adventure/generated/l10n.dart';
import 'package:tech_adventure/ui/screens/maps_page.dart';
import 'package:tech_adventure/ui/screens/profile_screen.dart';
import 'package:tech_adventure/ui/screens/scan_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: S.of(context).navbarHome,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: S.of(context).navbarScan,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: S.of(context).navbarProfile,
          ),
        ],
        onTap: (index) => _onItemTapped(index, context), //New
        currentIndex: _selectedTab,
      ),
      body: _getHomeScreenContent(_selectedTab),
    );
  }

  Widget _getHomeScreenContent(int selectedTab) {
    switch (selectedTab) {
      case 0:
        return const MapsPage();
      case 1:
        return ScanScreen();
      case 2:
        return const ProfileScreen();
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
