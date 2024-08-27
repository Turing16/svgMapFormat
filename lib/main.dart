import 'package:flutter/material.dart';
import 'package:svg_navmap/interactiveMap.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: const Text("Interactive Map"), backgroundColor: Colors.white,),
        body: InteractiveMap(floorPlanSvg: 'assets/pg_ground.svg'),
      ),
    );
  }
}
