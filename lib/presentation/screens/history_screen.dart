import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Color(0xFF39608F),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'History',
              style: TextStyle(
                fontSize: 28.74,
                fontWeight: FontWeight.bold,
                color: Color(0xFF39608F),
              ),
            ),
            Container(
              width: 400,
              height: 150,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFc6d1dc),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 15),
                          child: Text(
                            '1 Mei 2024',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: Row(
                            children: [
                              Text(
                                'Listening',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(width: 100),
                              Text(
                                ': 91', // Nilai yang ingin ditambahkan
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, left: 10),
                          child: Row(
                            children: [
                              Text(
                                'Structure and Written',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(width: 10),
                              Text(
                                ': 98', // Nilai yang ingin ditambahkan
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, left: 10),
                          child: Row(
                            children: [
                              Text(
                                'Reading',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(width: 106),
                              Text(
                                ': 88', // Nilai yang ingin ditambahkan
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Text(
                          'Score', // Teks yang ditambahkan di luar container
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: 120, // Atur lebar Container kedua
                        height: 80, // Atur tinggi Container kedua
                        margin:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            '676',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
