import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/state/test_section/test_section_cubit.dart';
import 'package:toefl_app/presentation/test/screens/question_layout.dart';
import 'package:toefl_app/presentation/test/widgets/answer_list_button.dart';

class WrittenQuestion extends StatelessWidget {
  const WrittenQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return QuestionLayout(
      child: ListView(
        children: [
          _storyText(context),
          const SizedBox(
            height: 24,
          ),
          const AnswerListButton(),
        ],
      ),
    );
  }
}

_storyText(BuildContext context) {
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
