import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/models/material_question.dart';
import 'package:toefl_app/domain/state/answer_cubit.dart';
import 'package:toefl_app/domain/state/button_next_cubit.dart';
import 'package:toefl_app/domain/state/example_question/example_question_cubit.dart';
import 'package:toefl_app/presentation/learn/pages/content_page.dart';
import 'package:toefl_app/presentation/learn/widget/anwer_button.dart';
import 'package:toefl_app/presentation/learn/widget/audioplayer.dart';
import 'package:toefl_app/presentation/learn/widget/bottom_backgorund.dart';
import 'package:toefl_app/presentation/learn/widget/button_next.dart';
import 'package:toefl_app/presentation/learn/widget/pembahasan_widget.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.index, required this.length});
  final int index;
  final int length;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  List<String> pilihan =['A', 'B', 'C', 'D'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example Question'),
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
                return Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            question.question != null && question.question!.isNotEmpty
                                ? Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Text(question.question!))
                                : Container(),
                            question.url != null && question.url!.isNotEmpty
                                ? Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: MusicPlayer(
                                      url: question.url!,
                                    ),
                                  )
                                : Container(),
                            PembahasanWidget(question: question),
                            ...question.answerList.map((value) {
                              int index = question.answerList.indexOf(value);
                              return AnswerButton(pilihan: pilihan[index], answer: value, index: index);
                            }),
                            const SizedBox(
                              height: 100,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Center(child: Text('Failed to load data'));
              }
            },
          ),
          BlocBuilder<ButtonNextCubit, ButtonNextState>(
            builder: (context, state1) {
              bool next = state1 is ButtonNextChange ? state1.next : false;
              if (next && widget.index + 1 == widget.length) {
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
                              if (widget.index + 1 < widget.length) {
                                Navigator.of(context).pop();
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ContentPage(index: widget.index + 1),
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
