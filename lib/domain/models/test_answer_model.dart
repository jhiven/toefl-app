import 'package:equatable/equatable.dart';

class TestAnswerModel extends Equatable {
  final String answer;
  final bool isCorrect;

  const TestAnswerModel({
    required this.answer,
    required this.isCorrect,
  });

  factory TestAnswerModel.fromJson(Map<String, dynamic> json) {
    return TestAnswerModel(
      answer: json['answer'] as String,
      isCorrect: json['is_correct'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'answer': answer,
      'is_correct': isCorrect,
    };
  }

  static const empty = TestAnswerModel(
    answer: '',
    isCorrect: false,
  );

  @override
  List<Object?> get props => [answer, isCorrect];
}
