import 'package:flutter/material.dart';
import 'package:toefl_app/learn/widget/audioplayer.dart';
import 'package:toefl_app/learn/widget/answer_widget.dart'; // Import widget GridViewWidget yang telah Anda buat

class AudioPage extends StatelessWidget {
  const AudioPage({Key? key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('Audio Player Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 80),
          Text(
            'Audio Player',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          // Memanggil widget MusicPlayer
          MusicPlayer(
            url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
          ),
          SizedBox(height: 50),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2, // Jumlah item per baris
              children: [
                // Menggunakan widget BoxItem
                BoxItem(text: 'A'),
                BoxItem(text: 'B'),
                BoxItem(text: 'C'),
                BoxItem(text: 'D'),
              ],
            ),
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
            Container(
              height: 50, // Sesuaikan dengan tinggi yang diinginkan
              color: const Color.fromARGB(255, 31, 127, 205),
              child: Center(
                child: Text(
                  'Check',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
          ),
        ],
      ),
    );
  }
}
