part of 'button_next_cubit.dart';

sealed class ButtonNextState extends Equatable {
  const ButtonNextState();

  @override
  List<Object> get props => [];
}

final class ButtonNextInitial extends ButtonNextState {}

final class ButtonNextChange extends ButtonNextState {
  final bool next;

  const ButtonNextChange({required this.next});
  @override
  List<Object> get props => [next];
}