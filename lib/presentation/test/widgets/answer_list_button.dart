import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/state/test_section/test_section_cubit.dart';
import 'package:toefl_app/presentation/test/widgets/secondary_button.dart';

class AnswerListButton extends StatelessWidget {
  const AnswerListButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestSectionCubit, TestSectionState>(
      builder: (context, state) {
        switch (state.status) {
          case TestSectionStatus.success:
            final answerList = state.currentQuestion.answerList;
            return Center(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: answerList.length,
                itemBuilder: (context, index) {
                  final answer = answerList[index];
                  print(
                    'selected answer: ${state.currentQuestion.selectedAnswer}',
                  );
                  return SecondaryButton(
                    opsi: String.fromCharCode(65 + index),
                    text: answer.answer,
                    isSelected: answer == state.currentQuestion.selectedAnswer,
                    onPressed: () {
                      context
                          .read<TestSectionCubit>()
                          .setSelectedAnswer(answer: answer);
                    },
                  );
                },
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
