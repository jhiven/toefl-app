import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/models/material_question.dart';
import 'package:toefl_app/domain/state/answer_cubit.dart';
import 'package:toefl_app/domain/state/button_next_cubit.dart';
import 'package:toefl_app/domain/state/example_question/example_question_cubit.dart';
import 'package:toefl_app/learn/pages/content_page.dart';
import 'package:toefl_app/learn/widget/audioplayer.dart';
import 'package:toefl_app/learn/widget/bottom_backgorund.dart';
import 'package:toefl_app/learn/widget/button_next.dart';

class ListeningTest extends StatelessWidget {
  const ListeningTest({super.key, required this.index, required this.length});
  final int index;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Player Exmaple'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: BlocBuilder<ExampleQuestionCubit, ExampleQuestionState>(
              builder: (context, state) {
                if (state is MaterialQuestionLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is MaterialQuestionLoaded) {
                  MaterialQuestionModel question = state.data;
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'Audio Player',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: MusicPlayer(
                          url: question.url!,
                        ),
                      ),
                      Wrap(
                        alignment: WrapAlignment.spaceAround,
                        children: [
                          ...question.answerList.map((value) {
                            int index = question.answerList.indexOf(value);
                            return BlocBuilder<AnswerCubit, AnswerState>(
                              builder: (context, state1) {
                                return BlocBuilder<ButtonNextCubit,
                                    ButtonNextState>(
                                  builder: (context, state2) {
                                    return InkWell(
                                      onTap: () {
                                        if (state2 is ButtonNextChange &&
                                            !state2.next) {
                                          context
                                              .read<AnswerCubit>()
                                              .selectAnswer(index);
                                        }
                                      },
                                      child: Container(
                                        width: 150,
                                        height: 150,
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 193, 227, 255),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: state1 is AnswerPick &&
                                                  state1.isSelected[index]
                                              ? Border.all(
                                                  color: state2
                                                              is ButtonNextChange &&
                                                          state2.next &&
                                                          !value.value
                                                      ? Colors.red
                                                      : state2 is ButtonNextChange &&
                                                              state2.next &&
                                                              value.value
                                                          ? Colors.green
                                                          : Colors.black,
                                                  width: 2,
                                                )
                                              : state2 is ButtonNextChange &&
                                                      state2.next
                                                  ? Border.all(
                                                      color: value.value
                                                          ? Colors.green
                                                          : Colors.transparent,
                                                      width: 2,
                                                    )
                                                  : null,
                                        ),
                                        margin: EdgeInsets.all(12),
                                        alignment: Alignment.center,
                                        child: Text(
                                          value.answer,
                                          style: TextStyle(
                                              fontSize: 60,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          }),
                        ],
                      ),
                    ],
                  );
                } else {
                  return Center(child: Text('Failed to load data'));
                }
              },
            ),
          ),
          BottomBackground(
            butoon1: Container(),
            button2: BlocBuilder<ButtonNextCubit, ButtonNextState>(
              builder: (context, state1) {
                bool next = state1 is ButtonNextChange ? state1.next : false;
                return BlocBuilder<AnswerCubit, AnswerState>(
                  builder: (context, state2) {
                    return InkWell(
                      onTap: () {
                        if (state2 is AnswerPick
                            ? state2.isSelected.contains(true)
                            : false) {
                          if (next) {
                            context.read<ButtonNextCubit>().changeButton(false);
                            context.read<AnswerCubit>().resetAnswer();
                            if (index + 1 < length ) {
                              Navigator.of(context).pop();
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ContentPage(index: index+1),));
                            }
                          } else {
                            context.read<ButtonNextCubit>().changeButton(true);
                          }
                        }
                      },
                      child: ButtonNext(
                        next: next,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
