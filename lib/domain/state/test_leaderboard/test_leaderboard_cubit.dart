import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:toefl_app/data/repository/test_repository.dart';
import 'package:toefl_app/domain/models/test_leaderboard_model.dart';

part 'test_leaderboard_state.dart';

class TestLeaderboardCubit extends Cubit<TestLeaderboardState> {
  final TestRepository _testRepository;

  TestLeaderboardCubit({required TestRepository testRepository})
      : _testRepository = testRepository,
        super(TestLeaderboardInitial());

  void getLeaderboard() async {
    try {
      emit(TestLeaderboardLoading());
      final leaderboards = await _testRepository.getLeaderboard();

      emit(TestLeaderboardSuccess(leaderboards: leaderboards));
    } catch (e) {
      emit(TestLeaderboardError(errorMSg: e.toString()));
      throw Exception(e.toString());
    }
  }
}
