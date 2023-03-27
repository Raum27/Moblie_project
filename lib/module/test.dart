class Testapi {
  final String title;
  final String image;
  final String contents;

  Testapi({
    required this.title,
    required this.image,
    required this.contents,
  });
  factory Testapi.fromJson(Map<String, dynamic> json) {
    return Testapi(
      title: json['userId'],
      image: json['id'],
      contents: json['title'],
    );
  }
}
