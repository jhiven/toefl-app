import 'package:flutter/material.dart';
import 'package:toefl_app/presentation/screens/profile_screen.dart';
import 'package:toefl_app/presentation/widgets/rangking.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({Key? key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> leaderboardData = [
      {
        'rank': 1,
        'name': 'Kimi',
        'score': 600,
        'imageUrl': 'https://via.placeholder.com/50'
      },
      {
        'rank': 2,
        'name': 'Hamilton',
        'score': 550,
        'imageUrl': 'https://via.placeholder.com/50'
      },
      {
        'rank': 3,
        'name': 'Verstappen',
        'score': 500,
        'imageUrl': 'https://via.placeholder.com/50'
      },
      {
        'rank': 4,
        'name': 'Vettel',
        'score': 450,
        'imageUrl': 'https://via.placeholder.com/50'
      },
      {
        'rank': 5,
        'name': 'Leclerc',
        'score': 400,
        'imageUrl': 'https://via.placeholder.com/50'
      },
      {
        'rank': 6,
        'name': 'Alonso',
        'score': 350,
        'imageUrl': 'https://via.placeholder.com/50'
      },
      {
        'rank': 7,
        'name': 'Norris',
        'score': 300,
        'imageUrl': 'https://via.placeholder.com/50'
      },
      {
        'rank': 8,
        'name': 'Russell',
        'score': 250,
        'imageUrl': 'https://via.placeholder.com/50'
      },
      {
        'rank': 9,
        'name': 'Ricciardo',
        'score': 200,
        'imageUrl': 'https://via.placeholder.com/50'
      },
      {
        'rank': 10,
        'name': 'Perez',
        'score': 150,
        'imageUrl': 'https://via.placeholder.com/50'
      },
      {
        'rank': 11,
        'name': 'Perez',
        'score': 150,
        'imageUrl': 'https://via.placeholder.com/50'
      },
      {
        'rank': 12,
        'name': 'Perez',
        'score': 150,
        'imageUrl': 'https://via.placeholder.com/50'
      },
      {
        'rank': 13,
        'name': 'Perez',
        'score': 150,
        'imageUrl': 'https://via.placeholder.com/50'
      },
      {
        'rank': 14,
        'name': 'Perez',
        'score': 150,
        'imageUrl': 'https://via.placeholder.com/50'
      },
    ];

    return SafeArea(
      child: Scaffold(
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: leaderboardData.length,
                itemBuilder: (context, index) {
                  final item = leaderboardData[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: Rangking(
                      rank: item['rank'],
                      name: item['name'],
                      score: item['score'],
                      imageUrl: item['imageUrl'],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
