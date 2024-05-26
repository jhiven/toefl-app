import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:toefl_app/data/repository/pick_word_repository.dart';
import 'package:toefl_app/domain/models/pick_word.dart';

part 'pick_word_data_state.dart';

class PickWordDataCubit extends Cubit<PickWordDataState> {
  final PickWordRepository _pickWordRepository;

  PickWordDataCubit(this._pickWordRepository) : super(PickWordDataInitial());

  Future<void> showPickWord() async {
    emit(PickWordDataLoading());
    try {
      final List<PickWordModel> data = await _pickWordRepository.getPickWordData();
      final Map<String, int> typeCount = {};
      for (var model in data) {
        typeCount[model.type] = (typeCount[model.type] ?? 0) + 1;
      }

      int maxCount = typeCount.values.fold(0, (currentMax, count) => count > currentMax ? count : currentMax);

      String question = '';
      for (var model in data) {
        if (typeCount[model.type] == maxCount) {
          question = model.type;
          break;
        }
      }
      List<String> answer = data
          .where((model) => model.type == question)
          .map((model) => model.word)
          .toList();
      emit(PickWordDataLoaded(data: data, question: question, answer: answer));
    } catch (e) {
      emit(PickWordDataError(message: e.toString()));
      throw Exception(e.toString());
    }
  }
}
