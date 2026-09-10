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
