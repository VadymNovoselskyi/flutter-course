void main() {
  var noodles = MenuItem(title: 'Vet noodles', price: 9.99);
  var pizza = Pizza(
    title: 'Volcano Pizza',
    price: 12.99,
    toppings: ["pepperoni", "mushrooms"],
  );

  print(noodles.format());
  print(pizza);
}

class MenuItem {
  String title;
  double price;

  MenuItem({required this.title, required this.price});

  String format() {
    return "$title --> \$$price";
  }

  @override
  String toString() {
    return this.format();
  }
}

class Pizza extends MenuItem {
  List<String> toppings;

  Pizza({required this.toppings, required super.title, required super.price});

  @override
  String format() {
    var formattedToppings = toppings.fold(
      "Contains:",
      (prev, topping) => "$prev $topping",
    );
    return "${super.format()} \n($formattedToppings)";
  }
}
