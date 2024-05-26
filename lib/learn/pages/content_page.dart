import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/models/material.dart';
import 'package:toefl_app/domain/state/answer_cubit.dart';
import 'package:toefl_app/domain/state/button_next_cubit.dart';
import 'package:toefl_app/domain/state/example_question/example_question_cubit.dart';
import 'package:toefl_app/domain/state/material/material_cubit.dart';
import 'package:toefl_app/domain/state/modul_cubit.dart';
import 'package:toefl_app/learn/pages/listening_page.dart';
import 'package:toefl_app/learn/pages/readingtest_page.dart';
import 'package:toefl_app/learn/widget/bottom_backgorund.dart';
import 'package:toefl_app/learn/widget/button_next.dart';
import 'package:toefl_app/learn/widget/button_test.dart';
import 'package:toefl_app/learn/pages/question.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModulCubit, ModulState>(
      builder: (context, state1) {
        return Scaffold(
          appBar: AppBar(
            title: state1 is ModulValue ? Text(state1.chapter) : Container(),
            centerTitle: true,
            forceMaterialTransparency: true,
          ),
          body: BlocBuilder<MaterialModulCubit, MaterialModulState>(
            builder: (context, state2) {
              String? content;
              int? id;
              List<MaterialModel>? data; 
              if (state2 is MaterialLoaded) {
                // content =
                //     state2.data.firstWhere((item) => item.id == id).content;
                data = state2.data;
                content = state2.data[index].content;
                id = state2.data[index].id;
              }
              return Stack(
                children: [
                  SizedBox(
                    height: double.infinity,
                    child: SingleChildScrollView(
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 150),
                          child: Text(content!)),
                    ),
                  ),
                  BottomBackground(
                    butoon1: InkWell(
                      onTap: () {
                        String modul = state1 is ModulValue ? state1.modul : '';
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => _changeWidget(modul, data!.length),
                          ),
                        );
                        context.read<ButtonNextCubit>().changeButton(false);
                        context.read<AnswerCubit>().resetAnswer();
                        context.read<ExampleQuestionCubit>().showQuestion(id!);
                      },
                      child: ButtonTest(),
                    ),
                    button2: InkWell(
                      onTap: () {
                        if (index + 1 < data!.length ) {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ContentPage(index: index+1),));
                          
                        }
                      },
                      child: ButtonNext(
                        next: true,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Widget _changeWidget(String modul, int length) {
    if (modul == 'Reading') {
      return ReadingTest(index: index, length: length,);
    } else if (modul == 'Listening') {
      return ListeningTest(index: index, length: length);
    } else {
      return QuestionScreen(index: index, length: length);
    }
  }
}
