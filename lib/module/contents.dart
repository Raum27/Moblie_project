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
