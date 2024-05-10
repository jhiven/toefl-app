import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/state/test_packet/test_packet_cubit.dart';
import 'package:toefl_app/domain/state/test_section/test_section_cubit.dart';
import 'package:toefl_app/presentation/widgets/primary_button.dart';
import 'package:toefl_app/presentation/widgets/secondary_button.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  late MediaQueryData queryData = MediaQuery.of(context);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: queryData.size.width,
      height: queryData.size.height - queryData.padding.top - 40,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20,
          bottom: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  width: queryData.size.width,
                  height: queryData.size.height * 0.8,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.primary),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 20),
                    child: BlocBuilder<TestSectionCubit, TestSectionState>(
                      builder: (context, state) {
                        switch (state.status) {
                          case TestSectionStatus.success:
                            final answerList = state.currentQuestion.answerList;
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SecondaryButton(
                                  opsi: "A",
                                  text: answerList[0].answer,
                                  onPressed: () {
                                    context
                                        .read<TestSectionCubit>()
                                        .setSelectedAnswer(
                                            answer: answerList[0]);
                                  },
                                ),
                                SecondaryButton(
                                  opsi: "B",
                                  text: answerList[1].answer,
                                  onPressed: () {
                                    context
                                        .read<TestSectionCubit>()
                                        .setSelectedAnswer(
                                            answer: answerList[1]);
                                  },
                                ),
                                SecondaryButton(
                                  opsi: "C",
                                  text: answerList[2].answer,
                                  onPressed: () {
                                    context
                                        .read<TestSectionCubit>()
                                        .setSelectedAnswer(
                                            answer: answerList[2]);
                                  },
                                ),
                                SecondaryButton(
                                  opsi: "D",
                                  text: answerList[3].answer,
                                  onPressed: () {
                                    context
                                        .read<TestSectionCubit>()
                                        .setSelectedAnswer(
                                            answer: answerList[3]);
                                  },
                                ),
                              ],
                            );

                          default:
                            return const SizedBox();
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            PrimaryButton(
              text: "Next",
              icon: Icons.arrow_forward,
              onPressed: () {
                final status = context.read<TestSectionCubit>().state.status;
                switch (status) {
                  case TestSectionStatus.initial:
                    break;
                  case TestSectionStatus.success:
                    context.read<TestSectionCubit>().checkAnswer();
                    context.read<TestSectionCubit>().nextQuestion();
                  case TestSectionStatus.done:
                    context.read<TestPacketCubit>().nextSection();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
