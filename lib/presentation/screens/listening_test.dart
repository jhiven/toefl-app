import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/state/test_section/test_section_cubit.dart';
import 'package:toefl_app/presentation/screens/test_layout.dart';
import 'package:toefl_app/presentation/widgets/answer_list_button.dart';
import 'package:toefl_app/presentation/widgets/audio_player.dart';

class ListeningTest extends StatelessWidget {
  const ListeningTest({super.key});

  @override
  Widget build(BuildContext context) {
    return TestLayout(
      content: BlocBuilder<TestSectionCubit, TestSectionState>(
        builder: (context, state) {
          switch (state.status) {
            case TestSectionStatus.success:
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  AudioPlayerWidget(url: state.currentQuestion.url!),
                  const SizedBox(
                    height: 20,
                  ),
                  const Spacer(),
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
