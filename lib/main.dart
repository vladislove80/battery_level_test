import 'package:battery_level/feature_battery_level/battery_level_screen/view/battery_lavel_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'BLApp',
      home: BatteryLevelScreen(),
    );
  }
}
