import 'package:flutter/material.dart';

class MiniGames extends StatefulWidget {
  const MiniGames({Key? key}) : super(key: key);

  @override
  State<MiniGames> createState() => _MiniGamesState();
}

class _MiniGamesState extends State<MiniGames> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text(
          'Mini Games',
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
                'assets/mg.jpg',
                width: 330,
                height: 308.89,
              ),
            ),
            Text(
              'Pick Your Mini Games',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Align(
              alignment: Alignment.center,
              child: ListTile(
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
                            'assets/iconoir_search-font.png',
                            width: 55, // Ubah lebar gambar
                            height: 55, // Ubah tinggi gambar
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Text(
                          'Synonym',
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
            ),
            Align(
              alignment: Alignment.center,
              child: ListTile(
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
                            'assets/card.png',
                            width: 55, // Ubah lebar gambar
                            height: 55, // Ubah tinggi gambar
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Text(
                          'Flip Card',
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
            ),
            Align(
              alignment: Alignment.center,
              child: ListTile(
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
                            'assets/Vector.png',
                            width: 55, // Ubah lebar gambar
                            height: 55, // Ubah tinggi gambar
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Text(
                          'Pick Words',
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
            ),
          ],
        ),
      ),
    );
  }
}
