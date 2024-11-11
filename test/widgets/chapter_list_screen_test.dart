import 'package:biblia/screens/bookListScreen.dart';
import 'package:biblia/service/bible_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';


class MockBibleService extends Mock implements BibleService {}

void main() {
  testWidgets('Exibe capítulos do Novo Testamento', (WidgetTester tester) async {
    final mockBibleService = MockBibleService();
    when(mockBibleService.fetchNewTestamentChapters()).thenAnswer(
          (_) async => [
        ['Versículo 1', 'Versículo 2'],
        ['Versículo 3', 'Versículo 4'],
      ],
    );

    // Constrói o widget de teste
    await tester.pumpWidget(
      MaterialApp(
        home: ChapterListScreen(),
      ),
    );

    // Dispara a construção do FutureBuilder
    await tester.pumpAndSettle();

    // Verifica se os capítulos e versículos são exibidos
    expect(find.text('Capítulo 1'), findsOneWidget);
    expect(find.text('Capítulo 2'), findsOneWidget);
    expect(find.text('Versículo 1'), findsOneWidget);
    expect(find.text('Versículo 2'), findsOneWidget);
  });
}
