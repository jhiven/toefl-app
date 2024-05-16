import 'package:flutter/material.dart';
import 'package:toefl_app/presentation/screens/listening_direction.dart';

class HomeTest extends StatelessWidget {
  const HomeTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const BackButtonIcon(),
          color: const Color(0xFF14487A),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 110,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: 'TOEFL ',
                            style: TextStyle(color: Color(0xFF14487A)),
                          ),
                          TextSpan(
                            text: 'PENS',
                            style: TextStyle(color: Color(0xFFF6C410)),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      'Test',
                      style: TextStyle(
                          color: Color(0xFF14487A),
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Center(
              child: Text(
                'You Have 3 Times of Chance to Test',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF14487A),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15, left: 35, bottom: 20),
            child: Text(
              'Credit : x ',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF14487A),
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  width: 350,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ListeningPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: const Color(0xFF14487A),
                    ),
                    child: const Text(
                      'Start Test',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 350,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Color(0xFF14487A)),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Get Pro',
                          style: TextStyle(
                            color: Color(0xFF14487A),
                          ),
                        ),
                        Icon(
                          Icons.workspace_premium,
                          color: Color(0xFFF6C410),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
