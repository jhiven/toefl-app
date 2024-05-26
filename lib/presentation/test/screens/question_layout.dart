import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/state/test_section/test_section_cubit.dart';
import 'package:toefl_app/domain/state/timer/timer_bloc.dart';
import 'package:toefl_app/presentation/test/screens/test_layout.dart';

class QuestionLayout extends StatelessWidget {
  const QuestionLayout({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TestLayout(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 8,
            ),
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
                              "Time left ${state.formattedDuration}",
                              style: const TextStyle(fontSize: 15),
                            );
                          case TimerRunComplete():
                            return const Text("Waktu Habis");
                        }
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    BlocBuilder<TestSectionCubit, TestSectionState>(
                      builder: (context, state) {
                        switch (state.status) {
                          case TestSectionStatus.success:
                            return Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: Text(
                                "${state.currentQuestionIdx + 1} / ${state.section.questionList.length}",
                                style: const TextStyle(fontSize: 15),
                              ),
                            );
                          default:
                            return const SizedBox();
                        }
                      },
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                      ),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: const Icon(
                        Icons.menu,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
