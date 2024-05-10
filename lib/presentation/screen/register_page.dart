import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Color(0xFF14487A),
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
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: const Color(0xFF14487A),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'already have a token? Login',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF14487A),
                        fontWeight: FontWeight.normal,
                      ),
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
