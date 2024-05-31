import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:toefl_app/data/repository/synonym_repository.dart';
import 'package:toefl_app/domain/models/synonym.dart';

part 'synonym_data_state.dart';

class SynonymDataCubit extends Cubit<SynonymDataState> {
  final SynonymRepository _synonymRepository;

  SynonymDataCubit(this._synonymRepository) : super(SynonymDataInitial());

  Future<void> showSynonym() async {
    emit(SynonymDataLoading());
    try {
      final List<SynonymModel> data = await _synonymRepository.getSynonymData();
      final List<SynonymModel> dataRandom = List<SynonymModel>.from(data);
      while (listEquals(data, dataRandom)) {
        dataRandom.shuffle();
      }
      print(data);
      print(dataRandom);
      emit(SynonymDataLoaded(data: data, dataRandom: dataRandom));
    } catch (e) {
      emit(SynonymDataError(message: e.toString()));
      throw Exception(e.toString());
    }
  }
}
