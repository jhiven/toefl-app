import 'package:equatable/equatable.dart';

class PickWordModel extends Equatable {
  final String word;
  final String type;

  const PickWordModel({required this.word, required this.type});

  factory PickWordModel.fromJson(Map<String, dynamic> json) {
    return PickWordModel(
      word: json['word'] as String,
      type: json['type'] as String,
    );
  }


  static const empty = PickWordModel(
    word: '',
    type: '',
  );

  @override
  List<Object?> get props => [word, type];
}