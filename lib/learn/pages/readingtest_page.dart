import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/state/answer_cubit.dart';
import 'package:toefl_app/domain/state/button_next_cubit.dart';
import 'package:toefl_app/learn/widget/bottom_backgorund.dart';
import 'package:toefl_app/learn/widget/button_next.dart';

class ReadingTest extends StatefulWidget {
  const ReadingTest({super.key});

  @override
  State<ReadingTest> createState() => _ReadingTestState();
}

class _ReadingTestState extends State<ReadingTest> {
  bool isClicked = false;

  void toggleBorder() {
    setState(() {
      isClicked = !isClicked;
    });
  }

  @override
  Widget build(BuildContext context) {

    List<Jawaban> answer = [
      Jawaban(text: 'A. Willowbrook', benar: false),
      Jawaban(text: 'B. Mistwood', benar: false),
      Jawaban(text: 'C. Fernhaven', benar: true),
      Jawaban(text: 'D. Fernhaven', benar: false),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reading Test'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: RichText(
                          text: TextSpan(
                            text:
                                'Once upon a time...Once upon a time, in a quaint little village nestled between rolling hills and lush forests, there lived a young girl named Elara. Elara was known throughout the village for her adventurous',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      ...answer.map((value) {
                        int index = answer.indexOf(value);
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
                                      if (state2 is ButtonNextChange && !state2.next) {
                                        context.read<AnswerCubit>().selectAnswer(index);
                                      }
                                    },
                                    child: Container(
                                      height: 50,
                                      width: double.infinity,
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
                                                        !value.benar
                                                    ? Colors.red
                                                    : state2 is ButtonNextChange &&
                                                            state2.next &&
                                                            value.benar
                                                        ? Colors.green
                                                        : Colors.black,
                                                width: 2,
                                              )
                                            : state2 is ButtonNextChange &&
                                                    state2.next
                                                ? Border.all(
                                                    color: value.benar
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
                                            Text(value.text),
                                            state2 is ButtonNextChange &&
                                                    state2.next &&
                                                    value.benar
                                                ? Icon(
                                                    Icons.check_circle,
                                                    color: Colors.green,
                                                  )
                                                : state2 is ButtonNextChange &&
                                                        state2.next &&
                                                        !value.benar &&
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
                    ],
                  ),
                ),
              ),
            ],
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

class Jawaban {
  final String text;
  final bool benar;

  Jawaban({required this.text, required this.benar});
}
