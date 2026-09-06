import 'package:flutter/material.dart';

import 'package:coffee_card/styled_button.dart';

class CoffeePrefs extends StatefulWidget {
  const new({super.key});

  @override
  State<CoffeePrefs> createState() => _CoffeePrefsState();
}

class _CoffeePrefsState extends State<CoffeePrefs> {
  int strength = 1;
  int sugars = 1;

  void increaseStrength() {
    setState(() {
      strength = strength % 5 + 1;
    });
  }

  void increaseSugars() {
    setState(() {
      sugars = (sugars + 1) % 6;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text("Strength: "),
            for (int i = 0; i < strength; i++)
              Image.asset(
                "assets/coffee_bean.png",
                width: 25,
                color: Colors.brown[100],
                colorBlendMode: BlendMode.multiply,
              ),
            const Expanded(child: SizedBox()),
            StyledButton(onPressed: increaseStrength, child: Text("+")),
          ],
        ),
        Row(
          children: [
            const Text("Sugars: "),

            if (sugars == 0) const Text("No Sugars"),
            for (int i = 0; i < sugars; i++)
              Image.asset(
                "assets/sugar_cube.png",
                width: 25,
                color: Colors.brown[100],
                colorBlendMode: BlendMode.multiply,
              ),

            const Expanded(child: SizedBox()),
            StyledButton(onPressed: increaseSugars, child: Text("+")),
          ],
        ),
      ],
    );
  }
}
