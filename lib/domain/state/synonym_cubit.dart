import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:toefl_app/domain/models/synonym.dart';

part 'synonym_state.dart';

class SynonymCubit extends Cubit<SynonymState> {
  SynonymCubit() : super(SynonymInitial());

  void initialSynonym(List<SynonymModel> data) {
    final isSelected = List.generate(4, (_) => false);
    final answer1 = List.generate(4, (_) => false);
    final answer2 = List.generate(4, (_) => false);
    emit(SynonymWord1Click(data, answer1, answer2,
        isSelected1: isSelected,
        chosen1: '',
        isSelected2: isSelected,
        chosen2: ''));
  }

  void buttonBorder1(int index) {
    if (state is SynonymWord1Click) {
      final currentState = state as SynonymWord1Click;
      final List<bool> updatedSelected = List.generate(4, (_) => false);
      updatedSelected[index] = true;
      emit(SynonymWord1Click(
          currentState.data, currentState.answer1, currentState.answer2,
          isSelected1: updatedSelected,
          chosen1: currentState.chosen1,
          isSelected2: currentState.isSelected2,
          chosen2: currentState.chosen2));
    }
  }

  void getChosenText1(String text) {
    if (state is SynonymWord1Click) {
      final currentState = state as SynonymWord1Click;
      if (currentState.chosen2.isNotEmpty) {
        checkAnswer(text, currentState.chosen2);
      }
      emit(SynonymWord1Click(
          currentState.data, currentState.answer1, currentState.answer2,
          isSelected1: currentState.isSelected1,
          chosen1: text,
          isSelected2: currentState.isSelected2,
          chosen2: currentState.chosen2));
    }
  }

  void buttonBorder2(int index) {
    if (state is SynonymWord1Click) {
      final currentState = state as SynonymWord1Click;
      final List<bool> updatedSelected = List.generate(4, (_) => false);
      updatedSelected[index] = true;
      emit(SynonymWord1Click(
          currentState.data, currentState.answer1, currentState.answer2,
          isSelected2: updatedSelected,
          chosen2: currentState.chosen2,
          isSelected1: currentState.isSelected1,
          chosen1: currentState.chosen1));
    }
  }

  void getChosenText2(String text) {
    if (state is SynonymWord1Click) {
      final currentState = state as SynonymWord1Click;
      if (currentState.chosen1.isNotEmpty) {
        checkAnswer(currentState.chosen1, text);
      }
      emit(SynonymWord1Click(
          currentState.data, currentState.answer1, currentState.answer2,
          isSelected2: currentState.isSelected2,
          chosen2: text,
          isSelected1: currentState.isSelected1,
          chosen1: currentState.chosen1));
    }
  }

  void checkAnswer(String text1, String text2) {
    if (state is SynonymWord1Click) {
      final currentState = state as SynonymWord1Click;
      SynonymModel? check;
      for (var i = 0; i < currentState.data.length; i++) {
        if (currentState.data[i].word1 == text1) {
          check = currentState.data[i];
        }
      }
      if (check!.word2 == text2) {
        final List<bool> updatedSelected1 =
            addTrueToList(currentState.answer1, currentState.isSelected1);
        final List<bool> updatedSelected2 =
            addTrueToList(currentState.answer2, currentState.isSelected2);
        emit(SynonymWord1Click(
            currentState.data, updatedSelected1, updatedSelected2,
            isSelected2: currentState.isSelected2,
            chosen2: '',
            isSelected1: currentState.isSelected1,
            chosen1: ''));
      } else {
        emit(SynonymWord1Click(
            currentState.data, currentState.answer1, currentState.answer2,
            isSelected2: currentState.isSelected2,
            chosen2: '',
            isSelected1: currentState.isSelected1,
            chosen1: ''));
      }
    }
  }

  List<bool> addTrueToList(List<bool> list1, List<bool> list2) {
    for (int i = 0; i < list1.length; i++) {
      if (list2[i]) {
        list1[i] = true;
      }
    }
    return list1;
  }
}
