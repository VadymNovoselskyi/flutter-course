void main() {
  var planets = {"first": "Mercury", "second": "Vanus", "third": "Eart"};

  print(planets);
  print(planets["third"]);
  print(planets.containsKey("third"));
  print(planets.containsValue("Mars"));

  print(planets.keys);

  planets.forEach(((key, value) => print("$key: $value")));
}
