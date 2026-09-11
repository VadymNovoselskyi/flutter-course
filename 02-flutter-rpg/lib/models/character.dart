import 'package:cloud_firestore/cloud_firestore.dart';
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

  Map<String, dynamic> toFirestore() {
    return {
      "name": name,
      "slogan": slogan,
      "isFav": _isFav,
      "vocation": vocation.toString(),
      "skills": skills.map((skill) => skill.id).toList(),
      "points": points,
      "stats": statsAsMap,
    };
  }

  factory Character.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    if (data == null) {
      throw StateError('Character document does not exist');
    }

    Character character = Character(
      id: snapshot.id,
      name: data["name"],
      slogan: data["slogan"],
      vocation: Vocation.values.firstWhere(
        (vocation) => vocation.toString() == data["vocation"],
      ),
    );

    for (String id in data["skills"]) {
      Skill skill = allSkills.firstWhere((element) => element.id == id);
      character.updateSkills(skill);
    }

    if (data['isFav'] == true) {
      character.toggleIsFav();
    }

    character.setStats(points: data["points"], stats: data["stats"]);
    return character;
  }
}
