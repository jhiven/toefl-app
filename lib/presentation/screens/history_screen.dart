import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:toefl_app/domain/state/test_history/test_history_cubit.dart';
import 'package:toefl_app/domain/state/user/user_cubit.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'History ',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'TOEFL',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            Center(
              child: BlocBuilder<TestHistoryCubit, TestHistoryState>(
                builder: (context, state) {
                  switch (state) {
                    case TestHistoryLoading():
                    case TestHistoryInitial():
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case TestHistorySuccess():
                      return RefreshIndicator(
                        onRefresh: () async {
                          final userId = (context.read<UserCubit>().state
                                  as UserFetchSucess)
                              .user
                              .userId;

                          return context
                              .read<TestHistoryCubit>()
                              .getHistory(userId: userId);
                        },
                        child: ListView.builder(
                          itemCount: state.historyList.length,
                          itemBuilder: (context, index) {
                            final history = state.historyList[index];

                            return _historyCard(
                              date: history.date,
                              listeningScore: history.listeningScore,
                              readingScore: history.readingScore,
                              structureScore: history.structureScore,
                              totalScore: history.listeningScore +
                                  history.readingScore +
                                  history.structureScore,
                            );
                          },
                        ),
                      );
                    case TestHistoryError():
                      return Text(state.errorMSg);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _historyCard({
    required DateTime date,
    required int listeningScore,
    required int readingScore,
    required int structureScore,
    required int totalScore,
  }) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFc6d1dc),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMMd('id_ID').format(date),
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Listening',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Structure and Written',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Reading',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ':',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 6),
                        Text(
                          ':',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 6),
                        Text(
                          ':',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          listeningScore.toString(),
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          structureScore.toString(),
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          readingScore.toString(),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Score',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      totalScore.toString(),
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
