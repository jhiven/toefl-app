import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/state/test_packet/test_packet_cubit.dart';
import 'package:toefl_app/domain/state/user/user_cubit.dart';
import 'package:toefl_app/presentation/screens/profile_screen.dart';
import 'package:toefl_app/presentation/screens/test_screen.dart';

class HomeTest extends StatelessWidget {
  const HomeTest({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Profile(),
                  ),
                );
              },
            ),
          ],
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
                    ElevatedButton(
                      onPressed: () {
                        final packetCubit =
                            context.read<TestPacketCubit>().state;

                        switch (packetCubit) {
                          case TestPacketAnswering():
                            break;
                          default:
                            context.read<TestPacketCubit>().startTest();
                        }
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const TestScreen(),
                          ),
                        );
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
      ),
    );
  }
}
