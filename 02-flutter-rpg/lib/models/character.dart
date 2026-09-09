import 'package:flutter_rpg/models/stats.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/models/skill.dart';

class Character with Stats {
  new({
    required this.id,
    required this.name,
    required this.slogan,
    required this.vocation,
  });

  final String id;
  final String name;
  final String slogan;
  final Vocation vocation;
  final Set<Skill> skills = {};

  bool _isFav = false;
  bool get isFav => _isFav;

  void toggleIsFav() {
    _isFav = !_isFav;
  }

  void updateSkills(Skill skill) {
    skills.clear();
    skills.add(skill);
  }
}

// dummy character data

List<Character> characters = [
  Character(
    id: '1',
    name: 'Klara',
    vocation: Vocation.wizard,
    slogan: 'Kapumf!',
  ),
  Character(
    id: '2',
    name: 'Jonny',
    vocation: Vocation.junkie,
    slogan: 'Light me up...',
  ),
  Character(
    id: '3',
    name: 'Crimson',
    vocation: Vocation.raider,
    slogan: 'Fire in the hole!',
  ),
  Character(
    id: '4',
    name: 'Shaun',
    vocation: Vocation.ninja,
    slogan: 'Alright then gang.',
  ),
];
