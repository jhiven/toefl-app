import 'package:equatable/equatable.dart';
import 'package:toefl_app/domain/models/test_question_model.dart';

enum SectionType { listening, structure, reading, unknown }

class TestSectionModel extends Equatable {
  final List<TestQuestionModel> questionList;
  final SectionType sectionType;

  const TestSectionModel({
    required this.questionList,
    required this.sectionType,
  });

  factory TestSectionModel.fromQuestionsJson({
    required List questions,
    required SectionType sectionType,
  }) {
    return TestSectionModel(
      questionList: questions
          .where((element) => element['type_id'] == sectionType.index + 1)
          .map((e) => TestQuestionModel.fromJson(json: e))
          .toList(),
      sectionType: sectionType,
    );
  }

  TestSectionModel copyWith({
    List<TestQuestionModel>? questionList,
    SectionType? sectionType,
  }) {
    return TestSectionModel(
      questionList: questionList ?? this.questionList,
      sectionType: sectionType ?? this.sectionType,
    );
  }

  static const empty = TestSectionModel(
    questionList: [],
    sectionType: SectionType.unknown,
  );

  @override
  List<Object?> get props => [questionList, sectionType];
}
