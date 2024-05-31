import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:toefl_app/data/repository/flip_card_repository.dart';
import 'package:toefl_app/domain/models/flip_card.dart';

part 'flip_card_data_state.dart';

class FlipCardDataCubit extends Cubit<FlipCardDataState> {
  final FlipCardRepository _flipCardRepository;

  FlipCardDataCubit(this._flipCardRepository) : super(FlipCardDataInitial());

  Future<void> showFlipCard() async{
    emit(FlipCardDataLoading());
    try {
      final List<FlipCardModel> data = await _flipCardRepository.getFlipCardWordData();
      print(data);
      emit(FlipCardDataLoaded(data: data));
    } catch (e) {
      emit(FlipCardDataError(message: e.toString()));
      throw Exception(e.toString());
    }
  }
}
