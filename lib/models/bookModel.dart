class Book {
  final String abbrev;
  final String name;
  final List<List<String>> chapters;

  Book({required this.abbrev, required this.name, required this.chapters});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      abbrev: json['abbrev'],
      name: json['book'],
      chapters: List<List<String>>.from(
        json['chapters'].map((chapter) => List<String>.from(chapter)),
      ),
    );
  }

  static List<Book> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Book.fromJson(json)).toList();
  }
}
