import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:toefl_app/data/repository/test_repository.dart';
import 'package:toefl_app/domain/models/test_history_model.dart';

part 'test_history_state.dart';

class TestHistoryCubit extends Cubit<TestHistoryState> {
  final TestRepository _testRepository;

  TestHistoryCubit({
    required TestRepository testRepository,
  })  : _testRepository = testRepository,
        super(TestHistoryInitial());

  Future<void> getHistory({
    required String userId,
  }) async {
    try {
      emit(TestHistoryLoading());
      final historyList = await _testRepository.getHistory(userId: userId);

      emit(TestHistorySuccess(historyList: historyList));
    } catch (e) {
      emit(TestHistoryError(errorMSg: e.toString()));
      throw Exception(e.toString());
    }
  }
}
