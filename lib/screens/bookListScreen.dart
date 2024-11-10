import 'package:flutter/material.dart';
import '../models/bookModel.dart';
import '../service/bibleService.dart';
import 'chapterListScreen.dart';
import 'suggestionFormScreen.dart';

class BookListScreen extends StatelessWidget {
  final BibleService bibleService = BibleService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Livros do Novo Testamento'),
        actions: [
          IconButton(
            icon: Icon(Icons.add_comment),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SuggestionFormScreen()),
              );
            },
          )
        ],
      ),
      body: FutureBuilder<List<Book>>(
        future: bibleService.loadBooks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar os livros'));
          } else {
            final books = snapshot.data!..sort((a, b) => a.name.compareTo(b.name));
            return ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];
                return ListTile(
                  title: Text(book.name),
                  subtitle: Text(book.author),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetailScreen(book: book),
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
