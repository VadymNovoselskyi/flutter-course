import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main() async {
  // fetchPost().then((post) {
  //   print(post);
  // });

  final post = await fetchPost();
  print(post);
}

Future<Post> fetchPost() async {
  final url = Uri.https('jsonplaceholder.typicode.com', '/posts/1');

  final response = await http.get(url);

  Map<String, dynamic> data = convert.jsonDecode(response.body);
  return Post(
      id: data["id"],
      userId: data["userId"],
      title: data["title"],
      body: data["body"]);
}

class Post {
  int userId;
  int id;
  String title;
  String body;

  Post(
      {required this.id,
      required this.userId,
      required this.title,
      required this.body});

  @override
  String toString() {
    return "Post $id from $userId: $title \n$body";
  }
}
