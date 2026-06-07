class WordModel {
  final String id;
  final String word;
  final String meaning;
  final String translation;

  WordModel({
    required this.id,
    required this.word,
    required this.meaning,
    required this.translation,
  });

  factory WordModel.fromJson(Map<String, dynamic> json) {
    return WordModel(
      id: json['id'] ?? '',
      word: json['word'] ?? '',
      meaning: json['meaning'] ?? '',
      translation: json['translation'] ?? '',
    );
  }
}