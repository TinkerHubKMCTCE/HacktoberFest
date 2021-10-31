import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: "Quizzler",
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
