import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/state/test_section/test_section_cubit.dart';
import 'package:toefl_app/presentation/test/screens/question_layout.dart';
import 'package:toefl_app/presentation/test/widgets/answer_list_button.dart';
import 'package:toefl_app/presentation/test/widgets/audio_player.dart';

class ListeningTest extends StatelessWidget {
  const ListeningTest({super.key});

  @override
  Widget build(BuildContext context) {
    return QuestionLayout(
      child: BlocBuilder<TestSectionCubit, TestSectionState>(
        builder: (context, state) {
          switch (state.status) {
            case TestSectionStatus.success:
              return ListView(
                children: [
                  AudioPlayerWidget(url: state.currentQuestion.url!),
                  const SizedBox(
                    height: 24,
                  ),
                  const AnswerListButton(),
                ],
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
