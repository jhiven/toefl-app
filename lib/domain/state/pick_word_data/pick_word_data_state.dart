part of 'pick_word_data_cubit.dart';

sealed class PickWordDataState extends Equatable {
  const PickWordDataState();

  @override
  List<Object> get props => [];
}

final class PickWordDataInitial extends PickWordDataState {}

final class PickWordDataLoading extends PickWordDataState {}

final class PickWordDataLoaded extends PickWordDataState {
  final List<PickWordModel> data;
  final String question;
  final List<String> answer;

  const PickWordDataLoaded({required this.data, required this.question, required this.answer});

  @override
  List<Object> get props => [data, question, answer];
}

final class PickWordDataError extends PickWordDataState {
  final String message;

  const PickWordDataError({required this.message});

  @override
  List<Object> get props => [message];
}