import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Answer extends StatefulWidget {
  const Answer({super.key});

  @override
  State<Answer> createState() => _AtestState();
}

class _AtestState extends State<Answer> {
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
        title: const Text('answer key'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 40.0),
              child: RichText(
                text: const TextSpan(
                  text:
                      'Once upon a time, in a quaint little village nestled between rolling hills and lush forests, there lived a young girl named Elara. Elara was known throughout the village fo',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 50),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'A. Willowbrook',
                        style: TextStyle(color: Colors.black),
                      ),
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    ],
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
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'B. Mistwood',
                        style: TextStyle(color: Colors.black),
                      ),
                      Icon(
                        Icons.check, // Ganti dengan ikon centang
                        color: Colors.green, // Ganti warna sesuai kebutuhan
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'C. Willowbrook',
                    style: TextStyle(color: Colors.black),
                  ),
                  Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                ],
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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'D. Willowbrook',
                    style: TextStyle(color: Colors.black),
                  ),
                  Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: ElevatedButton(
            onPressed: () {
              // Button action
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
        const SizedBox(height: 20)
      ]),
    );
  }
}
