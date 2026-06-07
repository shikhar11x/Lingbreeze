import 'package:flutter/material.dart';
import '../../data/models/word_model.dart';
import '../../data/repositories/word_repository.dart';

enum WordState { idle, loading, loaded, error }

class WordProvider extends ChangeNotifier {
  final _repo = WordRepository();
  List<WordModel> words = [];
  WordState state = WordState.idle;
  String errorMessage = '';

  Future<void> fetchWords() async {
    state = WordState.loading;
    notifyListeners();
    try {
      words = await _repo.getWords();
      state = WordState.loaded;
    } catch (e) {
      state = WordState.error;
      errorMessage = e.toString();
    }
    notifyListeners();
  }

  Future<bool> addWord(String word, String meaning, String translation) async {
    try {
      await _repo.addWord(word, meaning, translation);
      await fetchWords();
      return true;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    }
  }
}