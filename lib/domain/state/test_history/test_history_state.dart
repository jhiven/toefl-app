part of 'test_history_cubit.dart';

sealed class TestHistoryState extends Equatable {
  const TestHistoryState();

  @override
  List<Object> get props => [];
}

final class TestHistoryInitial extends TestHistoryState {}

final class TestHistoryLoading extends TestHistoryState {}

final class TestHistorySuccess extends TestHistoryState {
  final List<TestHistoryModel> historyList;

  const TestHistorySuccess({required this.historyList});

  @override
  List<Object> get props => [historyList];
}

final class TestHistoryError extends TestHistoryState {
  final String errorMSg;

  const TestHistoryError({required this.errorMSg});

  @override
  List<Object> get props => [errorMSg];
}
