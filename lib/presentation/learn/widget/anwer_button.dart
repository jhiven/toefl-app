import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/models/material_answer.dart';
import 'package:toefl_app/domain/state/answer_cubit.dart';
import 'package:toefl_app/domain/state/button_next_cubit.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.answer, required this.index, required this.pilihan});
  final MaterialAnswerModel answer;
  final int index;
  final String pilihan;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnswerCubit, AnswerState>(
      builder: (context, state1) {
        return BlocBuilder<ButtonNextCubit, ButtonNextState>(
          builder: (context, state2) {
            return Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: InkWell(
                onTap: () {
                  if (state2 is ButtonNextChange && !state2.next) {
                    context.read<AnswerCubit>().selectAnswer(index);
                  }
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 143, 195, 244),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    border: state1 is AnswerPick && state1.isSelected[index]
                        ? Border.all(
                            color: state2 is ButtonNextChange &&
                                    state2.next &&
                                    !answer.value
                                ? Colors.red
                                : state2 is ButtonNextChange &&
                                        state2.next &&
                                        answer.value
                                    ? Colors.green
                                    : Colors.black,
                            width: 2,
                          )
                        : state2 is ButtonNextChange && state2.next
                            ? Border.all(
                                color: answer.value
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
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Text(pilihan),
                        ),
                        Expanded(
                          child: Text(
                            answer.answer,
                          ),
                        ),
                        state2 is ButtonNextChange && state2.next && answer.value
                            ? Icon(
                                Icons.check_circle,
                                color: Colors.green,
                                size: 20,
                              )
                            : state2 is ButtonNextChange &&
                                    state2.next &&
                                    !answer.value &&
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
  }
}
