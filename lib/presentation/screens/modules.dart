import 'package:flutter/material.dart';

class Modules extends StatefulWidget {
  const Modules({Key? key}) : super(key: key);

  @override
  State<Modules> createState() => _ModulesState();
}

class _ModulesState extends State<Modules> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text(
          'Modules',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/5437683.png',
                width: 330,
                height: 308.89,
              ),
            ),
            Text(
              'Pick Your Modules',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: InkWell(
                onTap: () {
                  print('Container ditekan');
                },
                child: Container(
                  height: 92,
                  decoration: BoxDecoration(
                    color: Color(0xFF14487A),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Image.asset(
                          'assets/solar_book-outline.png',
                          width: 55, // Ubah lebar gambar
                          height: 55, // Ubah tinggi gambar
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Text(
                        'Reading',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              title: InkWell(
                onTap: () {
                  print('Container ditekan');
                },
                child: Container(
                  height: 92,
                  decoration: BoxDecoration(
                    color: Color(0xFF14487A),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Image.asset(
                          'assets/Group.png',
                          width: 55, // Ubah lebar gambar
                          height: 55, // Ubah tinggi gambar
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Text(
                        'Listening',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              title: InkWell(
                onTap: () {
                  print('Container ditekan');
                },
                child: Container(
                  height: 92,
                  decoration: BoxDecoration(
                    color: Color(0xFF14487A),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Image.asset(
                          'assets/tabler_text-grammar.png',
                          width: 55, // Ubah lebar gambar
                          height: 55, // Ubah tinggi gambar
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Text(
                        'Grammar',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
