import 'package:biblia/service/bibleService.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

@GenerateMocks([http.Client])
void main() {
  group('BibleService', () {
    late BibleService bibleService;
    late MockClient mockClient;

    setUp(() {
      mockClient = MockClient();
      bibleService = BibleService(mockClient); // Passa o mockClient como dependência para o serviço
    });

    test('fetchNewTestamentChapters - Filtra capítulos que contêm a palavra "Deus"', () async {
      // Simula uma resposta JSON da API com um capítulo específico
      final mockResponse = {
        'abbrev': 'mc',
        'name': 'Marcos',
        'chapters': [
          ['Deus é amor', 'Jesus é o caminho'],
          ['No princípio era o Verbo', 'E o Verbo estava com Deus']
        ]
      };

      when(mockClient.get(any)).thenAnswer(
            (_) async => http.Response(json.encode(mockResponse), 200),
      );

      final chapters = await bibleService.fetchNewTestamentChapters();

      // Filtrando capítulos que contêm a palavra "Deus"
      final filteredChapters = chapters.where((chapter) => chapter.any((verse) => verse.contains('Deus'))).toList();

      expect(filteredChapters.isNotEmpty, true);
      expect(filteredChapters[0][0], contains('Deus'));
    });
  });
}
