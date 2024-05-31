import 'package:equatable/equatable.dart';

class MaterialAnswerModel extends Equatable {
  final String answer;
  final bool value;

  const MaterialAnswerModel({required this.answer, required this.value});

  factory MaterialAnswerModel.fromJson(Map<String, dynamic> json) {
    return MaterialAnswerModel(
      answer: json['answer'] as String,
      value: json['value'] as bool,
    );
  }

  static const empty = MaterialAnswerModel(
    answer: '',
    value: false,
  );

  @override
  List<Object?> get props => [answer, value];
}