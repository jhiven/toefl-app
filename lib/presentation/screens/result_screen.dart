import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double listeningScore;
  final double structureScore;
  final double readingScore;
  final double totalScore;

  const ResultPage({
    super.key,
    required this.listeningScore,
    required this.structureScore,
    required this.readingScore,
    required this.totalScore,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'RESULT ',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF39608F), // Warna biru
                        ),
                      ),
                      TextSpan(
                        text: 'SCORE',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF39608F), // Warna kuning
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'TOEFL ',
                        style: TextStyle(
                          fontSize: 28.74,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF39608F),
                        ),
                      ),
                      TextSpan(
                        text: 'PENS',
                        style: TextStyle(
                          fontSize: 28.74,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF6C410),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            // width: 400,
            // height: 186.55,
            decoration: BoxDecoration(
              color: const Color(0xFFffffff),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xFF39608F),
                width: 2,
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Listening Comprehention',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF39608F),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Structure and Written',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF39608F),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Reading and Comprehension',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF39608F),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Total Score',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF39608F),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      ':',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      ':',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      ':',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      ':',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      '88', // Nilai yang ingin ditambahkan
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF39608F),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      '88', // Nilai yang ingin ditambahkan
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF39608F),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      '88', // Nilai yang ingin ditambahkan
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF39608F),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '676', // Nilai yang ingin ditambahkan
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF39608F),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color(0xFF39608F), // Warna latar belakang tombol
                padding: const EdgeInsets.symmetric(vertical: 12),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              child: const Center(
                child: Text(
                  'Back to Home',
                  style: TextStyle(color: Color(0xffffffff)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
