import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'synonym_state.dart';

class SynonymCubit extends Cubit<SynonymState> {
  SynonymCubit() : super(SynonymInitial());

  void buttonBorder1(int index) {
    if (state is SynonymInitial) {
      final isSelected = List.generate(4, (_) => false);
      emit(SynonymWord1Click(isSelected1: isSelected,chosen1: '', isSelected2: isSelected, chosen2: ''));
    }
    if  (state is SynonymWord1Click) {
      final currentState = state as SynonymWord1Click;
      final List<bool> updatedSelected = List.generate(4, (_) => false);
      updatedSelected[index] = true;
      emit(SynonymWord1Click(
          isSelected1: updatedSelected, chosen1: currentState.chosen1, isSelected2: currentState.isSelected2, chosen2: currentState.chosen1));
    }
  }

  void getChosenText1(String text) {
    if (state is SynonymWord1Click) {
      final currentState = state as SynonymWord1Click;
      emit(SynonymWord1Click(
          isSelected1: currentState.isSelected1, chosen1: text, isSelected2: currentState.isSelected2, chosen2: currentState.chosen2));
    }
  }

  void buttonBorder2(int index) {
    if (state is SynonymInitial) {
      final isSelected = List.generate(4, (_) => false);
      emit(SynonymWord1Click(isSelected1: isSelected,chosen1: '', isSelected2: isSelected, chosen2: ''));
    }
    if (state is SynonymWord1Click) {
      final currentState = state as SynonymWord1Click;
      final List<bool> updatedSelected = List.generate(4, (_) => false);
      updatedSelected[index] = true;
      emit(SynonymWord1Click(
          isSelected2: updatedSelected, chosen2: currentState.chosen2, isSelected1: currentState.isSelected1, chosen1: currentState.chosen1));
    }
  }

  void getChosenText2(String text) {
    if (state is SynonymWord1Click) {
      final currentState = state as SynonymWord1Click;
      emit(SynonymWord1Click(
          isSelected2: currentState.isSelected2, chosen2: text, isSelected1: currentState.isSelected1, chosen1: currentState.chosen1));
    }
  }
}
