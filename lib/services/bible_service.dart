import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/book_model.dart';

const String kBaseUrl = 'http://localhost:3000';

class BibleService {
  Future<Book> fetchBook() async {
    try {
      final response = await http.get(Uri.parse('$kBaseUrl/1'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Book.fromJson(data);
      } else {
        throw Exception('Erro ao carregar o livro: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro ao carregar o livro: $e');
    }
  }
}
