import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toefl_app/domain/state/test_leaderboard/test_leaderboard_cubit.dart';
import 'package:toefl_app/presentation/widgets/rangking.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
            Center(
              child: Text(
                'Leaderboard',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  letterSpacing: 2,
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Expanded(
              child: BlocBuilder<TestLeaderboardCubit, TestLeaderboardState>(
                builder: (context, state) {
                  switch (state) {
                    case TestLeaderboardInitial():
                    case TestLeaderboardLoading():
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case TestLeaderboardSuccess():
                      return ListView.builder(
                        itemCount: state.leaderboards.length,
                        itemBuilder: (context, index) {
                          final item = state.leaderboards[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            child: Rangking(
                              rank: index + 1,
                              name: item.name,
                              score: item.totalScore,
                            ),
                          );
                        },
                      );
                    case TestLeaderboardError():
                      return Center(
                        child: Text(state.errorMSg),
                      );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
