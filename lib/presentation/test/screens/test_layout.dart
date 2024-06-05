import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/state/test_packet/test_packet_cubit.dart';
import 'package:toefl_app/domain/state/test_section/test_section_cubit.dart';
import 'package:toefl_app/domain/state/user/user_cubit.dart';
import 'package:toefl_app/presentation/test/widgets/dialog_confirm.dart';
import 'package:toefl_app/presentation/test/widgets/primary_button.dart';

class TestLayout extends StatelessWidget {
  const TestLayout({
    super.key,
    required this.child,
    this.buttonText,
  });

  final Widget child;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: child,
            ),
            const SizedBox(
              height: 12,
            ),
            PrimaryButton(
              onPressed: () {
                final sectionCubit = context.read<TestSectionCubit>();
                final packetCubit = context.read<TestPacketCubit>();

                switch (packetCubit.state) {
                  case TestPacketAnswering():
                    switch (sectionCubit.state.status) {
                      case TestSectionStatus.initial:
                        break;
                      case TestSectionStatus.success:
                        if (sectionCubit.state.isShowInstruction) {
                          sectionCubit.startSection();
                        } else {
                          if (sectionCubit.state.currentQuestionIdx ==
                              sectionCubit.state.section.questionList.length -
                                  1) {
                            showDialog(
                              context: context,
                              builder: (context) => DialogConfirm(),
                            );
                          } else {
                            sectionCubit.checkAnswer();

                            sectionCubit.nextQuestion();
                          }
                        }
                      case TestSectionStatus.done:
                        packetCubit.nextSection();
                    }
                  case TestPacketDone():
                    context.read<UserCubit>().getSession();

                    Navigator.popUntil(
                      context,
                      (route) => route.isFirst,
                    );
                  default:
                    break;
                }
              },
              icon: null,
              text: buttonText ?? "Next",
            )
          ],
        ),
      ),
    );
  }
}
