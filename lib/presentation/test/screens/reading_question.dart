import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/state/test_section/test_section_cubit.dart';
import 'package:toefl_app/presentation/test/screens/question_layout.dart';
import 'package:toefl_app/presentation/test/widgets/answer_list_button.dart';

class ReadingQuestion extends StatelessWidget {
  const ReadingQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return QuestionLayout(
      child: ListView(
        children: [
          _storyText(),
          const SizedBox(
            height: 12,
          ),
          _questionCard(),
          const SizedBox(
            height: 12,
          ),
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

_questionCard() {
  return BlocBuilder<TestSectionCubit, TestSectionState>(
    builder: (context, state) {
      switch (state.status) {
        case TestSectionStatus.success:
          if (state.currentQuestion.question != null) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: const Color.fromRGBO(196, 209, 222, 1),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  state.currentQuestion.question!,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
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
