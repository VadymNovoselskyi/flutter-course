import 'package:flutter_rpg/models/character.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/screens/create/vocation_card.dart';

import 'package:flutter_rpg/shared_ui/styled_button.dart';
import 'package:flutter_rpg/shared_ui/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

var uuid = const Uuid();

class Create extends StatefulWidget {
  const new({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  Vocation selectedVocation = Vocation.junkie;
  void updateVocation(Vocation vocation) {
    setState(() {
      selectedVocation = vocation;
    });
  }

  void handleSubmit() {
    if (_nameController.text.trim().isEmpty) {
      return;
    }
    if (_sloganController.text.trim().isEmpty) {
      return;
    }

    characters.add(
      Character(
        id: uuid.v4(),
        name: _nameController.text.trim(),
        slogan: _sloganController.text.trim(),
        vocation: selectedVocation,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const StyledTitle("Character creation!")),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
              Center(child: const StyledHeading("Welcome, new player!")),
              Center(
                child: const StyledText(
                  "Create a name and slogan for your character",
                ),
              ),
              const SizedBox(height: 30),

              TextField(
                controller: _nameController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                cursorColor: AppColors.textColor,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_2),
                  label: StyledText("Character name"),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: _sloganController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                cursorColor: AppColors.textColor,

                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.chat),
                  label: StyledText("Character slogan"),
                ),
              ),
              const SizedBox(height: 30),

              Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
              Center(child: const StyledHeading("Choose a vocation")),
              Center(
                child: const StyledText(
                  "This determines your available skills",
                ),
              ),
              VocationCard(
                vocation: Vocation.junkie,
                onTap: updateVocation,
                selected: selectedVocation == Vocation.junkie,
              ),
              VocationCard(
                vocation: Vocation.ninja,
                onTap: updateVocation,
                selected: selectedVocation == Vocation.ninja,
              ),
              VocationCard(
                vocation: Vocation.raider,
                onTap: updateVocation,
                selected: selectedVocation == Vocation.raider,
              ),
              VocationCard(
                vocation: Vocation.wizard,
                onTap: updateVocation,
                selected: selectedVocation == Vocation.wizard,
              ),

              const SizedBox(height: 30),
              Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
              Center(child: const StyledHeading("Good Luck!")),
              Center(child: const StyledText("And enjoy the journey...")),
              Center(
                child: StyledButton(
                  onPressed: handleSubmit,
                  child: const StyledHeading("Create character"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
