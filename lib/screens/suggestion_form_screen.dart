// lib/screens/suggestion_form_screen.dart

import 'package:flutter/material.dart';
import '../models/suggestion_model.dart';

class SuggestionFormScreen extends StatefulWidget {
  final Suggestion? suggestion;

  SuggestionFormScreen({this.suggestion});

  @override
  _SuggestionFormScreenState createState() => _SuggestionFormScreenState();
}

class _SuggestionFormScreenState extends State<SuggestionFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.suggestion != null) {
      _textController.text = widget.suggestion!.text;
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final newSuggestion = Suggestion(
        id: widget.suggestion?.id ?? DateTime.now().millisecondsSinceEpoch,
        text: _textController.text,
      );
      Navigator.pop(context, newSuggestion);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.suggestion == null ? 'Nova Sugestão' : 'Editar Sugestão')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _textController,
                decoration: InputDecoration(labelText: 'Sugestão'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira uma sugestão';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
