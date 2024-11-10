class Book {
  final String name;
  final String author;
  final String date;
  final String purpose;
  final String curiosity;
  final List<Chapter> chapters;

  Book({
    required this.name,
    required this.author,
    required this.date,
    required this.purpose,
    required this.curiosity,
    required this.chapters,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      name: json['name'],
      author: json['author'],
      date: json['date'],
      purpose: json['purpose'],
      curiosity: json['curiosity'],
      chapters: (json['chapters'] as List<dynamic>)
          .map((chapter) => Chapter.fromJson(chapter))
          .toList(),
    );
  }
}

class Chapter {
  final int number;
  final List<Verse> verses;

  Chapter({
    required this.number,
    required this.verses,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
      number: json['number'],
      verses: (json['verses'] as List<dynamic>)
          .map((verse) => Verse.fromJson(verse))
          .toList(),
    );
  }
}

class Verse {
  final int number;
  final String text;

  Verse({
    required this.number,
    required this.text,
  });

  factory Verse.fromJson(Map<String, dynamic> json) {
    return Verse(
      number: json['number'],
      text: json['text'],
    );
  }
}
