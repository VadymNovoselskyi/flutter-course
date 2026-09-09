import 'package:flutter/material.dart';

import 'package:flutter_rpg/theme.dart';
import 'package:flutter_rpg/screens/home/home.dart';

void main() {
  runApp(const FlutterRpgApp());
}

class FlutterRpgApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: primaryTheme,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        overscroll: false,
      ),
      home: const Home(),
    );
  }
}
