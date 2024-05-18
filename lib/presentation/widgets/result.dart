import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/state/test_packet/test_packet_cubit.dart';
import 'package:toefl_app/presentation/widgets/primary_button.dart';

class Result extends StatelessWidget {
  final String tesSection;
  final int? correctCount;
  final int? wrongCount;

  const Result({
    Key? key,
    required this.tesSection,
    this.correctCount,
    this.wrongCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 20.0),
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 30)),
              Text(
                "${tesSection} Comprehension Section",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none),
              ),
              const Padding(padding: EdgeInsets.only(top: 50)),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.check_circle,
                                size: 30, color: Colors.green),
                            Icon(Icons.close, size: 30, color: Colors.red),
                          ],
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Correct: ${correctCount ?? 0}',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 30,
                                  decoration: TextDecoration.none),
                            ),
                            Text(
                              'Wrong  : ${wrongCount ?? 0}',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 30,
                                  decoration: TextDecoration.none),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: PrimaryButton(
                    text: "Next Section",
                    icon: null,
                    onPressed: () {
                      context.read<TestPacketCubit>().nextSection();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
