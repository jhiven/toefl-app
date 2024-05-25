import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/state/test_packet/test_packet_cubit.dart';
import 'package:toefl_app/domain/state/test_section/test_section_cubit.dart';
import 'package:toefl_app/domain/state/user/user_cubit.dart';
import 'package:toefl_app/presentation/screens/test_screen.dart';

class HomeTest extends StatelessWidget {
  const HomeTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const BackButtonIcon(),
          color: const Color(0xFF14487A),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 64),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: 'TOEFL ',
                            style: TextStyle(color: Color(0xFF14487A)),
                          ),
                          TextSpan(
                            text: 'PENS',
                            style: TextStyle(color: Color(0xFFF6C410)),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      'Test',
                      style: TextStyle(
                        color: Color(0xFF14487A),
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    )
                  ],
                ),
              ),
            ),
            BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                switch (state) {
                  case UserFetchSucess():
                    return Text(
                      'You Have ${state.user.testRemaining} Times of Chance to Test',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color(0xFF14487A),
                        fontWeight: FontWeight.w400,
                      ),
                    );
                  default:
                    return const SizedBox();
                }
              },
            ),
            const SizedBox(
              height: 8,
            ),
            BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                switch (state) {
                  case UserFetchSucess():
                    return Text(
                      'Credit : ${state.user.testRemaining}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF14487A),
                        fontWeight: FontWeight.normal,
                      ),
                    );
                  default:
                    return const SizedBox();
                }
              },
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: Column(
                children: [
                  BlocListener<TestPacketCubit, TestPacketState>(
                    listener: (context, state) {
                      switch (state) {
                        case TestPacketAnswering():
                          context.read<TestSectionCubit>().setTestSection(
                                section: state.currentSection,
                              );
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const TestScreen(),
                            ),
                          );
                        case TestPacketError():
                          BotToast.showNotification(
                            backgroundColor:
                                Theme.of(context).colorScheme.errorContainer,
                            title: (cancelFunc) => Text(
                              state.errorMsg,
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onErrorContainer,
                              ),
                            ),
                          );
                        default:
                          break;
                      }
                    },
                    listenWhen: (previous, current) =>
                        previous != current && previous is TestPacketLoading,
                    child: ElevatedButton(
                      onPressed: () async {
                        final prevPacketCubit =
                            context.read<TestPacketCubit>().state;

                        switch (prevPacketCubit) {
                          case TestPacketAnswering():
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const TestScreen(),
                              ),
                            );
                            break;
                          default:
                            context.read<TestPacketCubit>().startTest();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: const Color(0xFF14487A),
                      ),
                      child: const Text(
                        'Start Test',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Color(0xFF14487A)),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Get Pro',
                          style: TextStyle(
                            color: Color(0xFF14487A),
                          ),
                        ),
                        Icon(
                          Icons.workspace_premium,
                          color: Color(0xFFF6C410),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
