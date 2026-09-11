import 'package:flutter/material.dart';

import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/services/firestore_service.dart';

class CharacterStore extends ChangeNotifier {
  final List<Character> _characters = [];
  List<Character> get characters => _characters;

  void addCharacter(Character character) {
    FirestoreService.addCharacter(character);
    _characters.add(character);

    notifyListeners();
  }

  void fetchCharactersOnce() async {
    if (characters.isNotEmpty) return;
    final snapshot = await FirestoreService.fetchCharacters();

    for (var doc in snapshot.docs) {
      _characters.add(doc.data());
    }
    notifyListeners();
  }

  Future<void> saveCharacter(Character character) async {
    await FirestoreService.updateCharacter(character);
    return;
  }

  Future<void> removeCharacter(Character character) async {
    await FirestoreService.deleteCharacter(character);
    _characters.remove(character);

    notifyListeners();
  }
}
