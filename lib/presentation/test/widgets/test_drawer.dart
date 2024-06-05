import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/models/test_answer_model.dart';
import 'package:toefl_app/domain/state/test_section/test_section_cubit.dart';
import 'package:toefl_app/utils/extensions.dart';

class TestDrawer extends StatelessWidget {
  const TestDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/icon/icon.png',
                    height: 80,
                    width: 80,
                  ),
                  Text(
                    'TOEFL ',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'PENS',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              BlocBuilder<TestSectionCubit, TestSectionState>(
                builder: (context, state) {
                  return GridView.count(
                    shrinkWrap: true,
                    primary: false,
                    padding: EdgeInsets.zero,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 5,
                    children: state.section.questionList
                        .mapIndexed((e, i) => e == state.currentQuestion
                            ? _selectedQuestionButton(theme, i, context,
                                e.selectedAnswer != TestAnswerModel.empty)
                            : _questionButton(theme, i, context,
                                e.selectedAnswer != TestAnswerModel.empty))
                        .toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _questionButton(
    ThemeData theme,
    int index,
    BuildContext context,
    bool isDone,
  ) {
    return GestureDetector(
      onTap: () {
        context.read<TestSectionCubit>().setQuestion(index: index);
        Navigator.pop(context);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isDone
              ? Colors.green.shade300
              : theme.colorScheme.tertiaryContainer,
        ),
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Text(
            "${index + 1}",
            style: TextStyle(
              color: theme.colorScheme.onTertiaryContainer,
              fontSize: theme.textTheme.titleSmall!.fontSize,
            ),
          ),
        ),
      ),
    );
  }

  Widget _selectedQuestionButton(
    ThemeData theme,
    int index,
    BuildContext context,
    bool isDone,
  ) {
    return GestureDetector(
      onTap: () {
        context.read<TestSectionCubit>().setQuestion(index: index);
        Navigator.pop(context);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: theme.colorScheme.primary,
            width: 2,
          ),
          color: isDone
              ? Colors.green.shade300
              : theme.colorScheme.tertiaryContainer,
        ),
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Text(
            "${index + 1}",
            style: TextStyle(
              color: theme.colorScheme.onTertiaryContainer,
              fontSize: theme.textTheme.titleSmall!.fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
