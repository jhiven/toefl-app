import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:toefl_app/data/repository/example_question.dart';
import 'package:toefl_app/domain/models/material_answer.dart';
import 'package:toefl_app/domain/models/material_question.dart';

part 'example_question_state.dart';

class ExampleQuestionCubit extends Cubit<ExampleQuestionState> {
  final ExampleRepository _materialRepository;

  ExampleQuestionCubit(this._materialRepository) : super(ExampleQuestionInitial());

  Future<void> showQuestion(int id) async{
    emit(MaterialQuestionLoading());
    try {
      final MaterialQuestionModel allData = await _materialRepository.getQuestion(id);
      final List<MaterialAnswerModel> randomAnswer = allData.answerList;
      randomAnswer.shuffle(); 
      final MaterialQuestionModel data = MaterialQuestionModel(question: allData.question, url: allData.url, answerList: randomAnswer, pembahasan: allData.pembahasan);
      emit(MaterialQuestionLoaded(data: data));
    } catch (e) {
      emit(MaterialQuestionError(message: e.toString()));
      throw Exception(e.toString());
    }
  }
}
