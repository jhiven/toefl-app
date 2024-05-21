import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/state/answer_cubit.dart';
import 'package:toefl_app/domain/state/button_next_cubit.dart';
import 'package:toefl_app/domain/state/cubit/example_question_cubit.dart';
import 'package:toefl_app/domain/state/material/material_cubit.dart';
import 'package:toefl_app/domain/state/modul_cubit.dart';
import 'package:toefl_app/learn/pages/listening_page.dart';
import 'package:toefl_app/learn/pages/readingtest_page.dart';
import 'package:toefl_app/learn/widget/bottom_backgorund.dart';
import 'package:toefl_app/learn/widget/button_next.dart';
import 'package:toefl_app/learn/widget/button_test.dart';
import 'package:toefl_app/learn/pages/question.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({super.key, required this.id});
  final int id;

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
              if (state2 is MaterialLoaded) {
                content =
                    state2.data.firstWhere((item) => item.id == id).content;
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
                            builder: (context) => _changeWidget(modul),
                          ),
                        );
                        context.read<ButtonNextCubit>().changeButton(false);
                        context.read<AnswerCubit>().resetAnswer();
                        context.read<ExampleQuestionCubit>().showQuestion(id);
                      },
                      child: ButtonTest(),
                    ),
                    button2: InkWell(
                      onTap: () {},
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

  Widget _changeWidget(String modul) {
    if (modul == 'Reading') {
      return ReadingTest(
        id: id,
      );
    } else if (modul == 'Listening') {
      return ListeningTest(
        id: id,
      );
    } else {
      return QuestionScreen();
    }
  }
}
