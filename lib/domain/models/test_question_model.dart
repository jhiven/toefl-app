import 'package:equatable/equatable.dart';
import 'package:toefl_app/domain/models/test_answer_model.dart';

class TestQuestionModel extends Equatable {
  final int id;
  final String? question;
  final String? url;
  final List<TestAnswerModel> answerList;
  final String? text;
  final TestAnswerModel selectedAnswer;

  const TestQuestionModel({
    required this.id,
    this.question,
    this.url,
    this.text,
    required this.answerList,
    this.selectedAnswer = TestAnswerModel.empty,
  });

  factory TestQuestionModel.fromSupaJson({
    required Map<String, dynamic> json,
  }) {
    final answers = json['test_answer'] as List;

    return TestQuestionModel(
      id: json['id'] as int,
      question: json['question'] as String?,
      text: json['text'] as String?,
      url: json['url'] as String?,
      answerList: answers.map((e) => TestAnswerModel.fromJson(e)).toList(),
    );
  }

  factory TestQuestionModel.fromJson(Map<String, dynamic> json) {
    final answerList = (json['answerList'] as List)
        .map((e) => TestAnswerModel.fromJson(e))
        .toList()
      ..shuffle();

    return TestQuestionModel(
      id: json['id'] as int,
      question: json['question'] as String?,
      selectedAnswer: TestAnswerModel.fromJson(json['selectedAnswer']),
      text: json['text'] as String?,
      url: json['url'] as String?,
      answerList: answerList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'text': text,
      'url': url,
      'answerList': answerList.map((e) => e.toJson()).toList(),
      'selectedAnswer': selectedAnswer.toJson(),
    };
  }

  TestQuestionModel copyWith({
    int? id,
    String? question,
    String? url,
    List<TestAnswerModel>? answerList,
    String? text,
    TestAnswerModel? selectedAnswer,
  }) {
    return TestQuestionModel(
      id: id ?? this.id,
      url: url ?? this.url,
      question: question ?? this.question,
      answerList: answerList ?? this.answerList,
      text: text ?? this.text,
      selectedAnswer: selectedAnswer ?? this.selectedAnswer,
    );
  }

  static const empty = TestQuestionModel(
    id: -1,
    question: null,
    url: null,
    text: null,
    answerList: [],
  );

  @override
  List<Object?> get props => [
        id,
        question,
        answerList,
        url,
        text,
        selectedAnswer,
      ];
}
