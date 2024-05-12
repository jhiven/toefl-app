import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/state/answer_cubit.dart';
import 'package:toefl_app/domain/state/button_next_cubit.dart';
import 'package:toefl_app/learn/pages/readingtest_page.dart';
import 'package:toefl_app/learn/widget/audioplayer.dart';
import 'package:toefl_app/learn/widget/answer_widget.dart';
import 'package:toefl_app/learn/widget/bottom_backgorund.dart';
import 'package:toefl_app/learn/widget/button_next.dart';

class ListeningTest extends StatelessWidget {
  const ListeningTest({super.key});

  @override
  Widget build(BuildContext context) {
    List<Jawaban> answer = [
      Jawaban(text: 'A', benar: true),
      Jawaban(text: 'B', benar: false),
      Jawaban(text: 'C', benar: false),
      Jawaban(text: 'D', benar: false),
    ];
    return Scaffold(
      appBar: AppBar(
          title: Text('Audio Player Exmaple'),
          centerTitle: true,
          ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Audio Player',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: MusicPlayer(
                    url:
                        'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
                  ),
                ),
                Wrap(
                  alignment: WrapAlignment.spaceAround,
                  children: [
                    ...answer.map((value) {
                      int index = answer.indexOf(value);
                      return BlocBuilder<AnswerCubit, AnswerState>(
                        builder: (context, state1) {
                          return BlocBuilder<ButtonNextCubit, ButtonNextState>(
                            builder: (context, state2) {
                              return InkWell(
                                onTap: () {
                                  if (state2 is ButtonNextChange && !state2.next) {
                                    context.read<AnswerCubit>().selectAnswer(index);
                                  }
                                },
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 193, 227, 255),
                                    borderRadius: BorderRadius.circular(15),
                                    border: state1 is AnswerPick &&
                                            state1.isSelected[index]
                                        ? Border.all(
                                            color: state2 is ButtonNextChange &&
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
                                  margin: EdgeInsets.all(12),
                                  alignment: Alignment.center,
                                  child: Text(
                                    value.text,
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
