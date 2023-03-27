class Textsummarizer {
  final String contents;

  Textsummarizer({
    required this.contents,
  });
  factory Textsummarizer.fromJson(Map<String, dynamic> json) {
    return Textsummarizer(
      contents: json['contents'],
    );
  }
}
