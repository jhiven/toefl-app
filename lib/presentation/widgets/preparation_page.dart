import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/state/test_section/test_section_cubit.dart';
import 'package:toefl_app/presentation/widgets/audio_player.dart';
import 'package:toefl_app/presentation/widgets/primary_button.dart';

class PreparationPage extends StatefulWidget {
  final String heading;
  final String desc;
  final String? url;

  const PreparationPage({
    Key? key,
    required this.heading,
    required this.desc,
    this.url,
  }) : super(key: key);

  @override
  State<PreparationPage> createState() => _PreparationPageState();
}

class _PreparationPageState extends State<PreparationPage> {
  late MediaQueryData queryData;

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(padding: EdgeInsets.only(top: 50)),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            widget.heading,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 24,
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
              fontSize: 18,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              widget.desc,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.url != null) ...[
                    AudioPlayerWidget(url: widget.url!),
                  ],
                  Spacer(),
                  PrimaryButton(
                    textButton: "Start",
                    onPressed: () {
                      context.read<TestSectionCubit>().startSection();
                    },
                  ),
                ]),
          ),
        ),
      ],
    );
  }
}
