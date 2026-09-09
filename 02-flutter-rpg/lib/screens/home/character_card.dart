import 'package:flutter/material.dart';
import 'package:flutter_rpg/screens/profile/profile.dart';

import 'package:flutter_rpg/shared_ui/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

import 'package:flutter_rpg/models/character.dart';

class CharacterCard extends StatelessWidget {
  const new(this.character, {super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Row(
          children: [
            Image.asset(
              'assets/vocations/${character.vocation.image}',
              width: 80,
            ),

            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StyledHeading(character.name),
                StyledText(character.vocation.title),
              ],
            ),

            Expanded(child: const SizedBox()),

            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => Profile(character: character),
                  ),
                );
              },
              icon: Icon(Icons.arrow_forward, color: AppColors.textColor),
            ),
          ],
        ),
      ),
    );
  }
}
