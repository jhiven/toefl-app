import 'package:flutter/material.dart';
import 'package:toefl_app/learn/widget/customListTile.dart';

class LearnMainMethod extends StatefulWidget {
  const LearnMainMethod({super.key});

  @override
  State<LearnMainMethod> createState() => _LearnMainMethodState();
}

class _LearnMainMethodState extends State<LearnMainMethod> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
            ),
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
              CustomListTile(
                image: 'assets/images/buku.png',
                title: 'Modules',
              ),
              CustomListTile(
                image: 'assets/images/games.png',
                title: 'Mini Games',
              ),
              // Tambahkan CustomListTile lainnya sesuai kebutuhan
            ],
          ),
        ),
      ),
    );
  }
}
