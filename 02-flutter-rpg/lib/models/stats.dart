mixin Stats {
  int _points = 10;
  int _health = 10;
  int _attack = 10;
  int _deffense = 10;
  int _skill = 10;

  int get points => _points;

  Map<String, int> get statsAsMap => {
    "health": _health,
    "attack": _attack,
    "deffense": _deffense,
    "skill": _skill,
  };
  List<Map<String, String>> get statsAsFormattedList => [
    {'title': "health", "value": _health.toString()},
    {'title': "attack", "value": _attack.toString()},
    {'title': "deffense", "value": _deffense.toString()},
    {'title': "skill", "value": _skill.toString()},
  ];

  void increaseStat(String stat) {
    if (_points <= 0) {
      return;
    }

    if (stat == "health") {
      _health++;
    } else if (stat == "attack") {
      _attack++;
    } else if (stat == "deffense") {
      _deffense++;
    } else if (stat == "skill") {
      _skill++;
    }
    _points--;
  }

  void decreaseStat(String stat) {
    if (stat == "health" && _health > 5) {
      _health--;
    } else if (stat == "attack" && _attack > 5) {
      _attack--;
    } else if (stat == "deffense" && _deffense > 5) {
      _deffense--;
    } else if (stat == "skill" && _skill > 5) {
      _skill--;
    }
    _points++;
  }

  void setStats({required int points, required Map<String, dynamic> stats}) {
    _points = points;
    _attack = stats["attack"];
    _deffense = stats["deffense"];
    _health = stats["skill"];
    _skill = stats["skill"];
  }
}
