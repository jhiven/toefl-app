import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toefl_app/learn/pages/readtestanswer_page.dart';

class Atest extends StatefulWidget {
  const Atest({super.key});

  @override
  State<Atest> createState() => _AtestState();
}

class _AtestState extends State<Atest> {
  bool isClicked = false;

  void toggleBorder() {
    setState(() {
      isClicked = !isClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final borderStyle =
        isClicked ? const BorderSide(color: Colors.blue, width: 2) : null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reading Test'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 40.0),
                child: RichText(
                  text: TextSpan(
                    text: 'Once upon a time...',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0, // Jarak 5 dari kiri dan kanan
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 10,
                child: ElevatedButton(
                  onPressed: toggleBorder,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE3EDFF),
                    side: borderStyle,
                    elevation: 4.0, // Set a low elevation for a subtle shadow
                  ),
                  child: const Text(
                    'A. Willowbrook',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 15.0), // Jarak 5 dari kiri dan kanan
              child: SizedBox(
                width: MediaQuery.of(context).size.width -
                    10, // Lebar tombol, dengan spasi 5 di kiri dan kanan
                child: ElevatedButton(
                  onPressed: toggleBorder,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE3EDFF),
                    side: borderStyle,
                    elevation: 4.0,
                  ),
                  child: const Text(
                    'B. Mistwood',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 10,
                child: ElevatedButton(
                  onPressed: toggleBorder,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE3EDFF),
                    side: borderStyle,
                    elevation: 4.0,
                  ),
                  child: const Text(
                    'C. Fernhaven',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 10,
                child: ElevatedButton(
                  onPressed: toggleBorder,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE3EDFF),
                    side: borderStyle,
                    elevation: 4.0,
                  ),
                  child: const Text(
                    'D. Fernhaven',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ]),
          const SizedBox(height: 20),
          const Spacer(), // Memastikan tombol "Check" berada di bagian bawah
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Answer()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF14487A),
                padding: const EdgeInsets.symmetric(horizontal: 150.0),
              ),
              child: const Text(
                'Check',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
