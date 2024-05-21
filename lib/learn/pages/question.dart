import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/models/material_question.dart';
import 'package:toefl_app/domain/state/answer_cubit.dart';
import 'package:toefl_app/domain/state/button_next_cubit.dart';
import 'package:toefl_app/domain/state/cubit/example_question_cubit.dart';
import 'package:toefl_app/learn/widget/bottom_backgorund.dart';
import 'package:toefl_app/learn/widget/button_next.dart';
import 'package:toefl_app/learn_grammar/style.dart';


class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    String? answer;
    MaterialQuestionModel? question;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grammer test'),
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
                question = state.data;
                return Padding(
                  padding: EdgeInsets.only(
                      top: 89.0, left: 30, right: 30, bottom: 81.0),
                  child: Column(
                    children: [
                      Text(
                        question!.question!,
                      ),
                      BlocBuilder<AnswerCubit, AnswerState>(
                        builder: (context, state3) {
                          if (state3 is AnswerCorrectness) {
                            bool isCorrect = state3.isCorrect;
                            if (!isCorrect) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Container(
                                  width: double.infinity,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                    color: Colors.green,
                                  ),
                                  child: Center(child: Text(question!.answerList.first.answer, style: TextStyle(color: Colors.white),)),
                                ),
                              );
                            } else {
                              return Container();
                            }
                          } else {
                            return Container();
                          }
                        },
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          onChanged: (value) {
                            answer = value;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9.0),
                                  borderSide:
                                      BorderSide(color: kPrimary, width: 1.0),),),
                        ),
                      ),
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
                        if (answer!.isNotEmpty) {
                          if (next) {
                            context.read<ButtonNextCubit>().changeButton(false);
                          } else {
                            context.read<ButtonNextCubit>().changeButton(true);
                            context.read<AnswerCubit>().checkAnswer(
                                question!.answerList.first.answer, answer!);
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
