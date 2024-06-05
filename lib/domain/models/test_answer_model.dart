import 'package:equatable/equatable.dart';

class TestAnswerModel extends Equatable {
  final String answer;
  final bool isCorrect;
  final int answerId;

  const TestAnswerModel({
    required this.answer,
    required this.isCorrect,
    required this.answerId,
  });

  factory TestAnswerModel.fromJson(Map<String, dynamic> json) {
    return TestAnswerModel(
      answerId: json['id'] as int,
      answer: json['answer'] as String,
      isCorrect: json['is_correct'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': answerId,
      'answer': answer,
      'is_correct': isCorrect,
    };
  }

  static const empty = TestAnswerModel(
    answerId: -1,
    answer: '',
    isCorrect: false,
  );

  @override
  List<Object?> get props => [answerId, answer, isCorrect];
}
