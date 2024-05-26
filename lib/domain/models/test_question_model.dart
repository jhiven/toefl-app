import 'package:equatable/equatable.dart';
import 'package:toefl_app/domain/models/test_answer_model.dart';

class TestQuestionModel extends Equatable {
  final String? question;
  final String? url;
  final List<TestAnswerModel> answerList;
  final String? text;
  final TestAnswerModel selectedAnswer;

  const TestQuestionModel({
    this.question,
    this.url,
    this.text,
    required this.answerList,
    this.selectedAnswer = TestAnswerModel.empty,
  });

  factory TestQuestionModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    final answers = json['test_answer'] as List;

    return TestQuestionModel(
      question: json['question'] as String?,
      text: json['text'] as String?,
      url: json['url'] as String?,
      answerList: answers.map((e) => TestAnswerModel.fromJson(e)).toList(),
    );
  }

  TestQuestionModel copyWith({
    String? question,
    String? url,
    List<TestAnswerModel>? answerList,
    String? text,
    TestAnswerModel? selectedAnswer,
  }) {
    return TestQuestionModel(
      question: question ?? this.question,
      url: url ?? this.url,
      answerList: answerList ?? this.answerList,
      text: text ?? this.text,
      selectedAnswer: selectedAnswer ?? this.selectedAnswer,
    );
  }

  static const empty = TestQuestionModel(
    question: null,
    url: null,
    text: null,
    answerList: [],
  );

  @override
  List<Object?> get props => [question, answerList, url, text, selectedAnswer];
}
