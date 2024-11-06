import 'package:flutter/material.dart';
import '../service/bibleService.dart';

class ChapterListScreen extends StatefulWidget {
  @override
  _ChapterListScreenState createState() => _ChapterListScreenState();
}

class _ChapterListScreenState extends State<ChapterListScreen> {
  final BibleService bibleService = BibleService();
  late Future<List<List<String>>> chapters;

  @override
  void initState() {
    super.initState();
    chapters = bibleService.fetchNewTestamentChapters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Capítulos do Novo Testamento')),
      body: FutureBuilder<List<List<String>>>(
        future: chapters,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhum capítulo encontrado'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, chapterIndex) {
                final chapter = snapshot.data![chapterIndex];
                return ExpansionTile(
                  title: Text('Capítulo ${chapterIndex + 1}'),
                  children: chapter
                      .map((verse) => ListTile(title: Text(verse)))
                      .toList(),
                );
              },
            );
          }
        },
      ),
    );
  }
}