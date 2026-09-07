import 'package:flutter/material.dart';
import 'package:flutter_rpg/screens/home/character_card.dart';
import 'package:flutter_rpg/shared_ui/styled_button.dart';
import 'package:flutter_rpg/shared_ui/styled_text.dart';

class Home extends StatefulWidget {
  const new({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List characters = ["mario", "luigi", "bowser"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const StyledTitle("Your characters!")),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const StyledHeading("Character list"),

            Expanded(
              child: ListView.builder(
                itemCount: characters.length,
                itemBuilder: (_, i) {
                  return CharacterCard(characters[i]);
                },
              ),
            ),

            StyledButton(
              onPressed: () {},
              child: const StyledHeading("Create new"),
            ),
          ],
        ),
      ),
    );
  }
}
