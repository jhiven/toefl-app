part of 'test_leaderboard_cubit.dart';

sealed class TestLeaderboardState extends Equatable {
  const TestLeaderboardState();

  @override
  List<Object> get props => [];
}

final class TestLeaderboardInitial extends TestLeaderboardState {}

final class TestLeaderboardLoading extends TestLeaderboardState {}

final class TestLeaderboardSuccess extends TestLeaderboardState {
  final List<TestLeaderboardModel> leaderboards;

  const TestLeaderboardSuccess({required this.leaderboards});

  @override
  List<Object> get props => [leaderboards];
}

final class TestLeaderboardError extends TestLeaderboardState {
  final String errorMSg;

  const TestLeaderboardError({required this.errorMSg});

  @override
  List<Object> get props => [errorMSg];
}
