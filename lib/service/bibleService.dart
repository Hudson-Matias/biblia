import 'dart:convert';
import 'package:http/http.dart' as http;

class BibleService {
  final String apiUrl = 'http://localhost:3000/1';
  final http.Client client;

  BibleService([http.Client? client]) : client = client ?? http.Client();

  Future<List<dynamic>> fetchNewTestamentChapters() async {
    final response = await client.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);
      return jsonData['chapters'] ?? [];
    } else {
      throw Exception('Erro ao carregar o Novo Testamento');
    }
  }
}


