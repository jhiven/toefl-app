import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:toefl_app/domain/models/test_answer_model.dart';
import 'package:toefl_app/domain/models/test_question_model.dart';
import 'package:toefl_app/domain/models/test_section_model.dart';

part 'test_section_state.dart';

class TestSectionCubit extends Cubit<TestSectionState> {
  TestSectionCubit() : super(TestSectionInitial());

  void setTestSection({required TestSectionModel section}) {
    emit(
      state.copyWith(
        section: section,
        currentQuestion: section.questionList.first,
        status: TestSectionStatus.success,
        selectedAnswer: TestAnswerModel.empty,
        isShowInstruction: true,
        currentQuestionIdx: 0,
        totalCorrect: 0,
        totalIncorrect: 0,
      ),
    );
  }

  void startSection() {
    emit(
      state.copyWith(
        isShowInstruction: false,
        status: TestSectionStatus.success,
      ),
    );
  }

  void nextQuestion() {
    final int idx = state.currentQuestionIdx + 1;
    try {
      emit(
        state.copyWith(
          currentQuestion: state.section.questionList[idx],
          currentQuestionIdx: idx,
          selectedAnswer: TestAnswerModel.empty,
          status: TestSectionStatus.success,
        ),
      );
    } on RangeError catch (_) {
      emit(
        state.copyWith(
          status: TestSectionStatus.done,
        ),
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void sectionTimeout() {
    final int totalIncorrect =
        state.section.questionList.length - state.totalCorrect;

    emit(
      state.copyWith(
        status: TestSectionStatus.done,
        totalIncorrect: totalIncorrect,
      ),
    );
  }

  void checkAnswer() {
    final bool isCorrect = state.selectedAnswer.isCorrect;
    emit(
      state.copyWith(
        totalCorrect: isCorrect ? state.totalCorrect + 1 : state.totalCorrect,
        totalIncorrect:
            !isCorrect ? state.totalIncorrect + 1 : state.totalIncorrect,
        status: TestSectionStatus.success,
      ),
    );
  }

  void setSelectedAnswer({required TestAnswerModel answer}) {
    emit(
      state.copyWith(
        selectedAnswer: answer,
        status: TestSectionStatus.success,
      ),
    );
  }
}
