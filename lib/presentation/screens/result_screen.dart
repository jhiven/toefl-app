import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Container(
                width: 400,
                height: 186.55,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFffffff),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xFF39608F),
                    width: 2,
                  ),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        children: [
                          Text(
                            'Listening Comprehention',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF39608F),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 70),
                            child: Text(
                              ':',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '91', // Nilai yang ingin ditambahkan
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF39608F),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        children: [
                          Text(
                            'Structure and Written',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF39608F),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 98),
                            child: Text(
                              ':',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF39608F),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '98', // Nilai yang ingin ditambahkan
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF39608F),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        children: [
                          Text(
                            'Reading Comprehention',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF39608F),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 78),
                            child: Text(
                              ':',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF39608F),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '88', // Nilai yang ingin ditambahkan
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF39608F),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 20),
                      child: Row(
                        children: [
                          Text(
                            'Total Score',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF39608F),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 150),
                            child: Text(
                              ':',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF39608F),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '676', // Nilai yang ingin ditambahkan
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF39608F),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Color(0xFF39608F), // Warna latar belakang tombol
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
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
      ),
    );
  }
}
