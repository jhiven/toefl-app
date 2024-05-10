part of 'test_section_cubit.dart';

enum TestSectionStatus { initial, success, done }

final class TestSectionState extends Equatable {
  final TestSectionModel section;
  final TestQuestionModel currentQuestion;
  final TestAnswerModel selectedAnswer;
  final TestSectionStatus status;
  final int currentQuestionIdx;
  final int totalCorrect;
  final int totalIncorrect;

  const TestSectionState({
    this.section = TestSectionModel.empty,
    this.currentQuestion = TestQuestionModel.empty,
    this.selectedAnswer = TestAnswerModel.empty,
    this.status = TestSectionStatus.initial,
    this.currentQuestionIdx = 0,
    this.totalCorrect = 0,
    this.totalIncorrect = 0,
  });

  TestSectionState copyWith({
    TestSectionModel? section,
    TestQuestionModel? currentQuestion,
    TestAnswerModel? selectedAnswer,
    TestSectionStatus? status,
    int? currentQuestionIdx,
    int? totalCorrect,
    int? totalIncorrect,
  }) {
    return TestSectionState(
      section: section ?? this.section,
      currentQuestion: currentQuestion ?? this.currentQuestion,
      selectedAnswer: selectedAnswer ?? this.selectedAnswer,
      status: status ?? this.status,
      totalCorrect: totalCorrect ?? this.totalCorrect,
      totalIncorrect: totalIncorrect ?? this.totalIncorrect,
      currentQuestionIdx: currentQuestionIdx ?? this.currentQuestionIdx,
    );
  }

  @override
  List<Object> get props => [
        section,
        currentQuestion,
        selectedAnswer,
        totalCorrect,
        totalIncorrect,
        status,
        currentQuestion,
      ];
}

final class TestSectionInitial extends TestSectionState {}
