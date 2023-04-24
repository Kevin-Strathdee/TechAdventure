import 'package:flutter/material.dart';
import 'package:tech_adventure/ui/components/main_nav_bar.dart';

class ScanScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: MainNavBar(), body: Text("Scan Screen"),);
  }
}

