import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/models/material_question.dart';
import 'package:toefl_app/domain/state/answer_cubit.dart';
import 'package:toefl_app/domain/state/button_next_cubit.dart';
import 'package:toefl_app/domain/state/example_question/example_question_cubit.dart';
import 'package:toefl_app/presentation/learn/pages/content_page.dart';
import 'package:toefl_app/presentation/learn/widget/audioplayer.dart';
import 'package:toefl_app/presentation/learn/widget/bottom_backgorund.dart';
import 'package:toefl_app/presentation/learn/widget/button_next.dart';

class ListeningTest extends StatelessWidget {
  const ListeningTest({super.key, required this.index, required this.length});
  final int index;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Player'),
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
                        padding: const EdgeInsets.all(20),
                        child: MusicPlayer(
                          url: question.url!,
                        ),
                      ),
                      Column(
                        children: [
                          ...question.answerList.map((value) {
                            int index = question.answerList.indexOf(value);
                            return BlocBuilder<AnswerCubit, AnswerState>(
                              builder: (context, state1) {
                                return BlocBuilder<ButtonNextCubit,
                                    ButtonNextState>(
                                  builder: (context, state2) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
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
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        child: Container(
                                          padding: EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 193, 227, 255),
                                            borderRadius:
                                                BorderRadius.circular(30),
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
                                                    : Border.all(
                                                        color: Colors.transparent,
                                                        width: 2,
                                                      ),
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
                                                    size: 20,
                                                  )
                                                : state2 is ButtonNextChange &&
                                                        state2.next &&
                                                        !value.value &&
                                                        state1 is AnswerPick &&
                                                        state1.isSelected[index]
                                                    ? Icon(
                                                        Icons.cancel,
                                                        color: Colors.red,
                                                        size: 20,
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
          BlocBuilder<ButtonNextCubit, ButtonNextState>(
            builder: (context, state1) {
              bool next = state1 is ButtonNextChange ? state1.next : false;
              if (next && index + 1 == length) {
                return Container();
              } else {
                return BottomBackground(
                  butoon1: Container(),
                  button2: BlocBuilder<AnswerCubit, AnswerState>(
                    builder: (context, state2) {
                      return InkWell(
                        onTap: () {
                          if (state2 is AnswerPick
                              ? state2.isSelected.contains(true)
                              : false) {
                            if (next) {
                              context
                                  .read<ButtonNextCubit>()
                                  .changeButton(false);
                              context.read<AnswerCubit>().resetAnswer();
                              if (index + 1 < length) {
                                Navigator.of(context).pop();
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ContentPage(index: index + 1),
                                    ));
                              }
                            } else {
                              context
                                  .read<ButtonNextCubit>()
                                  .changeButton(true);
                            }
                          }
                        },
                        child: ButtonNext(
                          next: next,
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
