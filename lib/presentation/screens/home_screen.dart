import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/state/authentication_cubit.dart';
import 'package:toefl_app/domain/state/user_cubit.dart';
import 'package:toefl_app/presentation/screens/login_screen.dart';
import 'package:toefl_app/widgets/primary_button.dart';
import 'package:toefl_app/widgets/secondary_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          switch (state) {
            case UserFetchSucess():
              return ListView(
                padding: const EdgeInsets.all(12),
                children: [
                  Text('user: ${state.user}'),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthenticationCubit>().logout();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text('Logout'),
                  ),
                  const PrimaryButton(
                    text: "Next",
                    icon: Icons.add,
                  ),
                  const SecondaryButton(
                    opsi: 'A',
                    text:
                        'Lorem Ipsum Dolor Imet Komat kamit jkdfhjk ahjfjksdhf asdjfh dshjkafh ahsdhf',
                  )
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
