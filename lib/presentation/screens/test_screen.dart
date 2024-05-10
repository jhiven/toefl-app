import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/models/test_section_model.dart';
import 'package:toefl_app/domain/state/test_packet/test_packet_cubit.dart';
import 'package:toefl_app/domain/state/test_section/test_section_cubit.dart';
import 'package:toefl_app/domain/state/timer/timer_bloc.dart';
import 'package:toefl_app/presentation/screens/written_question.dart';
import 'package:toefl_app/presentation/widgets/audio_player.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: MultiBlocListener(
          listeners: [
            BlocListener<TestPacketCubit, TestPacketState>(
              listener: _onChangeSection,
              listenWhen: (previous, current) =>
                  previous is TestPacketAnswering &&
                  current is TestPacketAnswering &&
                  previous.currentSection != current.currentSection,
            ),
            BlocListener<TestPacketCubit, TestPacketState>(
              listener: _onChangeSection,
              listenWhen: (previous, current) =>
                  previous is TestPacketInitial &&
                  current is TestPacketAnswering,
            ),
          ],
          child: BlocBuilder<TestPacketCubit, TestPacketState>(
            builder: (context, state) {
              switch (state) {
                case TestPacketInitial():
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case TestPacketAnswering():
                  return WrittenQuestion();
                case TestPacketError():
                  return Text(state.errorMsg);
                case TestPacketDone():
                  return _buildTotalScoreView(
                    listeningScore: state.listeningScore,
                    structureScore: state.structureScore,
                    readingScore: state.readingScore,
                    totalScore: state.totalScore,
                  );
              }
            },
          ),
        ),
      ),
    );
  }

  void _onChangeSection(BuildContext context, TestPacketState state) {
    state as TestPacketAnswering;
    context.read<TestSectionCubit>().setTestSection(
          section: state.currentSection,
        );
    switch (state.currentSection.sectionType) {
      case SectionType.listening:
        context
            .read<TimerBloc>()
            .add(const TimerStarted(duration: Duration(seconds: 100)));
      case SectionType.structure:
        context
            .read<TimerBloc>()
            .add(const TimerStarted(duration: Duration(seconds: 25)));
      case SectionType.reading:
        context
            .read<TimerBloc>()
            .add(const TimerStarted(duration: Duration(seconds: 55)));
      default:
        break;
    }
  }

  Widget _buildQuestionView() {
    return BlocConsumer<TestSectionCubit, TestSectionState>(
      listener: (context, state) {
        context.read<TestPacketCubit>().calculateSectionScore(
              sectionType: state.section.sectionType,
              totalCorrect: state.totalCorrect,
            );
      },
      listenWhen: (previous, current) =>
          previous.status == TestSectionStatus.success &&
          current.status == TestSectionStatus.done,
      builder: (context, state) {
        switch (state.status) {
          case TestSectionStatus.initial:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case TestSectionStatus.success:
            final answerList = state.currentQuestion.answerList;
            return ListView(
              children: [
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
                if (state.section.sectionType == SectionType.listening)
                  AudioPlayerWidget(
                    url: state.currentQuestion.url!,
                  ),
                if (state.currentQuestion.question != null)
                  Text(state.currentQuestion.question!),
                ...answerList.map(
                  (answer) => ListTile(
                    title: Text(answer.answer),
                    onTap: () {
                      context
                          .read<TestSectionCubit>()
                          .setSelectedAnswer(answer: answer);
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<TestSectionCubit>().checkAnswer();
                    context.read<TestSectionCubit>().nextQuestion();
                  },
                  child: const Text('Next'),
                )
              ],
            );
          case TestSectionStatus.done:
            return _buildChangeSectionView(
              context: context,
              totalCorrect: state.totalCorrect,
              totalIncorrect: state.totalIncorrect,
            );
        }
      },
    );
  }

  Widget _buildChangeSectionView({
    required BuildContext context,
    required int totalCorrect,
    required int totalIncorrect,
  }) {
    return ListView(
      children: [
        const Text('Section Done'),
        Text('total correct: $totalCorrect'),
        Text('total incorrect: $totalIncorrect'),
        ElevatedButton(
          onPressed: () {
            context.read<TestPacketCubit>().nextSection();
          },
          child: const Text('Next'),
        ),
      ],
    );
  }

  Widget _buildTotalScoreView({
    required double listeningScore,
    required double structureScore,
    required double readingScore,
    required double totalScore,
  }) {
    return Text(
      'listeningScore: $listeningScore, structureScore: $structureScore, readingScore: $readingScore, total: $totalScore',
    );
  }
}
