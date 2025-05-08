import 'package:flutter/material.dart';
import 'screens/login/login_screen.dart';
import 'screens/bottom_tabbar/bottom_tabbar_screen.dart';
import 'screens/tournament_detail/tournament_detail_screen.dart';
import 'screens/walkthrough_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WalkthroughScreen(),
    );
  }
}