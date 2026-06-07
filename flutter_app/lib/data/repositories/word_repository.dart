import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/word_model.dart';
import '../../core/constants.dart';

class WordRepository {
  Future<List<WordModel>> getWords() async {
    final response = await http.get(
      Uri.parse('${AppConstants.baseUrl}/words'),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['words'] as List)
          .map((e) => WordModel.fromJson(e))
          .toList();
    }
    throw Exception('Failed to load words');
  }

  Future<void> addWord(String word, String meaning, String translation) async {
    final response = await http.post(
      Uri.parse('${AppConstants.baseUrl}/words'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'word': word,
        'meaning': meaning,
        'translation': translation,
      }),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to add word');
    }
  }
}