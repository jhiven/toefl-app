import 'package:flutter/material.dart';
import 'package:toefl_app/presentation/screens/history_screen.dart';
import 'package:toefl_app/presentation/screens/home_page.dart';
import 'package:toefl_app/presentation/screens/home_tests.dart';
import 'package:toefl_app/presentation/screens/leaderboard.dart';
import 'package:toefl_app/presentation/widgets/custom_navigation.dart';

class NavigationBottom extends StatefulWidget {
  const NavigationBottom({super.key});

  @override
  State<NavigationBottom> createState() => _NavigationBottomState();
}

class _NavigationBottomState extends State<NavigationBottom> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(
        currentPageIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
      body: <Widget>[
        const HomeTest(),
        const HomePage(),
        const Leaderboard(),
        const HistoryPage(),
      ][currentPageIndex],
    );
  }
}
