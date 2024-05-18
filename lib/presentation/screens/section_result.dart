import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/models/test_section_model.dart';
import 'package:toefl_app/domain/state/test_packet/test_packet_cubit.dart';
import 'package:toefl_app/domain/state/test_section/test_section_cubit.dart';
import 'package:toefl_app/presentation/widgets/result.dart';

class SectionResult extends StatelessWidget {
  const SectionResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TestSectionCubit, TestSectionState>(
      listener: (context, state) {
        context.read<TestPacketCubit>().calculateSectionScore(
              sectionType: state.section.sectionType,
              totalCorrect: state.totalCorrect,
            );
      },
      listenWhen: (previous, current) =>
          previous.status == TestSectionStatus.success &&
          current.status == TestSectionStatus.done,
      builder: (context, state) {
        switch (state.section.sectionType) {
          case SectionType.listening:
            return Result(
              tesSection: "Listening",
              correctCount: state.totalCorrect,
              wrongCount: state.totalIncorrect,
            );
          case SectionType.structure:
            return Result(
              tesSection: "Structure and Written",
              correctCount: state.totalCorrect,
              wrongCount: state.totalIncorrect,
            );
          case SectionType.reading:
            return Result(
              tesSection: "Reading",
              correctCount: state.totalCorrect,
              wrongCount: state.totalIncorrect,
            );
          case SectionType.unknown:
            return const SizedBox();
        }
      },
    );
  }
}
