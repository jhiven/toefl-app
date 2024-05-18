import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/state/test_section/test_section_cubit.dart';
import 'package:toefl_app/presentation/screens/test_layout.dart';
import 'package:toefl_app/presentation/widgets/answer_list_button.dart';

class ReadingQuestion extends StatelessWidget {
  const ReadingQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return TestLayout(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _storyText(),
          _questionCard(),
          const AnswerListButton(),
        ],
      ),
    );
  }
}

_storyText() {
  return BlocBuilder<TestSectionCubit, TestSectionState>(
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
          return const SizedBox();
      }
    },
  );
}

_questionCard() {
  return BlocBuilder<TestSectionCubit, TestSectionState>(
    builder: (context, state) {
      switch (state.status) {
        case TestSectionStatus.success:
          if (state.currentQuestion.text != null) {
            return Text(
              state.currentQuestion.text!,
              textAlign: TextAlign.justify,
            );
          } else {
            return const SizedBox();
          }
        default:
          return const SizedBox();
      }
    },
  );
}
