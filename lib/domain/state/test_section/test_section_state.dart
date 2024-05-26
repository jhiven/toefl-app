part of 'test_section_cubit.dart';

enum TestSectionStatus { initial, success, done }

final class TestSectionState extends Equatable {
  final TestSectionModel section;
  final TestQuestionModel currentQuestion;
  final TestSectionStatus status;
  final bool isShowInstruction;
  final int currentQuestionIdx;
  final int totalCorrect;
  final int totalIncorrect;

  const TestSectionState({
    this.section = TestSectionModel.empty,
    this.currentQuestion = TestQuestionModel.empty,
    this.status = TestSectionStatus.initial,
    this.isShowInstruction = true,
    this.currentQuestionIdx = 0,
    this.totalCorrect = 0,
    this.totalIncorrect = 0,
  });

  TestSectionState copyWith({
    TestSectionModel? section,
    TestQuestionModel? currentQuestion,
    TestSectionStatus? status,
    bool? isShowInstruction,
    int? currentQuestionIdx,
    int? totalCorrect,
    int? totalIncorrect,
  }) {
    return TestSectionState(
      section: section ?? this.section,
      currentQuestion: currentQuestion ?? this.currentQuestion,
      status: status ?? this.status,
      isShowInstruction: isShowInstruction ?? this.isShowInstruction,
      totalCorrect: totalCorrect ?? this.totalCorrect,
      totalIncorrect: totalIncorrect ?? this.totalIncorrect,
      currentQuestionIdx: currentQuestionIdx ?? this.currentQuestionIdx,
    );
  }

  @override
  List<Object> get props => [
        section,
        currentQuestion,
        totalCorrect,
        isShowInstruction,
        totalIncorrect,
        status,
        currentQuestion,
      ];
}

final class TestSectionInitial extends TestSectionState {}
