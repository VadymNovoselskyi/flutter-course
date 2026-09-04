void main() {
  List<int> scores = [1, 2, 5, 3, 4, 99];
  print(scores);

  scores.remove(99);
  scores.add(100);
  print(scores);

  final highScores = scores.where((score) => score > 4);
  for (int score in highScores) {
    print("The score is $score");
  }

  Set<String> names = {"Vadym", "Iryna", "Yaroslav"};
  print(names);
}
