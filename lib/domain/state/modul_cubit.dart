import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'modul_state.dart';

class ModulCubit extends Cubit<ModulState> {
  ModulCubit() : super(ModulInitial());

  void pickModul(String modul){
    emit(ModulValue(modul: modul,chapter: ''));
  } 

  void pickChapter(String chapter){
    final currentstate = state as ModulValue;
    emit(ModulValue(modul: currentstate.modul, chapter: chapter));
  }
}

