import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/bookModel.dart';

class BibleService {
  Future<List<Book>> loadBooks() async {
    final String response = await rootBundle.loadString('lib/backend/api/new.json');
    final data = json.decode(response) as List<dynamic>;
    return data.map((bookData) => Book.fromJson(bookData)).toList();
  }
}
