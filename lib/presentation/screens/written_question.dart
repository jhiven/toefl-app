import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/state/test_section/test_section_cubit.dart';
import 'package:toefl_app/domain/state/timer/timer_bloc.dart';
import 'package:toefl_app/presentation/widgets/question_page.dart';

class WrittenQuestion extends StatefulWidget {
  const WrittenQuestion({super.key});

  @override
  State<WrittenQuestion> createState() => _WrittenQuestionState();
}

class _WrittenQuestionState extends State<WrittenQuestion> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.timer),
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
                          return Text(
                            "Time left ${state.duration}",
                            style: const TextStyle(fontSize: 15),
                          );
                        case TimerRunComplete():
                          return const Text("Waktu Habis");
                      }
                    },
                  ),
                ],
              ),
              BlocBuilder<TestSectionCubit, TestSectionState>(
                builder: (context, state) {
                  switch (state.status) {
                    case TestSectionStatus.success:
                      return Padding(
                        padding: EdgeInsets.only(right: 4.0),
                        child: Text(
                          "Page ${state.currentQuestionIdx} of ${state.section.questionList.length}",
                          style: TextStyle(fontSize: 15),
                        ),
                      );
                    default:
                      return SizedBox();
                  }
                },
              )
            ],
          ),
        ),
        Stack(
          children: [
            QuestionPage(),
            _storyText(context, "What is your mother name boyyy ?")
          ],
        ),
      ],
    );
  }
}

_storyText(BuildContext context, String text) {
  late MediaQueryData queryData = MediaQuery.of(context);
  return Padding(
    padding: const EdgeInsets.only(left: 36.0, right: 36, top: 20, bottom: 20),
    child: Flexible(
      child: SizedBox(
        height: queryData.size.height * 0.3,
        width: queryData.size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: BlocBuilder<TestSectionCubit, TestSectionState>(
            builder: (context, state) {
              switch (state.status) {
                case TestSectionStatus.success:
                  if (state.currentQuestion.question != null) {
                    return Text(
                      state.currentQuestion.question!,
                      textAlign: TextAlign.justify,
                    );
                  } else {
                    return const SizedBox();
                  }
                default:
                  return SizedBox();
              }
            },
          ),
        ),
      ),
    ),
  );
}
