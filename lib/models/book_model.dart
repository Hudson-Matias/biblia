class Book {
  final String abbrev;
  final List<Chapter> chapters;

  Book({
    required this.abbrev,
    required this.chapters,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      abbrev: json['abbrev'],
      chapters: (json['chapters'] as List<dynamic>)
          .map((chapter) => Chapter.fromJson(chapter))
          .toList(),
    );
  }
}

class Chapter {
  final List<String> verses;

  Chapter({
    required this.verses,
  });

  factory Chapter.fromJson(List<dynamic> json) {
    return Chapter(
      verses: List<String>.from(json),
    );
  }
}
