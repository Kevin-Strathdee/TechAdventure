import 'package:flutter/material.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Maps")),
        body: const Center(
          child: Text("This is the maps screen"),
        )
    );
  }
}