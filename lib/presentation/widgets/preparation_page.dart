import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/state/test_section/test_section_cubit.dart';
import 'package:toefl_app/presentation/widgets/audio_player.dart';
import 'package:toefl_app/presentation/widgets/primary_button.dart';

class PreparationPage extends StatelessWidget {
  final String heading;
  final String desc;
  final String? url;

  const PreparationPage({
    super.key,
    required this.heading,
    required this.desc,
    this.url,
  });

  @override
  Widget build(BuildContext context) {
    late MediaQueryData queryData = MediaQuery.of(context);
    return SizedBox(
      width: queryData.size.width,
      height: queryData.size.height - queryData.padding.top - 82,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Padding(padding: EdgeInsets.only(top: 50)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              heading,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Section Preparation',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 24,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                desc,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (url != null) ...[
                    AudioPlayerWidget(url: url!),
                  ],
                  const Spacer(),
                  PrimaryButton(
                    text: "Start",
                    onPressed: () {
                      context.read<TestSectionCubit>().startSection();
                    },
                    icon: null,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
