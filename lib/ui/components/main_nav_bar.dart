import 'package:flutter/material.dart';
import 'package:tech_adventure/ui/screens/scan_screen.dart';

class MainNavBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home Page',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera),
          label: 'Scan Screen',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_rounded),
          label: 'Profile screen',
        ),
      ],
      onTap: (index) => _onItemTapped(index, context),         //New
    );
  }



//New
  void _onItemTapped(int index, BuildContext context) {
    if(index == 1){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ScanScreen()));
    }
  }
}