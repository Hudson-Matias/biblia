import 'package:flutter/material.dart';
import 'screens/bookListScreen.dart';

void main() => runApp(const BibleApp());

class BibleApp extends StatelessWidget {
  const BibleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChapterListScreen(),
    );
  }
}
