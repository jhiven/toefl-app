import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'answer_state.dart';

class AnswerCubit extends Cubit<AnswerState> {
  AnswerCubit() : super(AnswerInitial());

  void selectAnswer(int index){
      final List<bool> isSelected = List.generate(4, (_) => false);
      isSelected[index] = true;
      emit(AnswerPick(isSelected: isSelected));
  }

  void resetAnswer(){
    final List<bool> isSelected = List.generate(4, (_) => false);
    emit(AnswerPick(isSelected: isSelected));
  }

  void checkAnswer(String answer1, String answer2) {
    bool isCorrect = answer1.toLowerCase() == answer2.toLowerCase();
    emit(AnswerCorrectness(isCorrect: isCorrect));
  }

}
