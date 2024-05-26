import 'package:equatable/equatable.dart';

class SynonymModel extends Equatable{
  final String word1;
  final String word2;

  const SynonymModel({required this.word1, required this.word2});

  factory SynonymModel.fromJson(Map<String, dynamic> json) {
    return SynonymModel(
      word1: json['word1'] as String,
      word2: json['word2'] as String,
    );
  }


  static const empty = SynonymModel(
    word1: '',
    word2: '',
  );

  @override
  List<Object?> get props => [word1, word2];
}