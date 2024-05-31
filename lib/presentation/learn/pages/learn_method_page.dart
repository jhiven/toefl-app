import 'package:flutter/material.dart';
import 'package:toefl_app/presentation/learn/pages/mini_games.dart';
import 'package:toefl_app/presentation/learn/pages/modules.dart';
import 'package:toefl_app/presentation/learn/widget/customListTile.dart';

class LearnMainMethod extends StatefulWidget {
  const LearnMainMethod({super.key});

  @override
  State<LearnMainMethod> createState() => _LearnMainMethodState();
}

class _LearnMainMethodState extends State<LearnMainMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Learn',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/images/study.png',
                  width: 330,
                  height: 308.89,
                ),
              ),
              Text(
                'Pick Your Method',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Modules(),));
                  },
                  child: CustomListTile(
                    image: 'assets/images/buku.png',
                    title: 'Modules',
                    trailing: 0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MiniGames(),));
                  },
                  child: CustomListTile(
                    image: 'assets/images/games.png',
                    title: 'Mini Games',
                    trailing: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
