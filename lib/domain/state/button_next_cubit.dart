import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'button_next_state.dart';

class ButtonNextCubit extends Cubit<ButtonNextState> {
  ButtonNextCubit() : super(ButtonNextInitial());
  
  void changeButton(bool next){
    emit(ButtonNextChange(next: next));
  }
}