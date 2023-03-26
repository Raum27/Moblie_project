import 'dart:convert';
import 'package:http/http.dart' as http;

class Contents {
  final String title;
  final String image;
  final String contents;

  Contents({
    required this.title,
    required this.image,
    required this.contents,
  });
  factory Contents.fromJson(Map<String, dynamic> json) {
    return Contents(
      title: json['title'],
      image: json['image'],
      contents: json['contents'],
    );
  }
}

class Contextword {
  final String contents;

  Contextword({
    required this.contents,
  });
  factory Contextword.fromJson(Map<String, dynamic> json) {
    return Contextword(
      contents: json['contents'],
    );
  }
}

void _loadData() async {
  List<Contents>? ccc;
  Contextword? css;
  var uri = Uri.parse('http://127.0.0.1:8000/');
  // var uri = Uri.parse('http://127.0.0.1:8000/contents');
  var response = await http.get(uri);

  List result = jsonDecode(utf8.decode(response.bodyBytes));

  print(result);

  // ccc = result.map((item) => Contents.fromJson(item)).toList();
  // print(ccc);

  css = Contextword.fromJson(result[0]);
  print(css);
}

void main() {
  _loadData();
}
