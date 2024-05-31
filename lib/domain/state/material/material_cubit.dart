import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:toefl_app/data/repository/meterial_repository.dart';
import 'package:toefl_app/domain/models/material.dart';

part 'material_state.dart';

class MaterialModulCubit extends Cubit<MaterialModulState> {
  final MaterialRepository _materialRepository;

  MaterialModulCubit(this._materialRepository) : super(MaterialInitial());

  Future<void> selectModul(int id) async{
    emit(MaterialLoading());
    try {
      final List<MaterialModel> data = await _materialRepository.getMaterial(id);
      emit(MaterialLoaded(data: data));
    } catch (e) {
      emit(MaterialError(message: e.toString()));
    }
  }
}
