import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/models/material_question.dart';
import 'package:toefl_app/domain/state/answer_cubit.dart';
import 'package:toefl_app/domain/state/button_next_cubit.dart';
import 'package:toefl_app/domain/state/cubit/example_question_cubit.dart';
import 'package:toefl_app/learn/widget/bottom_backgorund.dart';
import 'package:toefl_app/learn/widget/button_next.dart';

class ReadingTest extends StatefulWidget {
  const ReadingTest({super.key, required this.id});
  final int id;

  @override
  State<ReadingTest> createState() => _ReadingTestState();
}

class _ReadingTestState extends State<ReadingTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reading Test'),
        centerTitle: true,
        forceMaterialTransparency: true,
      ),
      body: Stack(
        children: [
          BlocBuilder<ExampleQuestionCubit, ExampleQuestionState>(
            builder: (context, state) {
              if (state is MaterialQuestionLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is MaterialQuestionLoaded) {
                MaterialQuestionModel question = state.data;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(question.question!)),
                      ...question.answerList.map((value) {
                        int index = question.answerList.indexOf(value);
                        return BlocBuilder<AnswerCubit, AnswerState>(
                          builder: (context, state1) {
                            return BlocBuilder<ButtonNextCubit,
                                ButtonNextState>(
                              builder: (context, state2) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, top: 10, bottom: 10),
                                  child: InkWell(
                                    onTap: () {
                                      if (state2 is ButtonNextChange &&
                                          !state2.next) {
                                        context
                                            .read<AnswerCubit>()
                                            .selectAnswer(index);
                                      }
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 143, 195, 244),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
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
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 20, left: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                value.answer,
                                                softWrap: true,
                                                overflow: TextOverflow.visible,
                                              ),
                                            ),
                                            state2 is ButtonNextChange &&
                                                    state2.next &&
                                                    value.value
                                                ? Icon(
                                                    Icons.check_circle,
                                                    color: Colors.green,
                                                  )
                                                : state2 is ButtonNextChange &&
                                                        state2.next &&
                                                        !value.value &&
                                                        state1 is AnswerPick &&
                                                        state1.isSelected[index]
                                                    ? Icon(
                                                        Icons.cancel,
                                                        color: Colors.red,
                                                      )
                                                    : Container()
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      }),
                      SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                );
              } else {
                return Center(child: Text('Failed to load data'));
              }
            },
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
