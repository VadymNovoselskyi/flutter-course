void main() {
  var name = "Vadym";
  const age = 20;
  print("Hello my name is $name and I'm $age years old");

  // int? points;
  // print(points);

  print(greet(name: name));
}

String greet({required String name, int? age = 99}) {
  return "Hi $name, age: $age";
}
