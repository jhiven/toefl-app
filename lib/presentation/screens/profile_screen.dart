import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/state/user/user_cubit.dart';
import 'package:toefl_app/presentation/widgets/login_input.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            switch (state) {
              case UserInitial():
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case UserFetchSucess():
                return Column(
                  children: [
                    Container(
                      height: 246 + MediaQuery.of(context).padding.top,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xFF14487A),
                      ),
                      child: SafeArea(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.account_circle,
                              color: Colors.white,
                              size: 130,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              state.user.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 78,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          _profileField('Username', state.user.name),
                          _profileField('Email', state.user.email),
                          _profileField(
                            'Test Remaining',
                            state.user.testRemaining.toString(),
                          ),
                          const SizedBox(
                            height: 46,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.red)),
                              child: const Text(
                                "Logout",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              case UserFailed():
              case UserNoSession():
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}

_profileField(
  String heading,
  String initialValue,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        heading,
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 16),
      ),
      const SizedBox(
        height: 4,
      ),
      LoginInput(
        initialValue: initialValue,
        enabled: false,
      ),
      const SizedBox(
        height: 20,
      )
    ],
  );
}
