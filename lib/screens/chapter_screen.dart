import 'package:flutter/material.dart';
import '../models/book_model.dart';

class ChapterScreen extends StatelessWidget {
  final Chapter chapter;

  ChapterScreen({required this.chapter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Versículos')),
      body: ListView.builder(
        itemCount: chapter.verses.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${index + 1}. ${chapter.verses[index]}'),
          );
        },
      ),
    );
  }
}
