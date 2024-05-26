part of 'example_question_cubit.dart';

sealed class ExampleQuestionState extends Equatable {
  const ExampleQuestionState();

  @override
  List<Object> get props => [];
}

final class ExampleQuestionInitial extends ExampleQuestionState {}

final class MaterialQuestionLoading extends ExampleQuestionState {}

final class MaterialQuestionLoaded extends ExampleQuestionState {
  final MaterialQuestionModel data;

  const MaterialQuestionLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

final class MaterialQuestionError extends ExampleQuestionState {
  final String message;

  const MaterialQuestionError({required this.message});

  @override
  List<Object> get props => [message];
}