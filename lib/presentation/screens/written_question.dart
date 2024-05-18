import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/state/test_section/test_section_cubit.dart';
import 'package:toefl_app/presentation/screens/test_layout.dart';
import 'package:toefl_app/presentation/widgets/answer_list_button.dart';

class WrittenQuestion extends StatelessWidget {
  const WrittenQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return TestLayout(
      content: Column(
        children: [
          _storyText(context),
          const AnswerListButton(),
        ],
      ),
    );
  }
}

_storyText(BuildContext context) {
  final MediaQueryData queryData = MediaQuery.of(context);
  return Padding(
    padding: const EdgeInsets.only(left: 36.0, right: 36, top: 32, bottom: 20),
    child: Container(
      height: queryData.size.height * 0.3,
      width: queryData.size.width,
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
  );
}
