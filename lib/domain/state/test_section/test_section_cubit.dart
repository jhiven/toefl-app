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

  void prevQuestion() {
    final int idx = state.currentQuestionIdx - 1;
    final int nextIdx = idx < 0 ? 0 : idx;

    emit(
      state.copyWith(
        currentQuestion: state.section.questionList[nextIdx],
        currentQuestionIdx: nextIdx,
        status: TestSectionStatus.success,
      ),
    );
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
    final int totalCorrect = state.section.questionList
        .where((element) => element.selectedAnswer.isCorrect)
        .length;
    final int totalIncorrect = state.section.questionList
        .where((element) => !element.selectedAnswer.isCorrect)
        .length;

    emit(
      state.copyWith(
        totalCorrect: totalCorrect,
        totalIncorrect: totalIncorrect,
        status: TestSectionStatus.success,
      ),
    );
  }

  void setSelectedAnswer({required TestAnswerModel answer}) {
    final currentQuestion = state.currentQuestion.copyWith(
      selectedAnswer: answer,
    );
    emit(
      state.copyWith(
        section: state.section.copyWith(
            questionList: state.section.questionList.map((e) {
          if (e == state.currentQuestion) {
            return currentQuestion;
          }
          return e;
        }).toList()),
        currentQuestion: currentQuestion,
        status: TestSectionStatus.success,
      ),
    );
  }

  void setQuestion({required int index}) {
    emit(
      state.copyWith(
        currentQuestion: state.section.questionList[index],
        currentQuestionIdx: index,
        status: TestSectionStatus.success,
      ),
    );
  }
}
