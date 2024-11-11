import 'package:flutter/material.dart';
import '../services/bible_service.dart';
import 'chapter_screen.dart';
import '../models/book_model.dart';

class BookListScreen extends StatelessWidget {
  final BibleService bibleService = BibleService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Livros da Bíblia')),
      body: FutureBuilder<Book>(
        future: bibleService.fetchBook(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar o livro: ${snapshot.error}'));
          } else {
            final book = snapshot.data!;
            return ListView.builder(
              itemCount: book.chapters.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Capítulo ${index + 1}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChapterScreen(chapter: book.chapters[index]),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
