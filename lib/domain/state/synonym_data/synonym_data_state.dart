part of 'synonym_data_cubit.dart';

sealed class SynonymDataState extends Equatable {
  const SynonymDataState();

  @override
  List<Object> get props => [];
}

final class SynonymDataInitial extends SynonymDataState {}

final class SynonymDataLoading extends SynonymDataState {}

final class SynonymDataLoaded extends SynonymDataState {
  final List<SynonymModel> data;
  final List<SynonymModel> dataRandom;

  const SynonymDataLoaded({required this.data, required this.dataRandom});

  @override
  List<Object> get props => [data];
}

final class SynonymDataError extends SynonymDataState {
  final String message;

  const SynonymDataError({required this.message});

  @override
  List<Object> get props => [message];
}