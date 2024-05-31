import 'package:equatable/equatable.dart';
import 'package:toefl_app/domain/models/material_answer.dart';

class MaterialQuestionModel extends Equatable {
  final String? question;
  final String? url;
  final List<MaterialAnswerModel> answerList;

  const MaterialQuestionModel({required this.question, required this.url, required this.answerList});

  factory MaterialQuestionModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    final answers = json['example_answer'] as List;

    return MaterialQuestionModel(
      question: json['question'] as String?,
      url: json['url'] as String?,
      answerList: answers.map((e) => MaterialAnswerModel.fromJson(e)).toList(),
    );
  }

  static const empty = MaterialQuestionModel(
    question: '',
    url: '',
    answerList: [],
  );

  @override
  List<Object?> get props => [question, answerList, url];
}