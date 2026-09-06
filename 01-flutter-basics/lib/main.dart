import 'package:flutter/material.dart';

import 'package:coffee_card/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Coffee Card', home: Home());
  }
}
