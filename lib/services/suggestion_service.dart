// lib/services/suggestion_service.dart

import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/suggestion_model.dart';

class SuggestionService {
  List<Suggestion> _suggestions = [];

  Future<List<Suggestion>> fetchSuggestions() async {
    if (_suggestions.isEmpty) {
      try {
        final String response = await rootBundle.loadString('assets/suggestions.json');
        final List<dynamic> data = json.decode(response);
        _suggestions = data.map((json) => Suggestion.fromJson(json)).toList();
      } catch (e) {
        print('Erro ao carregar sugestões: $e');
      }
    }
    return _suggestions;
  }

  void addSuggestion(Suggestion suggestion) {
    _suggestions.add(suggestion);
  }

  void updateSuggestion(int id, String newText) {
    final index = _suggestions.indexWhere((s) => s.id == id);
    if (index != -1) {
      _suggestions[index] = Suggestion(id: id, text: newText);
    }
  }

  void deleteSuggestion(int id) {
    _suggestions.removeWhere((s) => s.id == id);
  }
}
