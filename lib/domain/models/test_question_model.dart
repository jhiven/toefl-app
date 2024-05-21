import 'package:equatable/equatable.dart';
import 'package:toefl_app/domain/models/test_answer_model.dart';

class TestQuestionModel extends Equatable {
  final String? question;
  final String? url;
  final List<TestAnswerModel> answerList;

  const TestQuestionModel({
    this.question,
    this.url,
    required this.answerList,
  });

  factory TestQuestionModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    final answers = json['test_answer'] as List;

    return TestQuestionModel(
      question: json['question'] as String?,
      url: json['url'] as String?,
      answerList: answers.map((e) => TestAnswerModel.fromJson(e)).toList(),
    );
  }

  static const empty = TestQuestionModel(
    question: '',
    url: '',
    answerList: [],
  );

  @override
  List<Object?> get props => [question, answerList, url];
}
