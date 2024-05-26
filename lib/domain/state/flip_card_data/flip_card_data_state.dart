part of 'flip_card_data_cubit.dart';

sealed class FlipCardDataState extends Equatable {
  const FlipCardDataState();

  @override
  List<Object> get props => [];
}

final class FlipCardDataInitial extends FlipCardDataState {}

final class FlipCardDataLoading extends FlipCardDataState {}

final class FlipCardDataLoaded extends FlipCardDataState {
  final List<FlipCardModel> data;

  const FlipCardDataLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

final class FlipCardDataError extends FlipCardDataState {
  final String message;

  const FlipCardDataError({required this.message});

  @override
  List<Object> get props => [message];
}