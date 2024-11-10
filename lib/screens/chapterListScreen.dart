import 'package:flutter/material.dart';
import '../models/bookModel.dart';

class BookDetailScreen extends StatelessWidget {
  final Book book;

  BookDetailScreen({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(book.name)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Autor: ${book.author}', style: TextStyle(fontSize: 16)),
            Text('Data: ${book.date}', style: TextStyle(fontSize: 16)),
            Text('Propósito: ${book.purpose}', style: TextStyle(fontSize: 16)),
            Text('Curiosidade: ${book.curiosity}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: book.chapters.length,
                itemBuilder: (context, index) {
                  final chapter = book.chapters[index];
                  return ExpansionTile(
                    title: Text('Capítulo ${chapter.number}'),
                    children: chapter.verses.map((verse) {
                      return ListTile(
                        title: Text('${verse.number}. ${verse.text}'),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
