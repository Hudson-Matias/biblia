// lib/screens/suggestion_list_screen.dart

import 'package:flutter/material.dart';
import '../models/suggestion_model.dart';
import '../services/suggestion_service.dart';
import 'suggestion_form_screen.dart';

class SuggestionListScreen extends StatefulWidget {
  @override
  _SuggestionListScreenState createState() => _SuggestionListScreenState();
}

class _SuggestionListScreenState extends State<SuggestionListScreen> {
  final SuggestionService _suggestionService = SuggestionService();
  List<Suggestion> _suggestions = [];

  @override
  void initState() {
    super.initState();
    _loadSuggestions();
  }

  Future<void> _loadSuggestions() async {
    final suggestions = await _suggestionService.fetchSuggestions();
    setState(() {
      _suggestions = suggestions;
    });
  }

  void _addOrUpdateSuggestion({Suggestion? suggestion}) async {
    final newSuggestion = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SuggestionFormScreen(suggestion: suggestion),
      ),
    );

    if (newSuggestion != null) {
      setState(() {
        if (suggestion == null) {
          _suggestionService.addSuggestion(newSuggestion);
        } else {
          _suggestionService.updateSuggestion(suggestion.id, newSuggestion.text);
        }
        _loadSuggestions(); // Recarrega as sugestões para garantir que o estado seja atualizado
      });
    }
  }

  void _deleteSuggestion(int id) {
    setState(() {
      _suggestionService.deleteSuggestion(id);
      _loadSuggestions(); // Recarrega as sugestões após a exclusão
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sugestões')),
      body: _suggestions.isEmpty
          ? Center(child: Text('Nenhuma sugestão disponível'))
          : ListView.builder(
        itemCount: _suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = _suggestions[index];
          return ListTile(
            title: Text(suggestion.text),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => _addOrUpdateSuggestion(suggestion: suggestion),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteSuggestion(suggestion.id),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _addOrUpdateSuggestion(),
      ),
    );
  }
}
