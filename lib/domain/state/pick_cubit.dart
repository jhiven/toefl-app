import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'pick_state.dart';

class PickCubit extends Cubit<PickState> {
  PickCubit() : super(PickInitial());

  void buttonBorder(int index) {
    if (state is PickInitial) {
      final isSelected = List.generate(8, (_) => false);
      emit(PickSelectionChanged(isSelected: isSelected));
    }
    if (state is PickSelectionChanged) {
      final currentState = state as PickSelectionChanged;
      final List<bool> updatedSelected = List.from(currentState.isSelected);
      updatedSelected[index] = !updatedSelected[index];
      emit(PickSelectionChanged(
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
      emit(PickSelectionChanged(
          isSelected: currentState.isSelected, chosen: updatedChosen));
    }
  }
}
