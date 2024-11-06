import 'package:flutter/material.dart';
import '../models/bookModel.dart';

class ChapterListScreen extends StatelessWidget {
  final Book book;

  const ChapterListScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(book.name)),
      body: ListView.builder(
        itemCount: book.chapters.length,
        itemBuilder: (context, chapterIndex) {
          return ExpansionTile(
            title: Text('Capítulo ${chapterIndex + 1}'),
            children: book.chapters[chapterIndex]
                .map((verse) => ListTile(title: Text(verse)))
                .toList(),
          );
        },
      ),
    );
  }
}
