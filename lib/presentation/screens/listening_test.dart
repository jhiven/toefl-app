import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/state/test_packet/test_packet_cubit.dart';
import 'package:toefl_app/domain/state/test_section/test_section_cubit.dart';
import 'package:toefl_app/domain/state/timer/timer_bloc.dart';
import 'package:toefl_app/presentation/widgets/audio_player.dart';
import 'package:toefl_app/presentation/widgets/primary_button.dart';
import 'package:toefl_app/presentation/widgets/secondary_button.dart';

class ListeningTest extends StatelessWidget {
  const ListeningTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<TestSectionCubit, TestSectionState>(
                builder: (context, state) {
                  switch (state.status) {
                    case TestSectionStatus.success:
                      return Text(
                          "Question ${state.currentQuestionIdx + 1}/${state.section.questionList.length}");
                    default:
                      return const SizedBox();
                  }
                },
              ),
              BlocConsumer<TimerBloc, TimerState>(
                listener: (context, state) {
                  context.read<TestSectionCubit>().sectionTimeout();
                },
                listenWhen: (previous, current) =>
                    previous is TimerRunInProgress &&
                    current is TimerRunComplete,
                builder: (context, state) {
                  switch (state) {
                    case TimerInitial():
                      return const CircularProgressIndicator();
                    case TimerRunInProgress():
                      return Text('waktu: ${state.duration}');
                    case TimerRunComplete():
                      return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: BlocBuilder<TestSectionCubit, TestSectionState>(
              builder: (context, state) {
                switch (state.status) {
                  case TestSectionStatus.success:
                    final answerList = state.currentQuestion.answerList;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        AudioPlayerWidget(url: state.currentQuestion.url!),
                        const SizedBox(
                          height: 20,
                        ),
                        Spacer(),
                        SecondaryButton(
                          opsi: "A",
                          text: answerList[0].answer,
                          onPressed: () {
                            context
                                .read<TestSectionCubit>()
                                .setSelectedAnswer(answer: answerList[0]);
                          },
                        ),
                        SecondaryButton(
                          opsi: "B",
                          text: answerList[1].answer,
                          onPressed: () {
                            context
                                .read<TestSectionCubit>()
                                .setSelectedAnswer(answer: answerList[1]);
                          },
                        ),
                        SecondaryButton(
                          opsi: "C",
                          text: answerList[2].answer,
                          onPressed: () {
                            context
                                .read<TestSectionCubit>()
                                .setSelectedAnswer(answer: answerList[2]);
                          },
                        ),
                        SecondaryButton(
                          opsi: "D",
                          text: answerList[3].answer,
                          onPressed: () {
                            context
                                .read<TestSectionCubit>()
                                .setSelectedAnswer(answer: answerList[3]);
                          },
                        ),
                        const Spacer(),
                        PrimaryButton(
                          onPressed: () {
                            final status =
                                context.read<TestSectionCubit>().state.status;
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
    );
  }
}
