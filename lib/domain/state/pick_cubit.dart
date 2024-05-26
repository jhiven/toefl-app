import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'pick_state.dart';

class PickCubit extends Cubit<PickState> {
  PickCubit() : super(PickInitial());

  void initialpick(List<String> answer) {
    final isSelected = List.generate(8, (_) => false);
    emit(PickSelectionChanged(answer, false, false, isSelected: isSelected));
  }

  void buttonBorder(int index) {
    if (state is PickSelectionChanged) {
      final currentState = state as PickSelectionChanged;
      final List<bool> updatedSelected = List.from(currentState.isSelected);
      updatedSelected[index] = !updatedSelected[index];
      emit(PickSelectionChanged(currentState.answer, false, false,
          isSelected: updatedSelected, chosen: currentState.chosen));
    }
  }

  void getChosenText(String text) {
    if (state is PickSelectionChanged) {
      final currentState = state as PickSelectionChanged;
      final List<String> updatedChosen = List.from(currentState.chosen);
      if (updatedChosen.contains(text)) {
        updatedChosen.remove(text);
      } else {
        updatedChosen.add(text);
      }
      emit(PickSelectionChanged(currentState.answer, false, false,
          isSelected: currentState.isSelected, chosen: updatedChosen));
    }
  }

  void check() {
    if (state is PickSelectionChanged) {
      final currentState = state as PickSelectionChanged;
      bool areEqual =
          Set.from(currentState.answer).containsAll(currentState.chosen) &&
              Set.from(currentState.chosen).containsAll(currentState.answer);
      print(PickSelectionChanged(currentState.answer, areEqual, true,
          isSelected: currentState.isSelected, chosen: currentState.chosen));
      emit(PickSelectionChanged(currentState.answer, areEqual, true,
          isSelected: currentState.isSelected, chosen: currentState.chosen));
    }
  }
}
