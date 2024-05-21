part of 'answer_cubit.dart';

sealed class AnswerState extends Equatable {
  const AnswerState();

  @override
  List<Object> get props => [];
}

final class AnswerInitial extends AnswerState {}

final class AnswerPick extends AnswerState  {
  final List<bool> isSelected;

  const AnswerPick({required this.isSelected});

  @override
  List<Object> get props => [isSelected];
}

class AnswerCorrectness extends AnswerState {
  final bool isCorrect;

  const AnswerCorrectness({required this.isCorrect});

  @override
  List<Object> get props => [isCorrect];
}